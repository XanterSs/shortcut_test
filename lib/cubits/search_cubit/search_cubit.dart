import 'package:shortcut_test_project/api/base_api/api_container.dart';
import 'package:shortcut_test_project/cubits/base/base_cubit.dart';
import 'package:shortcut_test_project/models/comic_model.dart';

part 'search_state.dart';

class SearchCubit extends BaseCubit {
  ComicModel? comic;
  SearchCubit() : super(InitialState());

  Future<void> getByNumber({String? number}) async {
    emit(LoadingState());
    await _getModel(number: number);
  }

  Future<void> _getModel({String? number}) async {
    try {
      var response = await ApiContainer().appComicsApi.getComicByNumber(number);
      if (response != null) {
        comic = response;
        emit(SearchSuccessful(model: comic!, state: "loaded $number"));
      } else {
        catchError(response);
      }
    } catch (e) {
      catchError(e);
    }
  }
}
