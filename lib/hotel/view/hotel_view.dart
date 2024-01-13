import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_test_app/const/extension.dart';
import 'package:hotel_test_app/hotel/domain/models/hotel_model.dart';
import 'package:hotel_test_app/navigation/nav_manager.dart';
import '../../const/text.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_page_view.dart';
import '../domain/bloc/hotel_bloc.dart';
import 'widgets/hotel_rating.dart';

class HotelView extends StatelessWidget {
  const HotelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: BlocBuilder<HotelBloc, HotelState>(
        buildWhen: (previous, current) => previous.hotel != current.hotel,
        builder: (context, state) {
          final hotel = state.hotel;
          if (hotel == null) return const SizedBox();
          return CustomScrollView(
            slivers: [
              const SliverAppBar(title: Text('Отель', style: appbarTS)),
              SliverToBoxAdapter(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HotelImageView(images: hotel.images),
                        const SizedBox(height: 20),
                        HotelRatingBar(hotel: hotel),
                        const SizedBox(height: 15),
                        HotelTitleView(hotel: hotel),
                      ],
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverToBoxAdapter(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 20, bottom: 40),
                    child: Column(
                      children: [
                        HotelDescrView(hotel: hotel),
                        const HotelService(),
                      ],
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverToBoxAdapter(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 20, bottom: 40),
                    child: Column(
                      children: [
                        SizedBox(
                            height: 48,
                            child: HotelButton(
                              text: 'К выбору номера',
                              func: () {
                                MyNavigatorManager.instance.pushRoom();
                              },
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class HotelService extends StatelessWidget {
  const HotelService({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          3,
          (index) => SizedBox(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Row(children: [
                    Image.asset(index.hotelServ['image'] ?? ''),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(index.hotelServ['1'] ?? '', style: hotelDescTS),
                        // const Spacer(),
                        const Text('Самое необходимое', style: hotelCommentTS),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.navigate_next,
                      size: 35,
                      color: Colors.black,
                    )
                  ]),
                ),
              )),
    );
  }
}

class HotelDescrView extends StatelessWidget {
  const HotelDescrView({
    super.key,
    required this.hotel,
  });

  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Об отеле', style: hotelTitleTS),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Wrap(
            runSpacing: 20,
            spacing: 20,
            children: hotel.tags
                .map((e) => Text(
                      e,
                      style: hotelCommentTS,
                    ))
                .toList(),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
                child: Text(
              hotel.description,
              style: hotelDescTS,
            ))
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class HotelTitleView extends StatelessWidget {
  const HotelTitleView({
    super.key,
    required this.hotel,
  });

  final HotelModel hotel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          hotel.name,
          style: hotelTitleTS,
        ),
        const SizedBox(height: 20),
        Text(hotel.adress, style: hotelAdressTS),
        const SizedBox(height: 20),
        Row(
          children: [
            Text(
              'от ${hotel.price.moneyFormatter} ₽ ',
              style: hotelTitleTS,
            ),
            Text(
              hotel.priceForIt.toLowerCase(),
              style: hotelCommentTS,
            ),
          ],
        ),
      ],
    );
  }
}
