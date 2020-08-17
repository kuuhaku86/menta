
import 'package:menta/src/classes/payment_method.dart';

class PaymentMethodsModel {
  var all = <PaymentMethodModel>[];

  List<PaymentMethodModel> get virtualAccount {
    return all
        .where((m) => m.type == PaymentMethodModel.TYPE_VIRTUAL_ACCOUNT)
        .toList();
  }

  List<PaymentMethodModel> get eWallet {
    return all
        .where((m) => m.type == PaymentMethodModel.TYPE_E_WALLET)
        .toList();
  }

  List<PaymentMethodModel> get debitCard {
    return all
        .where((m) => m.type == PaymentMethodModel.TYPE_DEBIT_CARD)
        .toList();
  }
}
