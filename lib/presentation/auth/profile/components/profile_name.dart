import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../profile_page.dart';

class ProfileName extends ConsumerWidget {
  const ProfileName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return name.maybeWhen(
      data: (data) => Column(
        children: [
          Text(
            data.value!,
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
      ),
      orElse: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

final nameProvider =
    FutureProvider.autoDispose<AsyncValue<String>>((ref) async {
  final imageUrl = ref.watch(userMetaDataProvider);
  return imageUrl.whenData((value) => value.name);
});
