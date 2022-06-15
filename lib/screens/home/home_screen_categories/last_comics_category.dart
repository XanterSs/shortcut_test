import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shortcut_test_project/cubits/base/base_cubit.dart';
import 'package:shortcut_test_project/cubits/comics_cubit/comics_cubit.dart';
import 'package:shortcut_test_project/helpers/dacorations.dart';
import 'package:shortcut_test_project/helpers/widgets/error_snack_bar.dart';
import 'package:shortcut_test_project/helpers/widgets/error_widget.dart';
import 'dart:math' as math;

import 'package:shortcut_test_project/screens/home/components/comic_card.dart';

class LastComicsCategory extends StatefulWidget {
  const LastComicsCategory({Key? key}) : super(key: key);

  @override
  _LastComicsCategoryState createState() => _LastComicsCategoryState();
}

class _LastComicsCategoryState extends State<LastComicsCategory> {
  ComicsCubit get _comicsCubit {
    return BlocProvider.of<ComicsCubit>(context);
  }

  late PageController _pageController;
  int initialPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
    _comicsCubit.initial();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: BlocConsumer(
          bloc: _comicsCubit,
          builder: (context, state) {
            if (state is ErrorState) {
              return showErrorWidget(onTap: () => _comicsCubit.initial(), context: context);
            } else if (_comicsCubit.models.isEmpty) {
              return Center(
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
              );
            } else {
              return PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    initialPage = value;
                  });
                  if ((_comicsCubit.models.length - 2) == value) {
                    _comicsCubit.loadMore(_comicsCubit.models.last);
                  }
                },
                controller: _pageController,
                physics: const ClampingScrollPhysics(),
                itemCount: _comicsCubit.models.length,
                itemBuilder: (context, index) => buildComicSlider(index),
              );
            }
          },
          listener: (context, state) {
            if (state is ErrorState) {
              showErrorSnackBar(context: context, message: state.error);
            }
          },
        ),
      ),
    );
  }

  Widget buildComicSlider(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0;
          if (_pageController.position.haveDimensions) {
            value = index - _pageController.page!;

            value = (value * 0.038).clamp(-1, 1);
          }
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 350),
            opacity: initialPage == index ? 1 : 0.2,
            child: Transform.rotate(
              angle: math.pi * value,
              child: ComicCard(
                key: Key(_comicsCubit.models[index].comicNumber.toString()),
                comic: _comicsCubit.models[index],
              ),
            ),
          );
        },
      );
}
