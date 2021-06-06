import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_6/presentation/router.dart';
import 'package:flutter_task_6/utility/app_block_observer.dart';

import 'package:flutter_task_6/logic/cubits/country_data/country_data_cubit.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CountryDataCubit>(
          create: (context) => CountryDataCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Country List',
        theme: new ThemeData(
          scaffoldBackgroundColor: const Color(0xDD141c3b),
          primaryColor: Color(0xff1c2754),
          accentColor: Colors.cyan[600],
          textTheme: TextTheme(
            bodyText1: TextStyle(),
            bodyText2: TextStyle(),
          ).apply(
            bodyColor: Colors.amber[200],
            displayColor: Colors.blue,
          )
        ),
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
