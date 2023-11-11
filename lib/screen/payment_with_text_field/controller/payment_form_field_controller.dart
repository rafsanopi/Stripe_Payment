// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:get/get.dart';

// class PaymentFormFieldController extends GetxController {
//   TextEditingController cardNumberController =
//       TextEditingController(text: "4242424242424242");
//   TextEditingController monthController = TextEditingController(text: "10");
//   TextEditingController yearController = TextEditingController(text: "34");
//   TextEditingController cVVCVCController = TextEditingController(text: "123");
//   TextEditingController cardHolderNameController =
//       TextEditingController(text: "rafsan");
//   TextEditingController ammountController = TextEditingController(text: "5");

//   String kApiUrl = "";

//   Future<void> handlePayPress({required BuildContext context}) async {
//     // 1. fetch Intent Client Secret from backend
//     final clientSecret = await fetchPaymentIntentClientSecret();

//     // 2. Gather customer billing information (ex. email)
//     const billingDetails = BillingDetails(
//       email: "mdh95831@gmail.com",
//       phone: '+48888000888',
//       address: Address(
//         city: 'Houston',
//         country: 'US',
//         line1: '1459  Circle Drive',
//         line2: '',
//         state: 'Texas',
//         postalCode: '77063',
//       ),
//     ); // mo mocked data for tests

//     // 3. Confirm payment with card details
//     // The rest will be done automatically using webhooks
//     // ignore: unused_local_variable
//     CardDetails card = CardDetails(
//       number: '4242424242424242',
//       expirationMonth: 10,
//       expirationYear: 34,
//     );
//     final paymentIntent = await Stripe.instance.createPaymentMethod(

//       paymentIntentClientSecret: clientSecret['client_secret'],
//       data: const PaymentMethodParams.card(
//         paymentMethodData: PaymentMethodData(
//           billingDetails: billingDetails,
//         ),
//       ),
//       options: PaymentMethodOptions(
//         setupFutureUsage: PaymentIntentsFutureUsage.OnSession,
//       ),
//     );

//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Success!: The payment was confirmed successfully!')));
//   }

//   Future fetchPaymentIntentClientSecret() async {
//     try {
//       var response = await http.post(
//         Uri.parse('https://api.stripe.com/v1/payment_intents'),
//         body: {
//           "amount": "${20}00",
//           "currency": "USD",
//           "payment_method_types[]": "card"
//         },
//         headers: {
//           'Authorization':
//               'Bearer sk_test_51O9nIoHSFV2X1M0tX7A7PXKSreDrfZBT6sgntuK8XCGAieTUeVZYhjcUcmJOsiyKWSOUfFSC9DNpLAxfeizi0Psp00RJk1SK8P',
//           'Content-Type': 'application/x-www-form-urlencoded'
//         },
//       );
//       print(response.body);
//       return jsonDecode(response.body);
//     } catch (error) {
//       Get.snackbar("Error", error.toString());
//     }
//   }
// }
