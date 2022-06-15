import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shortcut_test_project/api/base_api/api_container.dart';

class BaseCubit extends Cubit<BaseCubitState> {
  BaseCubit(state) : super(state);

  ApiContainer get api {
    return ApiContainer();
  }

  catchError(final e) {
    emit(ErrorState(error: ApiContainer().catchError(e)));
  }
}

abstract class BaseCubitState extends Equatable {
  const BaseCubitState();

  @override
  List<Object> get props => [];
}

class InitialState extends BaseCubitState {}

class LoadingState extends BaseCubitState {}

class LoadingMoreState extends BaseCubitState {}

class ErrorState extends BaseCubitState {
  final String error;

  const ErrorState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => error;
}

abstract class BaseQuery {
  late String? search;

  appendSearch(Map<String, String> childQuery) {
    if (search != null) {
      childQuery["search"] = search!;
    } else {
      childQuery.remove("search");
    }

    return childQuery;
  }
}
