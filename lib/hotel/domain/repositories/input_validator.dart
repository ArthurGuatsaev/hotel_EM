import 'package:flutter/material.dart';

class Validator {
  static Widget nameValidator(String? name) {
    if (name == null) {
      return const Icon(Icons.error_sharp, color: Colors.red);
    } else if (name.contains('/')) {
      return const Icon(Icons.error_sharp, color: Colors.red);
    } else if (name.length >= 2) {
      return const Icon(Icons.done, color: Colors.green);
    } else {
      return const Icon(Icons.error_sharp, color: Colors.red);
    }
  }

  static String? nameValidatorString(String? name) {
    if (name == null) {
      return 'Незаполненное поле';
    } else if (name.contains('/')) {
      return 'Недопустимый символ';
    } else if (name.length <= 2) {
      return 'Слишком короткое имя';
    } else {
      return null;
    }
  }

  static Widget emailValidator(String? email) {
    if (email == null) {
      return const Icon(Icons.error_sharp, color: Colors.red);
    } else if (!email.contains('@')) {
      return const Icon(Icons.error_sharp, color: Colors.red);
    } else if (email.contains(' ')) {
      return const Icon(Icons.error_sharp, color: Colors.red);
    } else if (email.length <= 5) {
      return const Icon(Icons.error_sharp, color: Colors.red);
    } else {
      return const Icon(Icons.done, color: Colors.green);
    }
  }

  static String? emailValidatorString(String? email) {
    if (email == null) {
      return null;
    } else if (!email.contains('@')) {
      return 'Ваш email должен содержать "@"';
    } else if (email.contains(' ')) {
      return 'Ваш email не должен содержать пробелов';
    } else if (email.length >= 5) {
      return null;
    } else {
      return 'Cлишком короткий адрес электронной почты';
    }
  }

  static Widget dateValidator(String? phone) {
    if (phone == null) {
      return const Icon(Icons.error_sharp, color: Colors.red);
    } else if (phone.length == 10) {
      return const Icon(Icons.done, color: Colors.green);
    } else {
      return const Icon(Icons.error_sharp, color: Colors.red);
    }
  }

  static String? dateValidatorString(String? phone) {
    if (phone == null) {
      return null;
    } else if (phone.length == 10) {
      return null;
    } else {
      return 'Некорректная дата';
    }
  }

  static Widget phoneValidator(String? phone) {
    if (phone == null) {
      return const Icon(Icons.error_sharp, color: Colors.red);
    } else if (phone.length == 10) {
      return const Icon(Icons.done, color: Colors.green);
    } else {
      return const Icon(Icons.error_sharp, color: Colors.red);
    }
  }

  static String? phoneValidatorString(String? phone) {
    if (phone == null) {
      return 'Некорректный номер телефона';
    } else if (phone.length < 10 || phone.length > 10) {
      return 'Некорректный номер телефона';
    } else if (int.tryParse(phone) == null) {
      return 'Некорректный номер телефона';
    } else {
      return null;
    }
  }
}
