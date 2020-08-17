import 'package:flutter/material.dart';
import 'package:menta/src/classes/invoice.dart';
import 'package:menta/src/classes/payment_method.dart';
import 'package:menta/src/classes/payment_methods.dart';
import 'package:menta/src/classes/va_invoice.dart';
import 'package:menta/src/utils/images.dart';


class PaymentProvider extends ChangeNotifier {
  var methods = PaymentMethodsModel();

  var selectedInvoice = InvoiceModel();
  var selectedMethod = PaymentMethodModel();

  getDummies() {
    methods.all.clear();

    final all = [
      PaymentMethodModel(
          image: AppImages.mandiri,
          name: "Mandiri",
          type: PaymentMethodModel.TYPE_DEBIT_CARD),
      PaymentMethodModel(
          image: AppImages.bni,
          name: "BNI",
          type: PaymentMethodModel.TYPE_DEBIT_CARD),

      // Virtual Account
      PaymentMethodModel(
          image: AppImages.briva,
          name: "BRIVA",
          type: PaymentMethodModel.TYPE_VIRTUAL_ACCOUNT),
      PaymentMethodModel(
          image: AppImages.bni,
          name: "BNI",
          type: PaymentMethodModel.TYPE_VIRTUAL_ACCOUNT),

      // E-Wallet
      PaymentMethodModel(
          image: AppImages.linkaja,
          name: "LinkAja",
          type: PaymentMethodModel.TYPE_E_WALLET),
      PaymentMethodModel(
          image: AppImages.ovo,
          name: "OVO",
          type: PaymentMethodModel.TYPE_E_WALLET),
    ];

    methods.all = all;

    selectedInvoice = VirtualAccountInvoiceModel(
        number: "8271088345327789", method: all[2], totalPrice: "Rp 100.000");
  }
}
