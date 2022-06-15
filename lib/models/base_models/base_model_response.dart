import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class BaseModelResponse {
  ErrorResponse? error;
  String? message;
  ErrorResponse? errors;
}

@jsonSerializable
class ErrorResponse {
  String? message;
}

@jsonSerializable
class Meta {
  @JsonProperty(name: 'last_page')
  int? lastPage;
}
