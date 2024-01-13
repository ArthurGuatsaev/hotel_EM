import 'package:flutter/material.dart';
import 'package:hotel_test_app/const/text.dart';
import 'package:hotel_test_app/navigation/nav_manager.dart';
import 'package:hotel_test_app/widgets/custom_button.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text('Заказ оплачен', style: appbarTS),
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(height: 100),
          Image.asset('assets/images/success.png'),
          const SizedBox(height: 20),
          const Text('Ваш заказ принят в работу', style: hotelTitleTS),
          const SizedBox(height: 20),
          const Row(
            children: [
              Expanded(
                  child: Text(
                'Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                style: hotelCommentTS,
                textAlign: TextAlign.center,
              ))
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 48,
            child: HotelButton(
              text: 'Супер!',
              func: () => MyNavigatorManager.instance.pushHotel(),
            ),
          ),
          const SizedBox(height: 30),
        ]),
      ),
    );
  }
}
