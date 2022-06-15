import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:shortcut_test_project/models/base_models/base_model.dart';
import 'package:shortcut_test_project/models/base_models/base_model_response.dart';

@jsonSerializable
class ComicModelResponse extends BaseModelResponse {
  ComicModel? data;
}

@jsonSerializable
class ComicsModelResponse extends BaseModelResponse {
  List<ComicModel> data = [];
  Meta? meta;
}

@jsonSerializable
class ComicModel extends BaseModel {
  @JsonProperty(name: 'num')
  int? comicNumber;

  String? title;
  @JsonProperty(name: 'safe_title')
  String? safeTitle;
  String? alt;
  String? news;
  String? transcript;

  String? link;
  String? img;

  String? day;
  String? month;
  String? year;
}
