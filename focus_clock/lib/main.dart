import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'watch_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Focus Clock', style: TextStyle(fontSize: 19)),
          backgroundColor: CupertinoColors.white,
          border: Border(),
        ),
        child: Column(
          children: [
            SizedBox(height: 40),
            WatchPage(),
            SizedBox(height: 90),
            PlayPauseButton()
          ],
        ),
      ),
    );
  }
}

class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({Key? key}) : super(key: key);

  @override
  State<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  bool isplayed = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: isplayed
          ? Icon(CupertinoIcons.stop_circle, size: 50)
          : Icon(CupertinoIcons.play_circle, size: 50),
      onPressed: () {
        setState(() {
          if (isplayed) {
            isplayed = false;
          } else {
            isplayed = true;
          }
        });
      },
    );
  }
}
