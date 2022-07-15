import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:music_app/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        return !connected
            ? const NoInternetPage()
            : Scaffold(
                appBar: AppBar(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    // Status bar color
                    statusBarColor: Colors.yellow.shade700,

                    // Status bar brightness (optional)
                    statusBarIconBrightness:
                        Brightness.dark, // For Android (dark icons)
                    statusBarBrightness:
                        Brightness.light, // For iOS (dark icons)
                  ),
                  backgroundColor: Colors.yellow.shade700,
                  // elevation: 0,
                  title: const Center(
                    child: Text(
                      "Trending",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                body: SafeArea(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 20),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
                          elevation: 4,
                          color: Colors.amber.withOpacity(0.5),
                          child: InkWell(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Icon(Icons.library_music_rounded),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                            ),
                          )),
                        ),
                      );
                    },
                  ),
                ),
              );
      },
      child: Container(),
    );
  }
}
