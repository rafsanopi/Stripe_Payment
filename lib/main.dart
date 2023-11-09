import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:stripe_payment/screen/payment_sheet/payment_sheet_ui.dart';
import 'package:stripe_payment/screen/payment_with_text_field/controller/payment_form_field_controller.dart';
import 'package:stripe_payment/screen/payment_with_text_field/payment_with_text_field_ui.dart';

void main() {
  Get.lazyPut(() => PaymentFormFieldController(), fenix: true);
  Stripe.publishableKey =
      'pk_test_51O9nIoHSFV2X1M0tWjfHXoRLm6Y2qOzTRjn2EErsoHvLeW8Wzk3WnLisaVdHFHcXCGFydr2OfkgPOQA7pYKyZpjq00jKmoZewB';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Screens
    List<Widget> screens = [
      const PaymentWithSheetUI(),
      const PaymentWithFormUI()
    ];

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("All Payment"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => screens[0]);
                    },
                    child: const Text("Payment With Bottom Sheet")),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.to(() => screens[1]);
                    },
                    child: const Text("Payment With Text Form Field"))
              ],
            ),
          ),
        ));
  }
}
