import 'package:menta/src/classes/payment_method.dart';

class InvoiceModel {
  var method = PaymentMethodModel();
  var totalPrice = "0";
  var dueDate = "2020-12-12 23:59";

  InvoiceModel(
      {this.method, this.totalPrice = "0", this.dueDate = "2020-12-12 23:59"});
}
