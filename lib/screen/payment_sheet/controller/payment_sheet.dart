import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PaymentSheetController extends GetxController {
  double userAmount = 0;

  Future getAmount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userAmount = sharedPreferences.getDouble('amount') ?? 0.0;
    update();
  }

  Future createPaymentIntent(
      {required String amount, required String currency}) async {
    try {
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: {
          "amount": "${amount}00",
          "currency": currency,
          "payment_method_types[]": "card"
        },
        headers: {
          'Authorization':
              'Bearer sk_test_51O9nIoHSFV2X1M0tX7A7PXKSreDrfZBT6sgntuK8XCGAieTUeVZYhjcUcmJOsiyKWSOUfFSC9DNpLAxfeizi0Psp00RJk1SK8P',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      );
      print(response.body);
      return jsonDecode(response.body);
    } catch (error) {
      Get.snackbar("Error", error.toString());
    }
  }

  //Make Payment
  Future<void> makePayment(
      {required String amount, required String currency}) async {
    Map<String, dynamic>? paymentIntentData;
    try {
      paymentIntentData =
          await createPaymentIntent(amount: amount, currency: currency);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Rafsan Hossain',
          paymentIntentClientSecret: paymentIntentData["client_secret"],
          // customerEphemeralKeySecret: paymentIntentData['ephemeralKey'],
          //customerId: "id",
          allowsDelayedPaymentMethods: true,
          style: ThemeMode.light,
        ));
        await Stripe.instance.presentPaymentSheet();
        Get.snackbar("Success", "Payment successful");
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.clear();
        sharedPreferences.setDouble(
            'amount', (userAmount + int.parse(amount)).toDouble());
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
