import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menta/src/classes/payment_method.dart';
import 'package:menta/src/data/payment.dart';
import 'package:menta/src/pages/payment/va_invoice.dart';
import 'package:menta/src/utils/colors.dart';
import 'package:menta/src/utils/fonts.dart';
import 'package:menta/src/widgets/system/light_status_bar.dart';
import 'package:provider/provider.dart';

class ChoosePaymentPage extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<ChoosePaymentPage> {
  PaymentProvider _provider;
  var _selected = PaymentMethodModel();

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
          "Choose Payment Method",
          style: TextStyle(
              fontSize: 20,
              fontFamily: AppFonts.PRIMARY,
              color: AppColors.primaryText),
        ),
      ),
      body: LightStatusBar(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: AppColors.lightGreyBackground,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _eWallet(context),
                      _virtualAccount(context),
                      _debitCard(context)
                    ],
                  ),
                ),
              ),
            ),
            _price(context),
            _button(context)
          ],
        ),
      ),
    );
  }

  _setUpProvider(context) {
    _provider = Provider.of<PaymentProvider>(context);
  }

  _methodItemView(PaymentMethodModel method) {
    return InkWell(
      onTap: () {
        setState(() {
          _selected = method;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Row(
          children: [
            Image.asset(
              method.image,
              width: 45,
            ),

            // Name
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  method.name,
                  style: TextStyle(fontFamily: AppFonts.PRIMARY),
                ),
              ),
            ),

            // Checkbox
            Icon(
              _selected == method
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: AppColors.blueChatting,
            )
          ],
        ),
      ),
    );
  }

  _methodListView(List<PaymentMethodModel> methods, {String name = ""}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            name.toUpperCase(),
            style: TextStyle(
                color: AppColors.textGray1, fontFamily: AppFonts.PRIMARY),
          ),
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: methods.length,
            itemBuilder: (context, i) {
              return _methodItemView(methods[i]);
            })
      ],
    );
  }

  _virtualAccount(context) {
    final methods = _provider.methods.virtualAccount;
    return _methodListView(methods, name: "Transfer Virtual Account");
  }

  _debitCard(context) {
    final methods = _provider.methods.debitCard;
    return _methodListView(methods, name: "Debit Card");
  }

  _eWallet(context) {
    final methods = _provider.methods.eWallet;
    return _methodListView(methods, name: "E-Wallet");
  }

  _price(context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 15),
      child: Row(
        children: [
          Text(
            "Total",
            style: TextStyle(
                fontFamily: AppFonts.LATO,
                color: AppColors.primaryText,
                fontSize: 17),
          ),
          Expanded(
            child: Container(),
          ),
          Text("IDR 100,000",
              style: TextStyle(
                  fontFamily: AppFonts.LATO,
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.bold,
                  fontSize: 17))
        ],
      ),
    );
  }

  _button(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: () {
          Navigator.pushNamed(context, VirtualAccountInvoicePage.route);
        },
        color: AppColors.blueChatting,
        child: Text(
          "Pay Now".toUpperCase(),
          style: TextStyle(fontFamily: AppFonts.LATO, color: Colors.white),
        ),
      ),
    );
  }
}
