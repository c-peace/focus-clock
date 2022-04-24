import 'package:flutter/cupertino.dart';
import 'chart.dart';
import 'watch_page.dart';

void main() {
  runApp(const MyApp());
}

bool isplayed = false;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(brightness: Brightness.light),
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
          size: 30,
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
                    if (isplayed) {
                      showCupertinoDialog(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: const Text('기록 중 입니다.'),
                              content: const Text('''Chart를 확인하시려면,
기록을 중지해 주세요.'''),
                              actions: [
                                CupertinoDialogAction(
                                    isDefaultAction: true,
                                    child: const Text("확인"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                              ],
                            );
                          });
                    } else {
                      _isOn = value;
                    }
                  });
                })),
        if (_isOn)
          const ChartPage()
        else
          Column(
            children: const [
              WatchPage(),
              SizedBox(height: 65),
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
