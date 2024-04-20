// Use of this source code is governed by a agpl license. It can be obtained at `https://spdx.org/licenses/AGPL-3.0-only.html`.

// OpenAPI client generated by Dynamite. Do not manually edit this file.

// ignore_for_file: camel_case_extensions, camel_case_types, discarded_futures
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: non_constant_identifier_names, public_member_api_docs
// ignore_for_file: unreachable_switch_case

/// files_reminders Version: 0.0.1.
///
/// Set file reminders.
///
/// Use of this source code is governed by a agpl license.
/// It can be obtained at `https://spdx.org/licenses/AGPL-3.0-only.html`.
library; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' as _i7;
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/built_value.dart' as _i6;
import 'package:dynamite_runtime/http_client.dart' as _i1;
import 'package:dynamite_runtime/utils.dart' as _i4;
import 'package:http/http.dart' as _i3;
import 'package:meta/meta.dart' as _i2;
import 'package:uri/uri.dart' as _i5;

part 'files_reminders.openapi.g.dart';

class $Client extends _i1.DynamiteClient {
  /// Creates a new `DynamiteClient` for untagged requests.
  $Client(
    super.baseURL, {
    super.httpClient,
    super.authentications,
  });

  /// Creates a new [$Client] from another [client].
  $Client.fromClient(_i1.DynamiteClient client)
      : super(
          client.baseURL,
          httpClient: client.httpClient,
          authentications: client.authentications,
        );

  late final $ApiClient api = $ApiClient(this);
}

class $ApiClient {
  /// Creates a new `DynamiteClient` for api requests.
  $ApiClient(this._rootClient);

  final $Client _rootClient;

  /// Builds a serializer to parse the response of [$$get_Request].
  @_i2.experimental
  _i1.DynamiteSerializer<ApiGetResponseApplicationJson, void> $$get_Serializer() => _i1.DynamiteSerializer(
        bodyType: const FullType(ApiGetResponseApplicationJson),
        headersType: null,
        serializers: _$jsonSerializers,
        validStatuses: const {200},
      );

