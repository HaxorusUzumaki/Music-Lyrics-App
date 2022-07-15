import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Trending",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          InkWell(
            child :Row(
              children: [
                Icon(Icons.library)
              ],
            )
          );
        },
      ),
    );
  }
}

