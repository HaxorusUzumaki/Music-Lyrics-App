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
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Icon(Icons.library_music_rounded),
                ),
                Expanded(
                  child: Column(
                    textDirection: TextDirection.ltr,
                    children: const [
                      Text("Song Name"),
                      Text("Album Name"),
                    ],
                  ),
                ),
                const Text("Artist")
              ],
            )),
          );
        },
      ),
    );
  }
}
