import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_test_app/hotel/domain/bloc/hotel_bloc.dart';

Future<void> showMyIosResetDataPop(BuildContext context) {
  return showCupertinoDialog(
    context: context,
    useRootNavigator: false,
    builder: (context) {
      return Theme(
        data: Theme.of(context).copyWith(
          platform: TargetPlatform.iOS,
        ),
        child: CupertinoAlertDialog(
          content: const Column(children: [
            Text(
              'Ваш заказ не принят',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5),
            Text(
              'Пожалуйста проверьте введенные данные и повторите еще раз!',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
            ),
          ]),
          actions: [
            CupertinoDialogAction(
                onPressed: () {
                  context.read<HotelBloc>().add(ChangeStatusEvnet());
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Понятно',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                )),
            // CupertinoDialogAction(
            //     onPressed: func,
            //     child: const Text(
            //       'Reset',
            //       style: TextStyle(
            //           color: Colors.red,
            //           fontSize: 17,
            //           fontWeight: FontWeight.w600),
            //     )),
          ],
        ),
      );
    },
  );
}
