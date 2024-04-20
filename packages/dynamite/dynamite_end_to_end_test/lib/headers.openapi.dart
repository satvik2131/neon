// OpenAPI client generated by Dynamite. Do not manually edit this file.

// ignore_for_file: camel_case_extensions, camel_case_types, discarded_futures
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: non_constant_identifier_names, public_member_api_docs
// ignore_for_file: unreachable_switch_case, unused_element

/// headers test Version: 0.0.1.
library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:typed_data';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' as _i5;
import 'package:dynamite_runtime/built_value.dart' as _i4;
import 'package:dynamite_runtime/http_client.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:meta/meta.dart' as _i2;

part 'headers.openapi.g.dart';

class $Client extends _i1.DynamiteClient {
  /// Creates a new `DynamiteClient` for untagged requests.
  $Client(
    super.baseURL, {
    super.httpClient,
  });

  /// Creates a new [$Client] from another [client].
  $Client.fromClient(_i1.DynamiteClient client)
      : super(
          client.baseURL,
          httpClient: client.httpClient,
          authentications: client.authentications,
        );

  /// Builds a serializer to parse the response of [$$get_Request].
  @_i2.experimental
  _i1.DynamiteSerializer<void, GetHeaders> $$get_Serializer() => _i1.DynamiteSerializer(
        bodyType: null,
        headersType: const FullType(GetHeaders),
        serializers: _$jsonSerializers,
        validStatuses: const {200},
      );

  /// Returns a `DynamiteRequest` backing the [$get] operation.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: Returns a header only
  ///
  /// See:
  ///  * [$get] for a method executing this request and parsing the response.
  ///  * [$$get_Serializer] for a converter to parse the `Response` from an executed this request.
  @_i2.experimental
  _i3.Request $$get_Request() {
    const _path = '/';
    final _uri = Uri.parse('$baseURL$_path');
    final _request = _i3.Request('get', _uri);
    return _request;
  }

  /// Returns a [Future] containing a `DynamiteResponse` with the status code, deserialized body and headers.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: Returns a header only
  ///
  /// See:
  ///  * [$$get_Request] for the request send by this method.
  ///  * [$$get_Serializer] for a converter to parse the `Response` from an executed request.
  Future<_i1.DynamiteResponse<void, GetHeaders>> $get() async {
    final _request = $$get_Request();
    final _response = await httpClient.send(_request);

    final _serializer = $$get_Serializer();
    final _rawResponse = await _i1.ResponseConverter<void, GetHeaders>(_serializer).convert(_response);
    return _i1.DynamiteResponse.fromRawResponse(_rawResponse);
  }

  /// Builds a serializer to parse the response of [$withContentOperationId_Request].
  @_i2.experimental
  _i1.DynamiteSerializer<void, WithContentOperationIdHeaders> $withContentOperationId_Serializer() =>
      _i1.DynamiteSerializer(
        bodyType: null,
        headersType: const FullType(WithContentOperationIdHeaders),
        serializers: _$jsonSerializers,
        validStatuses: const {200},
      );

  /// Returns a `DynamiteRequest` backing the [withContentOperationId] operation.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: Returns a header only
  ///
  /// See:
  ///  * [withContentOperationId] for a method executing this request and parsing the response.
  ///  * [$withContentOperationId_Serializer] for a converter to parse the `Response` from an executed this request.
  @_i2.experimental
  _i3.Request $withContentOperationId_Request() {
    const _path = '/with_content/operation_id';
    final _uri = Uri.parse('$baseURL$_path');
    final _request = _i3.Request('get', _uri);
    return _request;
  }

  /// Returns a [Future] containing a `DynamiteResponse` with the status code, deserialized body and headers.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: Returns a header only
  ///
  /// See:
  ///  * [$withContentOperationId_Request] for the request send by this method.
  ///  * [$withContentOperationId_Serializer] for a converter to parse the `Response` from an executed request.
  Future<_i1.DynamiteResponse<void, WithContentOperationIdHeaders>> withContentOperationId() async {
    final _request = $withContentOperationId_Request();
    final _response = await httpClient.send(_request);

    final _serializer = $withContentOperationId_Serializer();
    final _rawResponse =
        await _i1.ResponseConverter<void, WithContentOperationIdHeaders>(_serializer).convert(_response);
    return _i1.DynamiteResponse.fromRawResponse(_rawResponse);
  }

  /// Builds a serializer to parse the response of [$getWithContent_Request].
  @_i2.experimental
  _i1.DynamiteSerializer<Uint8List, GetWithContentHeaders> $getWithContent_Serializer() => _i1.DynamiteSerializer(
        bodyType: const FullType(Uint8List),
        headersType: const FullType(GetWithContentHeaders),
        serializers: _$jsonSerializers,
        validStatuses: const {200},
      );

  /// Returns a `DynamiteRequest` backing the [getWithContent] operation.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: Returns both a header and a body.
  ///
  /// See:
  ///  * [getWithContent] for a method executing this request and parsing the response.
  ///  * [$getWithContent_Serializer] for a converter to parse the `Response` from an executed this request.
  @_i2.experimental
  _i3.Request $getWithContent_Request() {
    const _path = '/with_content';
    final _uri = Uri.parse('$baseURL$_path');
    final _request = _i3.Request('get', _uri);
    _request.headers['Accept'] = 'application/octet-stream';
    return _request;
  }

