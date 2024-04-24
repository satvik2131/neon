import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart' hide log;
import 'package:checked_yaml/checked_yaml.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:dynamite/src/builder/client.dart';
import 'package:dynamite/src/builder/generate_ofs.dart';
import 'package:dynamite/src/builder/generate_schemas.dart';
import 'package:dynamite/src/builder/serializer.dart';
import 'package:dynamite/src/builder/state.dart';
import 'package:dynamite/src/helpers/docs.dart';
import 'package:dynamite/src/helpers/logger.dart';
import 'package:dynamite/src/helpers/version_checker.dart';
import 'package:dynamite/src/models/config.dart';
import 'package:dynamite/src/models/openapi.dart' as openapi;
import 'package:path/path.dart' as p;
import 'package:version/version.dart';

class OpenAPIBuilder implements Builder {
  OpenAPIBuilder(
    BuilderOptions options,
  ) : buildConfig = DynamiteConfig.fromJson(options.config);

  @override
  final buildExtensions = const {
    '.openapi.json': ['.openapi.dart'],
    '.openapi.yaml': ['.openapi.dart'],
  };

  /// The minimum openapi version supported by this builder.
  static final Version minSupportedVersion = Version(3, 0, 0);

  /// The maximum openapi version supported by this builder.
  static final Version maxSupportedVersion = minSupportedVersion.incrementMajor();

  /// The configuration for this builder.
  final DynamiteConfig buildConfig;

  @override
  Future<void> build(BuildStep buildStep) async {
    final result = await helperVersionCheck(buildStep);

    if (result.messages.isNotEmpty) {
      if (result.hasFatal) {
        log.severe(result.messages);
        return;
      } else {
        log.info(result.messages);
      }
    }

    final inputId = buildStep.inputId;
    final outputId = inputId.changeExtension('.dart');

    try {
      final json = switch (inputId.extension) {
        '.json' => jsonDecode(await buildStep.readAsString(inputId)) as Map<String, dynamic>,
        '.yaml' => checkedYamlDecode<Map<String, dynamic>>(
            await buildStep.readAsString(inputId),
            (m) => m!.cast(),
          ),
        _ => throw StateError('Openapi specs can only be yaml or json.'),
      };

      final spec = openapi.serializers.deserializeWith(
        openapi.OpenAPI.serializer,
        json,
      )!;

      final version = Version.parse(spec.version);
      if (version < minSupportedVersion || version > maxSupportedVersion) {
        throw Exception('Only OpenAPI between $minSupportedVersion and $maxSupportedVersion are supported.');
      }

      final config = buildConfig.configFor(inputId.path);
      final state = State(config, json);

      final output = Library((b) {
        final analyzerIgnores = state.buildConfig.analyzerIgnores;
        if (analyzerIgnores != null) {
          b.ignoreForFile.addAll(analyzerIgnores);
        }

        final comment = spec.info.license?.formattedDescription();
        if (comment != null) {
          b.comments.add(comment);
        }

        b
          ..generatedByComment = 'OpenAPI client generated by Dynamite. Do not manually edit this file.'
          ..docs.addAll(
            escapeDescription(spec.info.formattedDescription()),
          )
          ..directives.addAll([
            Directive.import('dart:convert'),
            Directive.import('dart:typed_data'),
            Directive.import('package:built_collection/built_collection.dart'),
            Directive.import('package:built_value/built_value.dart'),
            Directive.import('package:built_value/json_object.dart'),
            Directive.import('package:built_value/serializer.dart'),
            Directive.import('package:collection/collection.dart'),
            Directive.import('package:dynamite_runtime/models.dart'),
          ])
          ..body.addAll(generateClients(spec, state))
          ..body.addAll(generateSchemas(spec, state))
          ..body.addAll(buildOfsExtensions(spec, state))
          ..body.addAll(buildSerializer(state));

        // Part directive need to be generated after everything else so we know if we need it.
        if (state.hasResolvedBuiltTypes) {
          b.directives.add(
            Directive.part(p.basename(outputId.changeExtension('.g.dart').path)),
          );
        }

        if (state.buildConfig.experimental) {
          b.annotations.add(
            refer('experimental', 'package:meta/meta.dart'),
          );
        }
      });

      var outputString = output.accept(state.emitter).toString();

      final coverageIgnores = state.buildConfig.coverageIgnores;
      if (coverageIgnores != null) {
        for (final ignore in coverageIgnores) {
          final pattern = RegExp(ignore);

          outputString = outputString.replaceAllMapped(
            pattern,
            (match) => '  // coverage:ignore-start\n${match.group(0)}\n  // coverage:ignore-end',
          );
        }
      }

      final formatter = DartFormatter(pageWidth: buildConfig.pageWidth);
      unawaited(
        buildStep.writeAsString(
          outputId,
          formatter.format(outputString),
        ),
      );
    } catch (error, stackTrace) {
      log.severe(
        'Issue generating the library for $inputId',
        error,
        stackTrace,
      );

      rethrow;
    }
  }
}
