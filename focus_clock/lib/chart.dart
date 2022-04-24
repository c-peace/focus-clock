import 'package:flutter/cupertino.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Icon(
          CupertinoIcons.rectangle,
          size: 200,
          color: CupertinoColors.activeGreen,
        ),
      ],
    );
  }
}
