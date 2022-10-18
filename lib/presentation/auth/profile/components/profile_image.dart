import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:status_view/status_view.dart';

import '../profile_page.dart';

class ProfileImage extends ConsumerWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = ref.watch(imageUrlProvider);
    return imageUrl.maybeWhen(
      data: (url) => StatusView(
        radius: 70,
        spacing: 15,
        strokeWidth: 3,
        indexOfSeenStatus: 2,
        numberOfStatus: 5,
        padding: 10,
        centerImageUrl: url.value!,
        unSeenColor: Colors.red,
      ),
      orElse: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

final imageUrlProvider =
    FutureProvider.autoDispose<AsyncValue<String>>((ref) async {
  final imageUrl = ref.watch(userMetaDataProvider);
  return imageUrl.whenData((value) => value.imageUrl);
});
