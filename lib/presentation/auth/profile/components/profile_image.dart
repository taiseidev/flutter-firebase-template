import 'package:flutter/material.dart';
import 'package:status_view/status_view.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return StatusView(
      radius: 70,
      spacing: 15,
      strokeWidth: 3,
      indexOfSeenStatus: 2,
      numberOfStatus: 5,
      padding: 10,
      centerImageUrl:
          'https://images.unsplash.com/photo-1473625247510-8ceb1760943f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1411&q=80',
      seenColor: Colors.grey,
      unSeenColor: Colors.red,
    );
  }
}
