import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/text.dart';

class MyTF extends StatefulWidget {
  final String? Function(String? value)? validator;
  final String text;
  final String? hint;
  final TextEditingController? controller;
  final Function? func;
  const MyTF({
    super.key,
    required this.text,
    this.controller,
    this.hint,
    this.func,
    this.validator,
  });

  @override
  State<MyTF> createState() => _MyTFState();
}

class _MyTFState extends State<MyTF> {
  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  String? isValid;
  void myValidator(String? value) {
    if (widget.validator == null) return;
    if (value == null) return;
    isValid = widget.validator!(value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 48,
          child: DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isValid == null ? textFieldBGColor : errorColor),
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: TextField(
                textInputAction: TextInputAction.next,
                controller: widget.controller,
                onChanged: (value) {
                  myValidator(value);
                  widget.func == null ? null : widget.func!(value);
                },
                // {
                //   myValidator(value);
                //   widget.func;
                // },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(bottom: 15, top: 5),
                  labelText: widget.text,
                  labelStyle: supportTS,
                  hintText: widget.hint,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        isValid == null
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  isValid!,
                  style: errorTS,
                ),
              )
      ],
    );
  }
}