  /// Returns a [Future] containing a `DynamiteResponse` with the status code, deserialized body and headers.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200: Returns both a header and a body.
  ///
  /// See:
  ///  * [$getWithContent_Request] for the request send by this method.
  ///  * [$getWithContent_Serializer] for a converter to parse the `Response` from an executed request.
  Future<_i1.DynamiteResponse<Uint8List, GetWithContentHeaders>> getWithContent() async {
    final _request = $getWithContent_Request();
    final _response = await httpClient.send(_request);

    final _serializer = $getWithContent_Serializer();
    final _rawResponse = await _i1.ResponseConverter<Uint8List, GetWithContentHeaders>(_serializer).convert(_response);
    return _i1.DynamiteResponse.fromRawResponse(_rawResponse);
  }
}

@BuiltValue(instantiable: false)
abstract interface class $GetHeadersInterface {
  @BuiltValueField(wireName: 'my-header')
  String? get myHeader;
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($GetHeadersInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($GetHeadersInterfaceBuilder b) {}
}

abstract class GetHeaders implements $GetHeadersInterface, Built<GetHeaders, GetHeadersBuilder> {
  /// Creates a new GetHeaders object using the builder pattern.
  factory GetHeaders([void Function(GetHeadersBuilder)? b]) = _$GetHeaders;

  const GetHeaders._();

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  factory GetHeaders.fromJson(Map<String, dynamic> json) => _$jsonSerializers.deserializeWith(serializer, json)!;

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  /// Serializer for GetHeaders.
  static Serializer<GetHeaders> get serializer => _$getHeadersSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetHeadersBuilder b) {
    $GetHeadersInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(GetHeadersBuilder b) {
    $GetHeadersInterface._validate(b);
  }
}

@BuiltValue(instantiable: false)
abstract interface class $WithContentOperationIdHeadersInterface {
  @BuiltValueField(wireName: 'my-header')
  String? get myHeader;
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($WithContentOperationIdHeadersInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($WithContentOperationIdHeadersInterfaceBuilder b) {}
}

abstract class WithContentOperationIdHeaders
    implements
        $WithContentOperationIdHeadersInterface,
        Built<WithContentOperationIdHeaders, WithContentOperationIdHeadersBuilder> {
  /// Creates a new WithContentOperationIdHeaders object using the builder pattern.
  factory WithContentOperationIdHeaders([void Function(WithContentOperationIdHeadersBuilder)? b]) =
      _$WithContentOperationIdHeaders;

  const WithContentOperationIdHeaders._();

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  factory WithContentOperationIdHeaders.fromJson(Map<String, dynamic> json) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  /// Serializer for WithContentOperationIdHeaders.
  static Serializer<WithContentOperationIdHeaders> get serializer => _$withContentOperationIdHeadersSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(WithContentOperationIdHeadersBuilder b) {
    $WithContentOperationIdHeadersInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(WithContentOperationIdHeadersBuilder b) {
    $WithContentOperationIdHeadersInterface._validate(b);
  }
}

@BuiltValue(instantiable: false)
abstract interface class $GetWithContentHeadersInterface {
  @BuiltValueField(wireName: 'my-header')
  String? get myHeader;
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($GetWithContentHeadersInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($GetWithContentHeadersInterfaceBuilder b) {}
}

abstract class GetWithContentHeaders
    implements $GetWithContentHeadersInterface, Built<GetWithContentHeaders, GetWithContentHeadersBuilder> {
  /// Creates a new GetWithContentHeaders object using the builder pattern.
  factory GetWithContentHeaders([void Function(GetWithContentHeadersBuilder)? b]) = _$GetWithContentHeaders;

  const GetWithContentHeaders._();

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  factory GetWithContentHeaders.fromJson(Map<String, dynamic> json) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;

  /// Serializer for GetWithContentHeaders.
  static Serializer<GetWithContentHeaders> get serializer => _$getWithContentHeadersSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetWithContentHeadersBuilder b) {
    $GetWithContentHeadersInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(GetWithContentHeadersBuilder b) {
    $GetWithContentHeadersInterface._validate(b);
  }
}

// coverage:ignore-start
/// Serializer for all values in this library.
///
/// Serializes values into the `built_value` wire format.
/// See: [$jsonSerializers] for serializing into json.
@_i2.visibleForTesting
final Serializers $serializers = _$serializers;
final Serializers _$serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(GetHeaders), GetHeadersBuilder.new)
      ..add(GetHeaders.serializer)
      ..addBuilderFactory(const FullType(WithContentOperationIdHeaders), WithContentOperationIdHeadersBuilder.new)
      ..add(WithContentOperationIdHeaders.serializer)
      ..addBuilderFactory(const FullType(GetWithContentHeaders), GetWithContentHeadersBuilder.new)
      ..add(GetWithContentHeaders.serializer))
    .build();

/// Serializer for all values in this library.
///
/// Serializes values into the json. Json serialization is more expensive than the built_value wire format.
/// See: [$serializers] for serializing into the `built_value` wire format.
@_i2.visibleForTesting
final Serializers $jsonSerializers = _$jsonSerializers;
final Serializers _$jsonSerializers = (_$serializers.toBuilder()
      ..add(_i4.DynamiteDoubleSerializer())
      ..addPlugin(_i5.StandardJsonPlugin())
      ..addPlugin(const _i4.HeaderPlugin())
      ..addPlugin(const _i4.ContentStringPlugin()))
    .build();
// coverage:ignore-end
