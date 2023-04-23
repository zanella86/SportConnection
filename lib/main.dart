import 'package:flutter/material.dart';
import 'package:sport_connection/presentation/blocs/events/events_cubit.dart';
import 'package:sport_connection/presentation/blocs/profile/profile_cubit.dart';
import 'package:sport_connection/presentation/blocs/user/user_cubit.dart';
import 'package:sport_connection/ui/auth/auth_screen.dart';
import 'package:sport_connection/ui/auth/register/register_container.dart';
import 'package:sport_connection/ui/auth/register/register_screen.dart';
import 'package:sport_connection/ui/home/home_container.dart';
import 'package:sport_connection/ui/home/home_screen.dart';
import 'package:sport_connection/ui/auth/login/login_screen.dart';
import 'package:sport_connection/ui/profile/profile_container.dart';
import 'package:sport_connection/ui/profile/profile_screen.dart';
import 'package:sport_connection/ui/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SportConnection',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => const SplashScreen(),
          AuthScreen.id: (context) => const AuthScreen(),
          RegisterScreen.id: (context) => UserCubitProvider(
                child: RegisterContainer(),
              ),
          LoginScreen.id: (context) => LoginScreen(),
          HomeScreen.id: (context) => EventCubitProvider(
                child: HomeContainer(),
              ),
          ProfileScreen.id: (context) => ProfileCubitProvider(
                child: ProfileContainer(),
              )
        });
  }
}
