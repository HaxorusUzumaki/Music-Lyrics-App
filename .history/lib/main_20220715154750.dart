import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:music_app/view/home_page.dart';


late bool hasConnection;
Future<void> main() async {
  runApp(const MyApp());
  hasConnection = await InternetConnectionChecker().hasConnection;

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music App',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.dark),
      home:  ? HomePage(): NoInternetPage(),
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
