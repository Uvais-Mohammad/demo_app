import 'package:flutter/material.dart';
import 'package:tabsyst_app/presentation/router/router.dart' as rt;

void main() {
  runApp(const MyApp());
  if (DateTime.now().year == 2022) {
    debugPrint('Happy New Year');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('Happy New year');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TabSyst',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: const Color(0xFF6F35A5),
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: rt.initalRoute,
      onGenerateRoute: rt.Router.generateRoute,
    );
  }
}
