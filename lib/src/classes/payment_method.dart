class PaymentMethodModel {
  var image = "";
  var name = "";
  var type = "";

  PaymentMethodModel({this.image = "", this.name = "", this.type = ""});

  static const TYPE_VIRTUAL_ACCOUNT = "va";
  static const TYPE_DEBIT_CARD = "dc";
  static const TYPE_E_WALLET = "ew";
}
