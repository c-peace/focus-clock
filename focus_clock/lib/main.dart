import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chart.dart';
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
            border: Border()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(height: 40, width: double.infinity),
            PageSwitch(),
          ],
        ),
      ),
    );
  }
}

// Switch - ChartPage & ClockPage(MainPage)
class PageSwitch extends StatefulWidget {
  const PageSwitch({Key? key}) : super(key: key);

  @override
  State<PageSwitch> createState() => _PageSwitchState();
}

class _PageSwitchState extends State<PageSwitch> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          CupertinoIcons.doc_chart,
          color: _isOn
              ? CupertinoColors.activeGreen
              : CupertinoColors.inactiveGray,
        ),
        Transform.scale(
            scale: 0.8,
            child: CupertinoSwitch(
                activeColor: CupertinoColors.activeGreen,
                value: _isOn,
                onChanged: (bool value) {
                  setState(() {
                    _isOn = value;
                  });
                })),
        if (_isOn)
          ChartPage()
        else
          Column(
            children: const [
              WatchPage(),
              SizedBox(height: 90),
              PlayPauseButton(),
            ],
          )
      ],
    );
  }
}

// Button - Play & Pause
class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({Key? key}) : super(key: key);

  @override
  State<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> {
  bool isplayed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoButton(
          child: isplayed
              ? const Icon(CupertinoIcons.stop_circle,
                  size: 50, color: CupertinoColors.systemRed)
              : const Icon(CupertinoIcons.play_circle, size: 50),
          onPressed: () {
            setState(() {
              if (isplayed) {
                isplayed = false;
              } else {
                isplayed = true;
              }
            });
          },
        ),
        Icon(CupertinoIcons.recordingtape,
            color: isplayed
                ? CupertinoColors.systemRed
                : CupertinoColors.inactiveGray),
      ],
    );
  }
}
