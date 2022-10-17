import 'package:flutter/material.dart';

class ProfileName extends StatelessWidget {
  const ProfileName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Taisei',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'ID:5947596159-74531902',
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
