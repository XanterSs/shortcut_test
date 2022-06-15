part of 'comics_cubit.dart';

class ComicsLoaded extends BaseCubitState {
  final List<ComicModel> models;
  final String state;

  const ComicsLoaded({required this.models, required this.state});

  @override
  List<Object> get props => [models, state];

  @override
  String toString() {
    return models.toString() + state;
  }
}
