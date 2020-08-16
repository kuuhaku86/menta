import 'invoice.dart';

class VirtualAccountInvoiceModel extends InvoiceModel {
  var number = "";

  VirtualAccountInvoiceModel({this.number, method, totalPrice})
      : super(method: method, totalPrice: totalPrice);
}