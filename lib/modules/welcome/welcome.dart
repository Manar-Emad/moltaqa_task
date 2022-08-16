import 'package:flutter/material.dart';
import 'package:moltaqa_task/shared/styles/colors.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryLColor,
      ),
      body: Column(
        children: [Text('Welcome',style: TextStyle(fontSize: 20),)],
      ),
    );
  }
}
