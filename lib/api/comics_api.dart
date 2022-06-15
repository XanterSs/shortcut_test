import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/foundation.dart';
import 'package:shortcut_test_project/api/base_api/base_api.dart';
import 'package:shortcut_test_project/models/comic_model.dart';

class ComicsApi extends BaseApi {
  Future<ComicsModelResponse> getComics({int? previousComicNumber, int? count}) async {
    ComicsModelResponse? modelsResponse = ComicsModelResponse();

    int _count = count ?? 4;
    int? _nextComicIndex;

    if (previousComicNumber != null) {
      _nextComicIndex = previousComicNumber - 1;
    }

    try {
      for (var i = 0; i < _count; i++) {
        ComicModel? _model;
        if (_nextComicIndex != null) {
          _model = await fetchComic(comicIndex: _nextComicIndex);
        } else {
          _model = await fetchLastComic();
        }

        _nextComicIndex = _model!.comicNumber! - 1;
        modelsResponse.data.add(_model);
      }

      return modelsResponse;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      rethrow;
    }
  }

  Future<ComicModel?> getComicByNumber(String? number) async {
    try {
      var response = await get("$number/info.0.json");
      var model = JsonMapper.deserialize<ComicModel>(response.data);

      return model;
    } catch (e) {
      rethrow;
    }
  }

  Future<ComicModel?> getLastComic() async {
    try {
      var response = await get("info.0.json");
      var model = JsonMapper.deserialize<ComicModel>(response.data);

      return model;
    } catch (e) {
      rethrow;
    }
  }

  Future<ComicModel?> fetchComic({required int comicIndex}) async {
    try {
      return await getComicByNumber(comicIndex.toString());
    } catch (e) {
      rethrow;
    }
  }

  Future<ComicModel?> fetchLastComic() async {
    try {
      return await getLastComic();
    } catch (e) {
      rethrow;
    }
  }
}
