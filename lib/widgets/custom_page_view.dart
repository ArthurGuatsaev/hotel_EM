import 'package:flutter/material.dart';

class HotelImageView extends StatelessWidget {
  final List<String> images;
  const HotelImageView({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 343 / 257,
      child: PageView.builder(
        itemCount: images.length, // hotels.length
        itemBuilder: (context, index) {
          final image = images[index];
          return SizedBox(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  image,
                  fit: BoxFit.fill,
                  // loadingBuilder: (context, child, loadingProgress) =>
                  //     const Center(
                  //         child: CircularProgressIndicator.adaptive(
                  //   backgroundColor: Colors.grey,
                  // )),
                  errorBuilder: (context, error, stackTrace) => const SizedBox(
                    child: ColoredBox(color: Colors.lightGreen),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
