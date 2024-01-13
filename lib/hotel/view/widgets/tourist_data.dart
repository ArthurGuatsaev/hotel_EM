import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_test_app/hotel/domain/bloc/hotel_bloc.dart';
import 'package:hotel_test_app/hotel/domain/cubit/input_cubit.dart';
import 'package:hotel_test_app/hotel/domain/repositories/input_validator.dart';

import '../../../const/colors.dart';
import '../../../const/text.dart';
import '../my_tf.dart';

class TouristData extends StatelessWidget {
  final int index;
  final String title;
  const TouristData({super.key, required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          InputCubit(hotel: context.read<HotelBloc>(), id: index),
      child: TouristInputData(
        title: title,
        index: index,
      ),
    );
  }
}

class TouristInputData extends StatefulWidget {
  final String title;
  final int index;
  const TouristInputData({
    super.key,
    required this.title,
    required this.index,
  });

  @override
  State<TouristInputData> createState() => _TouristInputDataState();
}

class _TouristInputDataState extends State<TouristInputData> {
  bool isOpen = false;
  @override
  void initState() {
    isOpen = widget.title == 'Первый турист';

    super.initState();
  }

  void ipenClose() {
    isOpen = !isOpen;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: blocColo),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(widget.title, style: hotelTitleTS),
                const Spacer(),
                GestureDetector(
                    onTap: ipenClose,
                    child: isOpen
                        ? Image.asset('assets/images/up.png')
                        : Image.asset('assets/images/under.png')),
              ],
            ),
            Offstage(
              offstage: !isOpen,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  MyTF(
                    text: 'Имя',
                    validator: Validator.nameValidatorString,
                    func: (String value) =>
                        context.read<InputCubit>().changeName(value),
                  ),
                  const SizedBox(height: 10),
                  MyTF(
                    text: 'Фамилия',
                    validator: Validator.nameValidatorString,
                    func: (String value) =>
                        context.read<InputCubit>().changeLastName(value),
                  ),
                  const SizedBox(height: 10),
                  MyTF(
                    text: 'Дата рождения',
                    validator: Validator.nameValidatorString,
                    func: (String value) =>
                        context.read<InputCubit>().changedateB(value),
                  ),
                  const SizedBox(height: 10),
                  MyTF(
                    text: 'Гражданство',
                    validator: Validator.nameValidatorString,
                    func: (String value) =>
                        context.read<InputCubit>().changeFrom(value),
                  ),
                  const SizedBox(height: 10),
                  MyTF(
                    text: 'Номер загранпаспорта',
                    validator: Validator.nameValidatorString,
                    func: (String value) =>
                        context.read<InputCubit>().changePassport(value),
                  ),
                  const SizedBox(height: 10),
                  MyTF(
                    text: 'Срок действия загранпаспорта',
                    validator: Validator.nameValidatorString,
                    func: (String value) =>
                        context.read<InputCubit>().changePassTime(value),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
