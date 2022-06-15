import 'package:shortcut_test_project/api/base_api/api_container.dart';
import 'package:shortcut_test_project/cubits/base/base_cubit.dart';
import 'package:shortcut_test_project/models/comic_model.dart';

part 'comics_state.dart';

class ComicsCubit extends BaseCubit {
  List<ComicModel> models = [];
  ComicsCubit() : super(InitialState());

  Future<void> initial() async {
    models.clear();
    await getModels();
  }

  Future<void> loadMore(ComicModel lastComic) async {
    emit(LoadingMoreState());
    await _getModels(lastComic: lastComic);
  }

  Future<void> getModels({ComicModel? lastComic}) async {
    emit(LoadingState());
    await _getModels(lastComic: lastComic);
  }

  Future<void> _getModels({ComicModel? lastComic}) async {
    try {
      var response = await ApiContainer().appComicsApi.getComics(previousComicNumber: lastComic?.comicNumber);
      if (response.data.isNotEmpty) {
        models += response.data;
        emit(ComicsLoaded(models: models, state: "loaded ${models.last.comicNumber.toString()}"));
      } else {
        catchError(response);
      }
    } catch (e) {
      catchError(e);
    }
  }
}
