import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swypex/ui/screens/home/bloc/home_bloc.dart';
// import 'package:swypex/ui/screens/home/bloc/home_repo.dart';
import 'package:swypex/ui/screens/home/home_screen.dart';
import 'package:swypex/ui/screens/splash/splash_screen.dart';
import 'package:swypex/util/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Movie App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().themeDataLight,
        home: const SplashScreen(),
        routes: {
          SplashScreen.routeName: (ctx) => const SplashScreen(),
          HomeScreen.routeName: (ctx) => const HomeScreen(),
        },
      ),
    );
  }
}
