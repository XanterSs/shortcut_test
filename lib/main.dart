import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shortcut_test_project/cubits/comics_cubit/comics_cubit.dart';
import 'package:shortcut_test_project/cubits/search_cubit/search_cubit.dart';
import 'package:shortcut_test_project/screens/home/home_screen.dart';
import 'main.mapper.g.dart' show initializeJsonMapper;

void main() {
  initializeJsonMapper();
  runApp(
    MultiBlocProvider(
      providers: _providers(),
      child: const ShortcutTestProject(),
    ),
  );
}

_providers() {
  return [
    BlocProvider<ComicsCubit>(create: (context) => ComicsCubit()),
    BlocProvider<SearchCubit>(create: (context) => SearchCubit()),
  ];
}

class ShortcutTestProject extends StatelessWidget {
  const ShortcutTestProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shortcut Test Project',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}
