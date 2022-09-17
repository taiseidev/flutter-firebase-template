import 'package:flutter/material.dart';

class GoogleAuthPageBody extends StatelessWidget {
  const GoogleAuthPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('管理者'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('スタッフ'),
        ),
      ],
    );
  }
}
