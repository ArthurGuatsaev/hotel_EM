import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_test_app/const/extension.dart';
import 'package:hotel_test_app/hotel/domain/bloc/hotel_bloc.dart';

class PhoneTextField extends StatefulWidget {
  const PhoneTextField({super.key});

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  void imput() {
    final phone = '${kod.text}${first.text}${second.text}${third.text}';
    context.read<HotelBloc>().add(AddPhoneEvent(phone: phone));
  }

  late final TextEditingController kod = TextEditingController(text: '***');
  late final TextEditingController first = TextEditingController(text: '***');
  late final TextEditingController second = TextEditingController(text: '**');
  late final TextEditingController third = TextEditingController(text: '**');

  // String first = '***';
  // String second = '**';
  // String third = '**';
  FocusNode focusKod = FocusNode();
  FocusNode focusFirst = FocusNode();
  FocusNode focusSecond = FocusNode();
  FocusNode focusThird = FocusNode();
  @override
  Widget build(BuildContext context) {
    const width = 31.0;
    const height = 30.0;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('+7('),
        SizedBox(
            width: width,
            height: height,
            child: TextField(
              controller: kod,
              // inputFormatters: [LengthLimitingTextInputFormatter(3)],
              focusNode: focusKod,
              textAlignVertical: TextAlignVertical.top,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              showCursor: false,
              style: const TextStyle(fontSize: 13, color: Colors.black),
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 21, left: 1),
                  border: InputBorder.none),
              onChanged: (value) {
                if (value.sCount == 1) {
                  kod.text = '${value.onlyNumber}**';
                }
                if (value.sCount == 2) {
                  kod.text = '${value.onlyNumber}*';
                }
                if (value.sCount == 3) {
                  kod.text = value.onlyNumber;
                }

                imput();
                if (value.sCount > 2) focusKod.nextFocus();
                if (value.sCount == 0) focusKod.previousFocus();
              },
            )),
        const Text(
          ')',
          style: TextStyle(color: Colors.black),
        ),
        const Text(' '),
        SizedBox(
            width: width,
            height: height,
            child: TextFormField(
              controller: first,
              // inputFormatters: [LengthLimitingTextInputFormatter(3)],
              focusNode: focusFirst,
              textAlignVertical: TextAlignVertical.top,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              showCursor: false,
              style: const TextStyle(fontSize: 13, color: Colors.black),
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 21, left: 1),
                  border: InputBorder.none),
              onChanged: (value) {
                if (value.sCount == 1) {
                  first.text = '${value.onlyNumber}**';
                }
                if (value.sCount == 2) {
                  first.text = '${value.onlyNumber}*';
                }
                if (value.sCount == 3) {
                  first.text = value.onlyNumber;
                }

                imput();
                if (value.sCount > 2) focusFirst.nextFocus();
                if (value.sCount == 0) focusFirst.previousFocus();
              },
            )),
        const Text(
          '-',
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(
            width: 22,
            height: height,
            child: TextFormField(
              controller: second,
              // inputFormatters: [LengthLimitingTextInputFormatter(2)],
              focusNode: focusSecond,
              textAlignVertical: TextAlignVertical.top,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              showCursor: false,
              style: const TextStyle(fontSize: 13, color: Colors.black),
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 21, left: 1),
                  border: InputBorder.none),
              onChanged: (value) {
                if (value.sCount == 1) {
                  second.text = '${value.onlyNumber}*';
                }

                if (value.sCount == 2) {
                  second.text = value.onlyNumber;
                }

                imput();
                if (value.sCount > 1) focusSecond.nextFocus();
                if (value.sCount == 0) focusSecond.previousFocus();
              },
            )),
        const Text(
          '-',
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(
            width: 22,
            height: height,
            child: TextFormField(
              controller: third,
              // inputFormatters: [LengthLimitingTextInputFormatter(2)],
              focusNode: focusThird,
              textAlignVertical: TextAlignVertical.top,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              showCursor: false,
              style: const TextStyle(fontSize: 13, color: Colors.black),
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 21, left: 1),
                  border: InputBorder.none),
              onChanged: (value) {
                if (value.sCount == 1) {
                  third.text = '${value.onlyNumber}*';
                }

                if (value.sCount == 2) {
                  third.text = value.onlyNumber;
                }

                imput();
                if (value.sCount > 1) focusThird.nextFocus();
                if (value.sCount == 0) focusThird.previousFocus();
              },
            )),
        const Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
