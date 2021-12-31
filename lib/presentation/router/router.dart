import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabsyst_app/logic/providers/app_provider.dart';
import 'package:tabsyst_app/presentation/pages/add_user.dart';
import 'package:tabsyst_app/presentation/pages/home_page.dart';
import 'package:tabsyst_app/presentation/pages/login_page.dart';

const String initalRoute = '/';
const String homeRoute = '/home';
const String addUserRoute = '/addUser';

AppProvider _appProvider = AppProvider();

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final Object? _args = settings.arguments;
    switch (settings.name) {
      case initalRoute:
        return MaterialPageRoute(builder: (_) =>  ChangeNotifierProvider.value(value: _appProvider, child: const LoginPage()));
      case homeRoute:
        return MaterialPageRoute(builder: (_) =>  ChangeNotifierProvider.value(value: _appProvider, child: const HomePage()));
      case addUserRoute:
        return MaterialPageRoute(builder: (_) =>  ChangeNotifierProvider.value(value: _appProvider, child: const AddUserpage()));
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text("Error"),
                  ),
                ));
    }
  }

  static void dispose() {}
}
