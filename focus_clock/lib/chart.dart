import 'package:flutter/cupertino.dart';
import 'package:focus_clock/record.dart';
import 'package:intl/intl.dart';

import 'main.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        Text(
          '총 시간 : ',
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}
