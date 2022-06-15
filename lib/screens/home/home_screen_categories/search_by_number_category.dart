import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shortcut_test_project/cubits/base/base_cubit.dart';
import 'package:shortcut_test_project/cubits/search_cubit/search_cubit.dart';
import 'package:shortcut_test_project/helpers/widgets/error_snack_bar.dart';
import 'package:shortcut_test_project/screens/home/components/comic_card.dart';
import 'package:shortcut_test_project/helpers/widgets/search_box.dart';

class SearchByNumberCategory extends StatefulWidget {
  const SearchByNumberCategory({Key? key}) : super(key: key);

  @override
  _SearchByNumberCategoryState createState() => _SearchByNumberCategoryState();
}

class _SearchByNumberCategoryState extends State<SearchByNumberCategory> {
  SearchCubit get _searchCubit {
    return BlocProvider.of<SearchCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: _searchCubit,
      builder: (context, state) {
        if (state is LoadingState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Center(
              child: DefaultTextStyle(
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 40.0,
                    ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('Loading...'),
                  ],
                  repeatForever: true,
                  isRepeatingAnimation: true,
                ),
              ),
            ),
          );
        } else if (state != LoadingState && _searchCubit.comic == null) {
          return Column(
            children: [
              SearchBox(
                editingCallback: (number) {
                  _searchCubit.getByNumber(number: number);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              DefaultTextStyle(
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 40.0,
                    ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('Let\'s search'),
                  ],
                  repeatForever: true,
                  isRepeatingAnimation: true,
                ),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              SearchBox(
                editingCallback: (number) {
                  _searchCubit.getByNumber(number: number);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ComicCard(
                  key: Key(_searchCubit.comic!.comicNumber.toString()),
                  comic: _searchCubit.comic!,
                ),
              ),
            ],
          );
        }
      },
      listener: (context, state) {
        if (state is ErrorState) {
          showErrorSnackBar(context: context, message: state.error);
        }
      },
    );
  }
}
