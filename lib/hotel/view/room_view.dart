import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_test_app/const/extension.dart';
import 'package:hotel_test_app/const/text.dart';
import 'package:hotel_test_app/navigation/nav_manager.dart';
import 'package:hotel_test_app/widgets/custom_page_view.dart';

import '../../const/colors.dart';
import '../../widgets/custom_button.dart';
import '../domain/bloc/hotel_bloc.dart';

class RoomView extends StatelessWidget {
  const RoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        final hotel = state.hotel;
        final rooms = state.rooms;
        if (hotel == null) return const SizedBox();
        return Scaffold(
          body: CustomScrollView(slivers: [
            SliverAppBar(title: Text(hotel.name, style: appbarTS)),
            SliverList.builder(
                itemCount: rooms.length,
                itemBuilder: (context, index) {
                  final room = rooms[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: blocColo,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 16, bottom: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HotelImageView(images: room.images),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                      child:
                                          Text(room.name, style: hotelTitleTS))
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Wrap(
                                  runSpacing: 20,
                                  spacing: 20,
                                  children: room.peculiarities
                                      .map((e) => Text(
                                            e,
                                            style: hotelCommentTS,
                                          ))
                                      .toList(),
                                ),
                              ),
                              const SizedBox(height: 10),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                    color: roomBoard,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Подробнее о номере',
                                        style: roomBoardTS,
                                      ),
                                      Icon(Icons.navigate_next,
                                          size: 35, color: buttonColor)
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 40,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('${room.price.moneyFormatter} ₽ ',
                                        style: roomPriceTS),
                                    Text(
                                      room.pricePer.toLowerCase(),
                                      style: hotelCommentTS,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                height: 48,
                                child: HotelButton(
                                  func: () {
                                    MyNavigatorManager.instance.pushReserv();
                                  },
                                  text: 'Выбрать номер',
                                ),
                              )
                            ]),
                      ),
                    ),
                  );
                })
          ]),
        );
      },
    );
  }
}
