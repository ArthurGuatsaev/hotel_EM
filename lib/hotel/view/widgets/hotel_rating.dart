import 'package:flutter/material.dart';

import '../../../const/colors.dart';
import '../../../const/text.dart';
import '../../domain/models/base_model.dart';

class HotelRatingBar extends StatelessWidget {
  final BaseModel hotel;
  const HotelRatingBar({
    super.key,
    required this.hotel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: DecoratedBox(
      decoration: BoxDecoration(
          color: ratingColorW, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.star,
              color: ratingColor,
              size: 20,
            ),
            const SizedBox(width: 3),
            Text(
              '${hotel.rating}',
              style: ratingStringTS,
            ),
            const SizedBox(width: 3),
            Text(
              hotel.ratingName,
              style: ratingStringTS,
            ),
            const SizedBox(width: 3),
          ],
        ),
      ),
    ));
  }
}
