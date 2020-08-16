import 'package:flutter/material.dart';
import 'package:menta/src/classes/payment_method.dart';
import 'package:menta/src/classes/va_invoice.dart';
import 'package:menta/src/data/payment.dart';
import 'package:menta/src/utils/colors.dart';
import 'package:menta/src/utils/fonts.dart';
import 'package:menta/src/utils/size.dart';
import 'package:menta/src/widgets/system/light_status_bar.dart';
import 'package:provider/provider.dart';

class VirtualAccountInvoicePage extends StatefulWidget {
  static const route = "/invoice/virtual-account";

  @override
  State createState() => _State();
}

class _State extends State<StatefulWidget> {
  PaymentProvider _provider;
  final keyValueSpacing = 5.0;

  @override
  Widget build(context) {
    _setUpProvider(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        brightness: Brightness.light,
        backgroundColor: Colors.grey[50],
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "Complete Payment",
          style: TextStyle(
              fontSize: 20,
              fontFamily: AppFonts.PRIMARY,
              color: AppColors.primaryText),
        ),
      ),
      body: LightStatusBar(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                child: _title(context),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: _image(context),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: _virtualAccountNumber(context),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: _totalInvoice(context),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: _dueDate(context),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                child: _button(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  VirtualAccountInvoiceModel get _invoice {
    final invoice = _provider.selectedInvoice;
    if (invoice is VirtualAccountInvoiceModel) {
      return invoice;
    }

    return VirtualAccountInvoiceModel();
  }

  PaymentMethodModel get _method {
    return _invoice.method;
  }

  _setUpProvider(context) {
    _provider = Provider.of<PaymentProvider>(context);

    AppSize.height = MediaQuery.of(context).size.height;
    AppSize.width = MediaQuery.of(context).size.width;
  }

  _title(context) {
    return Text(
      _method.name,
      style: TextStyle(
          fontSize: 24,
          fontFamily: AppFonts.PRIMARY,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryDark),
    );
  }

  _image(context) {
    return Image.asset(
      _method.image,
      width: AppSize.width / 2,
    );
  }

  _virtualAccountNumber(context) {
    return Column(children: [
      Text("Virtual Account Number"),
      Container(
          margin: EdgeInsets.only(top: keyValueSpacing),
          child: Text(
            _invoice.number,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
                fontFamily: AppFonts.PRIMARY,
                color: AppColors.primaryDark),
          ))
    ]);
  }

  _totalInvoice(context) {
    return Column(
      children: [
        Text("Total"),
        Container(
          margin: EdgeInsets.only(top: keyValueSpacing),
          child: Text(
            _invoice.totalPrice,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                fontFamily: AppFonts.PRIMARY,
                color: AppColors.primaryDark),
          ),
        )
      ],
    );
  }

  _dueDate(context) {
    return Column(
      children: [
        Text("Due Date"),
        Container(
          margin: EdgeInsets.only(top: keyValueSpacing),
          child: Text(
            _invoice.dueDate,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                fontFamily: AppFonts.PRIMARY,
                color: AppColors.primaryDark),
          ),
        )
      ],
    );
  }

  _button(context) {
    return MaterialButton(
      onPressed: () {},
      minWidth: double.infinity,
      color: AppColors.blueChatting,
      child: Text(
        "Back to Home".toUpperCase(),
        style: TextStyle(color: Colors.white, fontFamily: AppFonts.LATO),
      ),
    );
  }
}