  /// Get a reminder.
  ///
  /// Returns a `DynamiteRequest` backing the [$get] operation.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [version]
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder returned
  ///   * 401: User not found
  ///
  /// See:
  ///  * [$get] for a method executing this request and parsing the response.
  ///  * [$$get_Serializer] for a converter to parse the `Response` from an executed this request.
  @_i2.experimental
  _i3.Request $$get_Request({
    required String version,
    required int fileId,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, Object?>{};
    final $version = _$jsonSerializers.serialize(version, specifiedType: const FullType(String));
    _i4.checkPattern(
      $version as String?,
      RegExp(r'^1$'),
      'version',
    );
    _parameters['version'] = $version;

    final $fileId = _$jsonSerializers.serialize(fileId, specifiedType: const FullType(int));
    _parameters['fileId'] = $fileId;

    final _path = _i5.UriTemplate('/ocs/v2.php/apps/files_reminders/api/v{version}/{fileId}').expand(_parameters);
    final _uri = Uri.parse('${_rootClient.baseURL}$_path');
    final _request = _i3.Request('get', _uri);
    _request.headers['Accept'] = 'application/json';
// coverage:ignore-start
    final authentication = _rootClient.authentications?.firstWhereOrNull(
      (auth) => switch (auth) {
        _i1.DynamiteHttpBearerAuthentication() || _i1.DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _request.headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $oCSAPIRequest = _$jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _request.headers['OCS-APIRequest'] = const _i4.HeaderEncoder().convert($oCSAPIRequest);

    return _request;
  }

  /// Get a reminder.
  ///
  /// Returns a [Future] containing a `DynamiteResponse` with the status code, deserialized body and headers.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [version]
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder returned
  ///   * 401: User not found
  ///
  /// See:
  ///  * [$$get_Request] for the request send by this method.
  ///  * [$$get_Serializer] for a converter to parse the `Response` from an executed request.
  Future<_i1.DynamiteResponse<ApiGetResponseApplicationJson, void>> $get({
    required String version,
    required int fileId,
    bool? oCSAPIRequest,
  }) async {
    final _request = $$get_Request(
      version: version,
      fileId: fileId,
      oCSAPIRequest: oCSAPIRequest,
    );
    final _response = await _rootClient.httpClient.send(_request);

    final _serializer = $$get_Serializer();
    final _rawResponse =
        await _i1.ResponseConverter<ApiGetResponseApplicationJson, void>(_serializer).convert(_response);
    return _i1.DynamiteResponse.fromRawResponse(_rawResponse);
  }

  /// Builds a serializer to parse the response of [$$set_Request].
  @_i2.experimental
  _i1.DynamiteSerializer<ApiSetResponseApplicationJson, void> $$set_Serializer() => _i1.DynamiteSerializer(
        bodyType: const FullType(ApiSetResponseApplicationJson),
        headersType: null,
        serializers: _$jsonSerializers,
        validStatuses: const {200, 201, 400, 401, 404},
      );

  /// Set a reminder.
  ///
  /// Returns a `DynamiteRequest` backing the [$set] operation.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [dueDate] ISO 8601 formatted date time string.
  ///   * [version]
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder updated
  ///   * 201: Reminder created successfully
  ///   * 400: Creating reminder is not possible
  ///   * 401: User not found
  ///   * 404: File not found
  ///
  /// See:
  ///  * [$set] for a method executing this request and parsing the response.
  ///  * [$$set_Serializer] for a converter to parse the `Response` from an executed this request.
  @_i2.experimental
  _i3.Request $$set_Request({
    required String dueDate,
    required String version,
    required int fileId,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, Object?>{};
    final $dueDate = _$jsonSerializers.serialize(dueDate, specifiedType: const FullType(String));
    _parameters['dueDate'] = $dueDate;

    final $version = _$jsonSerializers.serialize(version, specifiedType: const FullType(String));
    _i4.checkPattern(
      $version as String?,
      RegExp(r'^1$'),
      'version',
    );
    _parameters['version'] = $version;

    final $fileId = _$jsonSerializers.serialize(fileId, specifiedType: const FullType(int));
    _parameters['fileId'] = $fileId;

    final _path =
        _i5.UriTemplate('/ocs/v2.php/apps/files_reminders/api/v{version}/{fileId}{?dueDate*}').expand(_parameters);
    final _uri = Uri.parse('${_rootClient.baseURL}$_path');
    final _request = _i3.Request('put', _uri);
    _request.headers['Accept'] = 'application/json';
// coverage:ignore-start
    final authentication = _rootClient.authentications?.firstWhereOrNull(
      (auth) => switch (auth) {
        _i1.DynamiteHttpBearerAuthentication() || _i1.DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _request.headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $oCSAPIRequest = _$jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _request.headers['OCS-APIRequest'] = const _i4.HeaderEncoder().convert($oCSAPIRequest);

    return _request;
  }

  /// Set a reminder.
  ///
  /// Returns a [Future] containing a `DynamiteResponse` with the status code, deserialized body and headers.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [dueDate] ISO 8601 formatted date time string.
  ///   * [version]
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder updated
  ///   * 201: Reminder created successfully
  ///   * 400: Creating reminder is not possible
  ///   * 401: User not found
  ///   * 404: File not found
  ///
  /// See:
  ///  * [$$set_Request] for the request send by this method.
  ///  * [$$set_Serializer] for a converter to parse the `Response` from an executed request.
  Future<_i1.DynamiteResponse<ApiSetResponseApplicationJson, void>> $set({
    required String dueDate,
    required String version,
    required int fileId,
    bool? oCSAPIRequest,
  }) async {
    final _request = $$set_Request(
      dueDate: dueDate,
      version: version,
      fileId: fileId,
      oCSAPIRequest: oCSAPIRequest,
    );
    final _response = await _rootClient.httpClient.send(_request);

    final _serializer = $$set_Serializer();
    final _rawResponse =
        await _i1.ResponseConverter<ApiSetResponseApplicationJson, void>(_serializer).convert(_response);
    return _i1.DynamiteResponse.fromRawResponse(_rawResponse);
  }

  /// Builds a serializer to parse the response of [$remove_Request].
  @_i2.experimental
  _i1.DynamiteSerializer<ApiRemoveResponseApplicationJson, void> $remove_Serializer() => _i1.DynamiteSerializer(
        bodyType: const FullType(ApiRemoveResponseApplicationJson),
        headersType: null,
        serializers: _$jsonSerializers,
        validStatuses: const {200, 401, 404},
      );

  /// Remove a reminder.
  ///
  /// Returns a `DynamiteRequest` backing the [remove] operation.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [version]
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder deleted successfully
  ///   * 401: User not found
  ///   * 404: Reminder not found
  ///
  /// See:
  ///  * [remove] for a method executing this request and parsing the response.
  ///  * [$remove_Serializer] for a converter to parse the `Response` from an executed this request.
  @_i2.experimental
  _i3.Request $remove_Request({
    required String version,
    required int fileId,
    bool? oCSAPIRequest,
  }) {
    final _parameters = <String, Object?>{};
    final $version = _$jsonSerializers.serialize(version, specifiedType: const FullType(String));
    _i4.checkPattern(
      $version as String?,
      RegExp(r'^1$'),
      'version',
    );
    _parameters['version'] = $version;

    final $fileId = _$jsonSerializers.serialize(fileId, specifiedType: const FullType(int));
    _parameters['fileId'] = $fileId;

    final _path = _i5.UriTemplate('/ocs/v2.php/apps/files_reminders/api/v{version}/{fileId}').expand(_parameters);
    final _uri = Uri.parse('${_rootClient.baseURL}$_path');
    final _request = _i3.Request('delete', _uri);
    _request.headers['Accept'] = 'application/json';
// coverage:ignore-start
    final authentication = _rootClient.authentications?.firstWhereOrNull(
      (auth) => switch (auth) {
        _i1.DynamiteHttpBearerAuthentication() || _i1.DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      _request.headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }

// coverage:ignore-end
    var $oCSAPIRequest = _$jsonSerializers.serialize(oCSAPIRequest, specifiedType: const FullType(bool));
    $oCSAPIRequest ??= true;
    _request.headers['OCS-APIRequest'] = const _i4.HeaderEncoder().convert($oCSAPIRequest);

    return _request;
  }

  /// Remove a reminder.
  ///
  /// Returns a [Future] containing a `DynamiteResponse` with the status code, deserialized body and headers.
  /// Throws a `DynamiteApiException` if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [version]
  ///   * [fileId] ID of the file.
  ///   * [oCSAPIRequest] Required to be true for the API request to pass. Defaults to `true`.
  ///
  /// Status codes:
  ///   * 200: Reminder deleted successfully
  ///   * 401: User not found
  ///   * 404: Reminder not found
  ///
  /// See:
  ///  * [$remove_Request] for the request send by this method.
  ///  * [$remove_Serializer] for a converter to parse the `Response` from an executed request.
  Future<_i1.DynamiteResponse<ApiRemoveResponseApplicationJson, void>> remove({
    required String version,
    required int fileId,
    bool? oCSAPIRequest,
  }) async {
    final _request = $remove_Request(
      version: version,
      fileId: fileId,
      oCSAPIRequest: oCSAPIRequest,
    );
    final _response = await _rootClient.httpClient.send(_request);

    final _serializer = $remove_Serializer();
    final _rawResponse =
        await _i1.ResponseConverter<ApiRemoveResponseApplicationJson, void>(_serializer).convert(_response);
    return _i1.DynamiteResponse.fromRawResponse(_rawResponse);
  }
}

@BuiltValue(instantiable: false)
abstract interface class $OCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($OCSMetaInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($OCSMetaInterfaceBuilder b) {}
}

abstract class OCSMeta implements $OCSMetaInterface, Built<OCSMeta, OCSMetaBuilder> {
  /// Creates a new OCSMeta object using the builder pattern.
  factory OCSMeta([void Function(OCSMetaBuilder)? b]) = _$OCSMeta;

  // coverage:ignore-start
  const OCSMeta._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory OCSMeta.fromJson(Map<String, dynamic> json) => _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for OCSMeta.
  static Serializer<OCSMeta> get serializer => _$oCSMetaSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OCSMetaBuilder b) {
    $OCSMetaInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(OCSMetaBuilder b) {
    $OCSMetaInterface._validate(b);
  }
}

@BuiltValue(instantiable: false)
abstract interface class $ApiGetResponseApplicationJson_Ocs_DataInterface {
  String? get dueDate;
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($ApiGetResponseApplicationJson_Ocs_DataInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($ApiGetResponseApplicationJson_Ocs_DataInterfaceBuilder b) {}
}

abstract class ApiGetResponseApplicationJson_Ocs_Data
    implements
        $ApiGetResponseApplicationJson_Ocs_DataInterface,
        Built<ApiGetResponseApplicationJson_Ocs_Data, ApiGetResponseApplicationJson_Ocs_DataBuilder> {
  /// Creates a new ApiGetResponseApplicationJson_Ocs_Data object using the builder pattern.
  factory ApiGetResponseApplicationJson_Ocs_Data([void Function(ApiGetResponseApplicationJson_Ocs_DataBuilder)? b]) =
      _$ApiGetResponseApplicationJson_Ocs_Data;

  // coverage:ignore-start
  const ApiGetResponseApplicationJson_Ocs_Data._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory ApiGetResponseApplicationJson_Ocs_Data.fromJson(Map<String, dynamic> json) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for ApiGetResponseApplicationJson_Ocs_Data.
  static Serializer<ApiGetResponseApplicationJson_Ocs_Data> get serializer =>
      _$apiGetResponseApplicationJsonOcsDataSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiGetResponseApplicationJson_Ocs_DataBuilder b) {
    $ApiGetResponseApplicationJson_Ocs_DataInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(ApiGetResponseApplicationJson_Ocs_DataBuilder b) {
    $ApiGetResponseApplicationJson_Ocs_DataInterface._validate(b);
  }
}

@BuiltValue(instantiable: false)
abstract interface class $ApiGetResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  ApiGetResponseApplicationJson_Ocs_Data get data;
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($ApiGetResponseApplicationJson_OcsInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($ApiGetResponseApplicationJson_OcsInterfaceBuilder b) {}
}

abstract class ApiGetResponseApplicationJson_Ocs
    implements
        $ApiGetResponseApplicationJson_OcsInterface,
        Built<ApiGetResponseApplicationJson_Ocs, ApiGetResponseApplicationJson_OcsBuilder> {
  /// Creates a new ApiGetResponseApplicationJson_Ocs object using the builder pattern.
  factory ApiGetResponseApplicationJson_Ocs([void Function(ApiGetResponseApplicationJson_OcsBuilder)? b]) =
      _$ApiGetResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ApiGetResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory ApiGetResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for ApiGetResponseApplicationJson_Ocs.
  static Serializer<ApiGetResponseApplicationJson_Ocs> get serializer => _$apiGetResponseApplicationJsonOcsSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiGetResponseApplicationJson_OcsBuilder b) {
    $ApiGetResponseApplicationJson_OcsInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(ApiGetResponseApplicationJson_OcsBuilder b) {
    $ApiGetResponseApplicationJson_OcsInterface._validate(b);
  }
}

@BuiltValue(instantiable: false)
abstract interface class $ApiGetResponseApplicationJsonInterface {
  ApiGetResponseApplicationJson_Ocs get ocs;
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($ApiGetResponseApplicationJsonInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($ApiGetResponseApplicationJsonInterfaceBuilder b) {}
}

abstract class ApiGetResponseApplicationJson
    implements
        $ApiGetResponseApplicationJsonInterface,
        Built<ApiGetResponseApplicationJson, ApiGetResponseApplicationJsonBuilder> {
  /// Creates a new ApiGetResponseApplicationJson object using the builder pattern.
  factory ApiGetResponseApplicationJson([void Function(ApiGetResponseApplicationJsonBuilder)? b]) =
      _$ApiGetResponseApplicationJson;

  // coverage:ignore-start
  const ApiGetResponseApplicationJson._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory ApiGetResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for ApiGetResponseApplicationJson.
  static Serializer<ApiGetResponseApplicationJson> get serializer => _$apiGetResponseApplicationJsonSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiGetResponseApplicationJsonBuilder b) {
    $ApiGetResponseApplicationJsonInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(ApiGetResponseApplicationJsonBuilder b) {
    $ApiGetResponseApplicationJsonInterface._validate(b);
  }
}

@BuiltValue(instantiable: false)
abstract interface class $ApiSetResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($ApiSetResponseApplicationJson_OcsInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($ApiSetResponseApplicationJson_OcsInterfaceBuilder b) {}
}

abstract class ApiSetResponseApplicationJson_Ocs
    implements
        $ApiSetResponseApplicationJson_OcsInterface,
        Built<ApiSetResponseApplicationJson_Ocs, ApiSetResponseApplicationJson_OcsBuilder> {
  /// Creates a new ApiSetResponseApplicationJson_Ocs object using the builder pattern.
  factory ApiSetResponseApplicationJson_Ocs([void Function(ApiSetResponseApplicationJson_OcsBuilder)? b]) =
      _$ApiSetResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ApiSetResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory ApiSetResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for ApiSetResponseApplicationJson_Ocs.
  static Serializer<ApiSetResponseApplicationJson_Ocs> get serializer => _$apiSetResponseApplicationJsonOcsSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiSetResponseApplicationJson_OcsBuilder b) {
    $ApiSetResponseApplicationJson_OcsInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(ApiSetResponseApplicationJson_OcsBuilder b) {
    $ApiSetResponseApplicationJson_OcsInterface._validate(b);
  }
}

@BuiltValue(instantiable: false)
abstract interface class $ApiSetResponseApplicationJsonInterface {
  ApiSetResponseApplicationJson_Ocs get ocs;
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($ApiSetResponseApplicationJsonInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($ApiSetResponseApplicationJsonInterfaceBuilder b) {}
}

abstract class ApiSetResponseApplicationJson
    implements
        $ApiSetResponseApplicationJsonInterface,
        Built<ApiSetResponseApplicationJson, ApiSetResponseApplicationJsonBuilder> {
  /// Creates a new ApiSetResponseApplicationJson object using the builder pattern.
  factory ApiSetResponseApplicationJson([void Function(ApiSetResponseApplicationJsonBuilder)? b]) =
      _$ApiSetResponseApplicationJson;

  // coverage:ignore-start
  const ApiSetResponseApplicationJson._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory ApiSetResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for ApiSetResponseApplicationJson.
  static Serializer<ApiSetResponseApplicationJson> get serializer => _$apiSetResponseApplicationJsonSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiSetResponseApplicationJsonBuilder b) {
    $ApiSetResponseApplicationJsonInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(ApiSetResponseApplicationJsonBuilder b) {
    $ApiSetResponseApplicationJsonInterface._validate(b);
  }
}

@BuiltValue(instantiable: false)
abstract interface class $ApiRemoveResponseApplicationJson_OcsInterface {
  OCSMeta get meta;
  JsonObject get data;
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($ApiRemoveResponseApplicationJson_OcsInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($ApiRemoveResponseApplicationJson_OcsInterfaceBuilder b) {}
}

abstract class ApiRemoveResponseApplicationJson_Ocs
    implements
        $ApiRemoveResponseApplicationJson_OcsInterface,
        Built<ApiRemoveResponseApplicationJson_Ocs, ApiRemoveResponseApplicationJson_OcsBuilder> {
  /// Creates a new ApiRemoveResponseApplicationJson_Ocs object using the builder pattern.
  factory ApiRemoveResponseApplicationJson_Ocs([void Function(ApiRemoveResponseApplicationJson_OcsBuilder)? b]) =
      _$ApiRemoveResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const ApiRemoveResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory ApiRemoveResponseApplicationJson_Ocs.fromJson(Map<String, dynamic> json) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for ApiRemoveResponseApplicationJson_Ocs.
  static Serializer<ApiRemoveResponseApplicationJson_Ocs> get serializer =>
      _$apiRemoveResponseApplicationJsonOcsSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiRemoveResponseApplicationJson_OcsBuilder b) {
    $ApiRemoveResponseApplicationJson_OcsInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(ApiRemoveResponseApplicationJson_OcsBuilder b) {
    $ApiRemoveResponseApplicationJson_OcsInterface._validate(b);
  }
}

@BuiltValue(instantiable: false)
abstract interface class $ApiRemoveResponseApplicationJsonInterface {
  ApiRemoveResponseApplicationJson_Ocs get ocs;
  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($ApiRemoveResponseApplicationJsonInterfaceBuilder b) {}
  @BuiltValueHook(finalizeBuilder: true)
  static void _validate($ApiRemoveResponseApplicationJsonInterfaceBuilder b) {}
}

abstract class ApiRemoveResponseApplicationJson
    implements
        $ApiRemoveResponseApplicationJsonInterface,
        Built<ApiRemoveResponseApplicationJson, ApiRemoveResponseApplicationJsonBuilder> {
  /// Creates a new ApiRemoveResponseApplicationJson object using the builder pattern.
  factory ApiRemoveResponseApplicationJson([void Function(ApiRemoveResponseApplicationJsonBuilder)? b]) =
      _$ApiRemoveResponseApplicationJson;

  // coverage:ignore-start
  const ApiRemoveResponseApplicationJson._();
  // coverage:ignore-end

  /// Creates a new object from the given [json] data.
  ///
  /// Use [toJson] to serialize it back into json.
  // coverage:ignore-start
  factory ApiRemoveResponseApplicationJson.fromJson(Map<String, dynamic> json) =>
      _$jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  /// Parses this object into a json like map.
  ///
  /// Use the fromJson factory to revive it again.
  // coverage:ignore-start
  Map<String, dynamic> toJson() => _$jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  /// Serializer for ApiRemoveResponseApplicationJson.
  static Serializer<ApiRemoveResponseApplicationJson> get serializer => _$apiRemoveResponseApplicationJsonSerializer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApiRemoveResponseApplicationJsonBuilder b) {
    $ApiRemoveResponseApplicationJsonInterface._defaults(b);
  }

  @BuiltValueHook(finalizeBuilder: true)
  static void _validate(ApiRemoveResponseApplicationJsonBuilder b) {
    $ApiRemoveResponseApplicationJsonInterface._validate(b);
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
      ..addBuilderFactory(const FullType(ApiGetResponseApplicationJson), ApiGetResponseApplicationJsonBuilder.new)
      ..add(ApiGetResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ApiGetResponseApplicationJson_Ocs),
        ApiGetResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ApiGetResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMetaBuilder.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(
        const FullType(ApiGetResponseApplicationJson_Ocs_Data),
        ApiGetResponseApplicationJson_Ocs_DataBuilder.new,
      )
      ..add(ApiGetResponseApplicationJson_Ocs_Data.serializer)
      ..addBuilderFactory(const FullType(ApiSetResponseApplicationJson), ApiSetResponseApplicationJsonBuilder.new)
      ..add(ApiSetResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ApiSetResponseApplicationJson_Ocs),
        ApiSetResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ApiSetResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(ApiRemoveResponseApplicationJson), ApiRemoveResponseApplicationJsonBuilder.new)
      ..add(ApiRemoveResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(ApiRemoveResponseApplicationJson_Ocs),
        ApiRemoveResponseApplicationJson_OcsBuilder.new,
      )
      ..add(ApiRemoveResponseApplicationJson_Ocs.serializer))
    .build();

/// Serializer for all values in this library.
///
/// Serializes values into the json. Json serialization is more expensive than the built_value wire format.
/// See: [$serializers] for serializing into the `built_value` wire format.
@_i2.visibleForTesting
final Serializers $jsonSerializers = _$jsonSerializers;
final Serializers _$jsonSerializers = (_$serializers.toBuilder()
      ..add(_i6.DynamiteDoubleSerializer())
      ..addPlugin(_i7.StandardJsonPlugin())
      ..addPlugin(const _i6.HeaderPlugin())
      ..addPlugin(const _i6.ContentStringPlugin()))
    .build();
// coverage:ignore-end
