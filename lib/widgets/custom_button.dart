import 'package:flutter/material.dart';
import 'package:hotel_test_app/const/text.dart';

import '../const/colors.dart';

class HotelButton extends StatelessWidget {
  final String text;
  final Function() func;
  const HotelButton({
    super.key,
    required this.text,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(15)),
      child: Material(
          borderRadius: BorderRadius.circular(15),
          color: Colors.transparent,
          child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: func,
              child: Center(
                  child: Text(
                text,
                style: buttonTS,
              )))),
    );
  }
}
