import 'package:flutter/material.dart';
import 'package:menta/src/classes/enum/payment_methods.dart';
import 'package:menta/src/classes/payment_method.dart';
import 'package:menta/src/utils/images.dart';

class PaymentProvider extends ChangeNotifier {
  var methods = PaymentMethodsModel();

  getDummies() {
    methods.all.clear();

    final all = [
      PaymentMethodModel(
          image: AppImages.star,
          name: "Mandiri",
          type: PaymentMethodModel.TYPE_DEBIT_CARD),
      PaymentMethodModel(
          image: AppImages.star,
          name: "BNI",
          type: PaymentMethodModel.TYPE_DEBIT_CARD),

      // Virtual Account
      PaymentMethodModel(
          image: AppImages.star,
          name: "BRIVA",
          type: PaymentMethodModel.TYPE_VIRTUAL_ACCOUNT),
      PaymentMethodModel(
          image: AppImages.star,
          name: "BNI",
          type: PaymentMethodModel.TYPE_VIRTUAL_ACCOUNT),

      // E-Wallet
      PaymentMethodModel(
          image: AppImages.star,
          name: "LinkAja",
          type: PaymentMethodModel.TYPE_E_WALLET),
      PaymentMethodModel(
          image: AppImages.star,
          name: "OVO",
          type: PaymentMethodModel.TYPE_E_WALLET),
    ];

    methods.all = all;
  }
}
