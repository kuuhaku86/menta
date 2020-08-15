import 'package:flutter/material.dart';
import 'package:menta/src/classes/payment_method.dart';
import 'package:menta/src/data/payment.dart';
import 'package:menta/src/utils/colors.dart';
import 'package:menta/src/utils/fonts.dart';
import 'package:menta/src/utils/size.dart';
import 'package:menta/src/widgets/system/light_status_bar.dart';
import 'package:provider/provider.dart';

class InvoicePage extends StatefulWidget {
  @override
  State createState() => _State();
}

class _State extends State<StatefulWidget> {
  PaymentProvider _provider;

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
        child: Column(
          children: [
            _title(context),
            _image(context),
            _virtualAccountNumber(context),
            _totalInvoice(context),
            _dueDate(context)
          ],
        ),
      ),
    );
  }

  VirtualAccountMethodModel get _method {
    final method = _provider.selectedInvoice.method;
    if (method is VirtualAccountMethodModel) {
      return method;
    }

    return VirtualAccountMethodModel();
  }

  _setUpProvider(context) {
    _provider = Provider.of<PaymentProvider>(context);
  }

  _title(context) {
    return Text(
      _method.name,
      style: TextStyle(
          fontFamily: AppFonts.PRIMARY,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryText),
    );
  }

  _image(context) {
    return Image.asset(
      _method.name,
      width: AppSize.width / 2,
    );
  }

  _virtualAccountNumber(context) {
    return Column(
      children: [Text("Virtual Account Number"), Text(_method.number)],
    );
  }

  _totalInvoice(context) {
    return Column(
      children: [Text("Total"), Text("Rp 100.000")],
    );
  }

  _dueDate(context) {
    return Column(
      children: [Text("Total"), Text("31 Desember 2020 03:43")],
    );
  }
}
