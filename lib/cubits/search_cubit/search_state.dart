part of 'search_cubit.dart';

class SearchSuccessful extends BaseCubitState {
  final ComicModel model;
  final String state;

  const SearchSuccessful({required this.model, required this.state});

  @override
  List<Object> get props => [model, state];

  @override
  String toString() {
    return model.toString() + state;
  }
}
