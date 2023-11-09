import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:stripe_payment/screen/payment_with_text_field/controller/payment_form_field_controller.dart';
import 'package:stripe_payment/screen/widget/custom_text/custom_text.dart';
import 'package:stripe_payment/screen/widget/custom_text_field/custom_text_field.dart';

class PaymentWithFormUI extends StatefulWidget {
  const PaymentWithFormUI({super.key});

  @override
  State<PaymentWithFormUI> createState() => _PaymentWithFormUIState();
}

class _PaymentWithFormUIState extends State<PaymentWithFormUI> {
  @override
  void initState() {
    super.initState();
  }

  CardDetails card = CardDetails();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentFormFieldController>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 24),
          child: ElevatedButton(
              onPressed: () {
                controller.handlePayPress(card: card, context: context);
              },
              child: const Text("Make Payment")),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Card Number
                  const CustomText(
                    text: "Card Number",
                    bottom: 8,
                  ),

                  CustomTextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      card = card.copyWith(number: value);
                    },
                    textEditingController: controller.cardNumberController,
                    readOnly: false,
                    hintText: "Enter card number",
                  ),

                  //Expire Date
                  const CustomText(
                    top: 16,
                    text: "ExpiredDate",
                    bottom: 8,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            card = card.copyWith(
                                expirationMonth: int.parse(value));
                          },
                          textEditingController: controller.monthController,
                          readOnly: false,
                          hintText: "MM",
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomTextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            card =
                                card.copyWith(expirationYear: int.parse(value));
                          },
                          textEditingController: controller.yearController,
                          readOnly: false,
                          hintText: "YY",
                        ),
                      ),
                    ],
                  ),

                  //CVV/CVC
                  const CustomText(
                    top: 16,
                    text: "CVV/CVC",
                    bottom: 8,
                  ),

                  CustomTextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      card = card.copyWith(cvc: value);
                    },
                    textEditingController: controller.cVVCVCController,
                    readOnly: false,
                    hintText: "CVV/CVC",
                  ),

                  //Card Holder name

                  const CustomText(
                    top: 16,
                    text: "Card Holder Name",
                    bottom: 8,
                  ),

                  CustomTextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                    textEditingController: controller.cardHolderNameController,
                    readOnly: false,
                    hintText: "Enter card holder name",
                  ),

                  //Enter Ammount

                  const CustomText(
                    top: 16,
                    text: "Amount",
                    bottom: 8,
                  ),

                  CustomTextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                    textEditingController: controller.ammountController,
                    readOnly: false,
                    hintText: "\$",
                  ),
                ],
              )),
        ),
      );
    });
  }
}
