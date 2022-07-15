import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:music_app/view/home_page.dart';

late bool hasConnection;
main() async {
  await execute(InternetConnectionChecker());

  // Create customized instance which can be registered via dependency injection
  final InternetConnectionChecker customInstance =
      InternetConnectionChecker.createInstance(
    checkTimeout: const Duration(seconds: 1),
    checkInterval: const Duration(seconds: 1),
  );

  // Check internet connection with created instance
  await execute(customInstance);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.dark),
      home: hasConnection ? const HomePage() : const NoInternetPage(),
    );
  }
}

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 175,
              backgroundImage: AssetImage("assets/noInternet.jpg"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40),
              child: Text(
                "No Internet",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

ThemeData _buildTheme(brightness) {
  var baseTheme =
      ThemeData(brightness: brightness, primarySwatch: Colors.amber);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.montserratTextTheme(baseTheme.textTheme),
  );
}

Future<bool> execute(
  InternetConnectionChecker internetConnectionChecker,
) async {
  final bool isConnected = await InternetConnectionChecker().hasConnection;

  // final StreamSubscription<InternetConnectionStatus> listener =
  //     InternetConnectionChecker().onStatusChange.listen(
  //   (InternetConnectionStatus status) {
  //     switch (status) {
  //       case InternetConnectionStatus.connected:
  //         break;
  //       case InternetConnectionStatus.disconnected:
  //         // isConnected = false;
  //         break;
  //     }
  //   },
  // );

  await Future<void>.delayed(const Duration(seconds: 30));
  await listener.cancel();
  return isConnected;
}
