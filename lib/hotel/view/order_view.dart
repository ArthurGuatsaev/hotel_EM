import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_test_app/const/extension.dart';
import 'package:hotel_test_app/const/text.dart';
import 'package:hotel_test_app/hotel/domain/models/reserv_model.dart';
import 'package:hotel_test_app/navigation/nav_manager.dart';
import 'package:hotel_test_app/widgets/custom_button.dart';

import '../../const/colors.dart';
import '../domain/bloc/hotel_bloc.dart';
import 'my_tf.dart';
import 'widgets/error_pop.dart';
import 'widgets/hotel_rating.dart';
import 'widgets/phone_field.dart';
import 'widgets/tourist_data.dart';

class ReservView extends StatefulWidget {
  const ReservView({super.key});

  @override
  State<ReservView> createState() => _ReservViewState();
}

class _ReservViewState extends State<ReservView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HotelBloc, HotelState>(
        buildWhen: (previous, current) =>
            previous.reserv != current.reserv ||
            previous.touristNumber != current.touristNumber ||
            previous.client != current.client,
        builder: (context, state) {
          final reserv = state.reserv;
          if (reserv == null) return const SizedBox();
          return CustomScrollView(
            slivers: [
              const SliverAppBar(title: Text('Бронирование', style: appbarTS)),
              ReservHotelData(reserv: reserv),
              ReservAllInfo(reserv: reserv),
              const MainInput(),
              const SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverList.builder(
                  itemCount: state.touristNumber,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TouristData(
                        title: '${index.numberString} турист',
                        index: index,
                      ),
                    );
                  }),
              const NewTourist(),
              OrderPrice(state: state),
              const SliverToBoxAdapter(child: SizedBox(height: 10)),
              PriceButton(state: state)
            ],
          );
        },
      ),
    );
  }
}

class PriceButton extends StatelessWidget {
  final HotelState state;
  const PriceButton({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocListener<HotelBloc, HotelState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == OrderStatus.success) {
            MyNavigatorManager.instance.pushSuccess();
            context.read<HotelBloc>().add(ChangeStatusEvnet());
          }
          if (state.status == OrderStatus.errror) {
            showMyIosResetDataPop(context);
          }
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: blocColo),
          child: Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 30, top: 16),
              child: SizedBox(
                height: 48,
                child: HotelButton(
                    text:
                        'Оплатить ${(state.reserv!.allPrice * state.client.tourists.length.clamp(1, 8)).moneyFormatter} ₽',
                    func: () {
                      context.read<HotelBloc>().add(SendOrderEvent());
                    }),
              )),
        ),
      ),
    );
  }
}

class OrderPrice extends StatelessWidget {
  final HotelState state;
  const OrderPrice({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: blocColo),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Тур', style: hotelCommentTS),
                  const Spacer(),
                  Text(
                      '${(state.reserv!.tourPrice * state.client.tourists.length.clamp(1, 8)).moneyFormatter} ₽',
                      style: hotelDescTS),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('Топливный сбор', style: hotelCommentTS),
                  const Spacer(),
                  Text(
                      '${(state.reserv!.fuelChange * state.client.tourists.length.clamp(1, 8)).moneyFormatter} ₽',
                      style: hotelDescTS),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('Сервисный сбор', style: hotelCommentTS),
                  const Spacer(),
                  Text(
                      '${(state.reserv!.serviceCharge * state.client.tourists.length.clamp(1, 8)).moneyFormatter} ₽',
                      style: hotelDescTS),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('К оплате', style: hotelCommentTS),
                  const Spacer(),
                  Text(
                      '${(state.reserv!.allPrice * state.client.tourists.length.clamp(1, 8)).moneyFormatter} ₽',
                      style: roomBoardTS),
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewTourist extends StatelessWidget {
  const NewTourist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: blocColo),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Добавить туриста', style: hotelTitleTS),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        context.read<HotelBloc>().add(AddTouristNumberEvent());
                      },
                      child: Image.asset('assets/images/add.png')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainInput extends StatelessWidget {
  const MainInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: blocColo),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Информация о покупателе', style: hotelTitleTS),
              const SizedBox(height: 15),
              const PhoneTF(),
              const SizedBox(height: 10),
              MyTF(
                text: 'Почта',
                func: (String value) =>
                    context.read<HotelBloc>().add(AddEmailEvent(email: value)),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Expanded(
                      child: Text(
                          'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                          style: supportTS))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneTF extends StatefulWidget {
  const PhoneTF({
    super.key,
  });

  @override
  State<PhoneTF> createState() => _PhoneTFState();
}

class _PhoneTFState extends State<PhoneTF> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: MediaQuery.of(context).size.width,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: textFieldBGColor),
        child: const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Номер телефона', style: textFieldHintTS),
              PhoneTextField(),
            ],
          ),
        ),
      ),
    );
  }
}

class ReservAllInfo extends StatelessWidget {
  const ReservAllInfo({
    super.key,
    required this.reserv,
  });

  final ReservModel reserv;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: blocColo),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReservInfo(resData: reserv.departure, data: 'Вылет из'),
              ReservInfo(resData: reserv.arrivalCountry, data: 'Страна, город'),
              ReservInfo(
                  resData: '${reserv.startDate} - ${reserv.stopDate}',
                  data: 'Даты'),
              ReservInfo(
                  resData: '${reserv.numberOfNights} ночей',
                  data: 'Кол-во ночей'),
              ReservInfo(resData: reserv.name, data: 'Отель'),
              ReservInfo(resData: reserv.room, data: 'Номер'),
              ReservInfo(resData: reserv.nutrition, data: 'Питание'),
            ],
          ),
        ),
      ),
    );
  }
}

class ReservInfo extends StatelessWidget {
  const ReservInfo({
    super.key,
    required this.resData,
    required this.data,
  });

  final String resData;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: Text(data, style: hotelCommentTS)),
          Flexible(
              fit: FlexFit.tight,
              flex: 5,
              child: Text(resData, style: reservInfoTS)),
        ],
      ),
    );
  }
}

class ReservHotelData extends StatelessWidget {
  final ReservModel reserv;
  const ReservHotelData({
    super.key,
    required this.reserv,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: blocColo),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HotelRatingBar(hotel: reserv),
              const SizedBox(height: 10),
              Text(reserv.name, style: hotelTitleTS),
              const SizedBox(height: 10),
              Text(reserv.hotelAdress, style: hotelAdressTS),
            ],
          ),
        ),
      ),
    );
  }
}
