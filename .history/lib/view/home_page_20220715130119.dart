import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: const Text(
          "Trending",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)),
              elevation: 4,
              color: Colors.amber.withOpacity(0.5),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Icon(Icons.library_music_rounded),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Song Name",
                          ),
                          Text("Album Name"),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Artist"),
                    )
                  ],
                )),
              ),
            ),
          );
        },
      ),
    );
  }
}
