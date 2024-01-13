import 'package:intl/intl.dart';

extension HotelService on int {
  Map<String, String> get hotelServ {
    switch (this) {
      case 0:
        return {
          'image': 'assets/images/emoji.png',
          '1': 'Удобства',
        };
      case 1:
        return {
          'image': 'assets/images/done.png',
          '1': 'Что включено',
        };
      case 2:
        return {
          'image': 'assets/images/close.png',
          '1': 'Что не включено',
        };
      default:
        return {
          'image': 'assets/images/close.png',
          '1': 'Что не включено',
        };
    }
  }
}

extension NuberString on int {
  String get numberString {
    switch (this) {
      case 0:
        return 'Первый';
      case 1:
        return 'Второй';
      case 2:
        return 'Третий';
      case 3:
        return 'Четвертый';
      case 4:
        return 'Пятый';
      case 5:
        return 'Шестой';
      case 6:
        return 'Седьмой';
      case 7:
        return 'Восьмой';
      default:
        return 'Новый';
    }
  }
}

extension SymCount on String {
  int get sCount {
    return replaceAll(RegExp(r'[^0-9]'), '').length;
  }
}

extension OnlyNumber on String {
  String get onlyNumber {
    return replaceAll(RegExp(r'[^0-9]'), '');
  }
}

extension MoneyFormatter on int {
  String get moneyFormatter {
    final format = NumberFormat.decimalPattern('ru');
    return format.format(this);
  }
}
