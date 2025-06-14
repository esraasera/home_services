import 'package:flutter/material.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
import 'package:home_services_app/core/values/app_values.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController numberController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical:screenHeight*AppSize.s0_05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
              keyboardType: TextInputType.number,
              controller: numberController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.numError;
                }
                return null;
              }),
          SizedBox(
            height:screenHeight * AppSize.s0_05 ,
          ),
          TextFormField(
              keyboardType: TextInputType.text,
              controller: addressController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.numError;
                }
                return null;
              }),
          SizedBox(
            height:screenHeight * AppSize.s0_05 ,
          ),
          Row(
            children: [
              Image.asset(
                "assets/images/wallet_image.png",
                height: screenHeight * AppSize.s0_16,
                width:  screenWidth * AppSize.s0_3,
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        minimumSize: Size( screenWidth * AppSize.s0_6 , screenHeight * AppSize.s0_06),
                      ),
                      onPressed:() {},
                      child:Text(AppStrings.next)),
                  SizedBox(
                    height:screenHeight * AppSize.s0_005 ,
                  ),
                  ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        minimumSize: Size( screenWidth * AppSize.s0_6 , screenHeight * AppSize.s0_06),
                      ),
                      onPressed:() {},
                      child:Text(AppStrings.next)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

