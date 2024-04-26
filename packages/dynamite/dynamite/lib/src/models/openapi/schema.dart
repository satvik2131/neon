import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:dynamite/src/helpers/default_value.dart';
import 'package:dynamite/src/helpers/docs.dart';
import 'package:dynamite/src/helpers/logger.dart';
import 'package:dynamite/src/models/exceptions.dart';
import 'package:dynamite/src/models/openapi.dart';
import 'package:meta/meta.dart';
import 'package:rfc_6901/rfc_6901.dart';

part 'schema.g.dart';

abstract class Schema implements Built<Schema, SchemaBuilder> {
  factory Schema([void Function(SchemaBuilder) updates]) = _$Schema;

  const Schema._();

  static Serializer<Schema> get serializer => _$schemaSerializer;

  @BuiltValueField(wireName: r'$id')
  Uri? get id;

  @BuiltValueField(wireName: r'$ref')
  Uri? get ref;

  Schema resolveRef(Map<String, dynamic> json) {
    if (ref == null) {
      throw StateError(r'Referenced schema can only be resolved when a $ref is present');
    }

    final rootID = json[r'$id'] as String?;

    final Uri uri;
    if (rootID != null) {
      uri = Uri.parse(rootID).resolveUri(ref!);
    } else {
      uri = ref!;
    }

    // Only relative references are supported.
    final value = JsonPointer(uri.fragment).read(json);
    var schema = serializers.deserializeWith(serializer, value)!;
    if (schema.id == null) {
      schema = schema.rebuild((b) {
        b.id = uri;
      });
    }

    return schema;
  }

  BuiltList<Schema>? get oneOf;

  BuiltList<Schema>? get anyOf;

  BuiltList<Schema>? get allOf;

  BuiltList<Schema>? get ofs => oneOf ?? anyOf ?? allOf;

  @BuiltValueField(compare: false)
  String? get description;

  bool get deprecated;

  SchemaType? get type;

  String? get format;

  @BuiltValueField(wireName: 'default')
  @protected
  JsonObject? get rawDefault;

  @memoized
  String? get $default => encodeDefault(rawDefault);

  @memoized
  String? get defaultDescription => encodeDefault(rawDefault, constant: false);

  @BuiltValueField(wireName: 'enum')
  BuiltList<JsonObject>? get $enum;

  BuiltMap<String, Schema>? get properties;

  BuiltList<String> get required;

  Schema? get items;

  Schema? get additionalProperties;

  String? get contentMediaType;

  Schema? get contentSchema;

  Discriminator? get discriminator;

  String? get pattern;

  int? get minLength;

  int? get maxLength;

  int? get minItems;

  int? get maxItems;

  bool get nullable;

  @memoized
  bool get isContentString => type == SchemaType.string && contentMediaType != null && contentSchema != null;

  @memoized
  String? get formattedDescription => formatDescription(description);

  @BuiltValueHook(finalizeBuilder: true)
  static void _defaults(SchemaBuilder b) {
    b
      ..deprecated ??= false
      ..nullable ??= false;

    const allowedNumberFormats = [null, 'float', 'double'];
    if (b.type == SchemaType.number && !allowedNumberFormats.contains(b.format)) {
      throw OpenAPISpecError('Format "${b.format}" is not allowed for ${b.type}. Use one of $allowedNumberFormats.');
    }
    const allowedIntegerFormats = [null, 'int32', 'int64'];
    if (b.type == SchemaType.integer) {
      if (!allowedIntegerFormats.contains(b.format)) {
        throw OpenAPISpecError('Format "${b.format}" is not allowed for ${b.type}. Use one of $allowedIntegerFormats.');
      } else if (b.format != null) {
        dynamiteLog.integerPrecision();
      }
    }
  }
}

class SchemaType extends EnumClass {
  const SchemaType._(super.name);

  static const SchemaType boolean = _$schemaTypeBoolean;
  static const SchemaType integer = _$schemaTypeInteger;
  static const SchemaType number = _$schemaTypeNumber;
  static const SchemaType string = _$schemaTypeString;
  static const SchemaType array = _$schemaTypeArray;
  static const SchemaType object = _$schemaTypeObject;

  static BuiltSet<SchemaType> get values => _$schemaTypeValues;

  static SchemaType valueOf(String name) => _$schemaType(name);

  static Serializer<SchemaType> get serializer => _$schemaTypeSerializer;
}

/// A Schema value can be either a json boolean or object.
///
/// https://json-schema.org/understanding-json-schema/basics
class SchemaPlugin implements SerializerPlugin {
  const SchemaPlugin();

  @override
  Object? afterDeserialize(Object? object, FullType specifiedType) => object;

  @override
  Object? afterSerialize(Object? object, FullType specifiedType) => object;

  @override
  Object? beforeDeserialize(Object? object, FullType specifiedType) {
    if (specifiedType.root != Schema) {
      return object;
    }

    switch (object) {
      case null:
        return null;

      case bool _:
        if (object) {
          // An empty list in BuiltValue it equivalent to the empty json object.
          return [];
        } else {
          throw UnsupportedError('The never matching schema is not yet supported.');
        }

      default:
        return object;
    }
  }

  @override
  Object? beforeSerialize(Object? object, FullType specifiedType) => object;
}
