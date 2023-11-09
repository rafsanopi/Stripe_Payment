import 'package:flutter/material.dart';
import 'package:stripe_payment/screen/payment_sheet/controller/payment_sheet.dart';

class PaymentWithSheetUI extends StatefulWidget {
  const PaymentWithSheetUI({super.key});

  @override
  State<PaymentWithSheetUI> createState() => _PaymentWithSheetUIState();
}

class _PaymentWithSheetUIState extends State<PaymentWithSheetUI> {
  var obj = PaymentSheetController();
  @override
  void initState() {
    obj.makePayment(amount: "5", currency: "USD");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}
