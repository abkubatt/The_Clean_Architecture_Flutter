import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/common/app_colors.dart';
import 'package:rick_and_morty/feature/presentation/bloc/person_list_cubit/person_list_state.dart';
import 'package:rick_and_morty/feature/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:rick_and_morty/locator_service.dart' as di;
import 'package:rick_and_morty/locator_service.dart';

import 'feature/presentation/pages/person_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<PersonListCubit>(
            create: (context) => sl<PersonListCubit>()..loadPerson(),
          ),
          BlocProvider<PersonSearchBloc>(
            create: (context) => sl<PersonSearchBloc>(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData.dark().copyWith(
            backgroundColor: AppColor.mainBackground,
            scaffoldBackgroundColor: AppColor.mainBackground,
          ),
          home: HomePage(),
        ));
  }
}
