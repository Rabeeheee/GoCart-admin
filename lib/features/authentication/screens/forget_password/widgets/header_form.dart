import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/controller/forget_password_controller.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/text_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/validators/validation.dart';

class HeaderAndForm extends StatelessWidget {
  const HeaderAndForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
        final controller = Get.put(ForgetPasswordController());

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///header
        IconButton(onPressed: ()=> Get.back(), icon: Icon(Iconsax.arrow_left)),
        SizedBox(height: TSizes.spaceBtwItems,),
        Text(TTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium,),
        SizedBox(height: TSizes.spaceBtwItems,),
        Text(TTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium,),
        SizedBox(height: TSizes.spaceBtwSections,),
        Form(
           key: controller.ForgetPasswordFormkey,
              child: TextFormField(
                controller: controller.email,
                validator: TValidator.validateEmail,
                decoration: InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),),
        SizedBox(height: TSizes.spaceBtwSections,),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: () => controller.sendPasswordResetEmail(), child: Text(TTexts.submit)),
        ),
        SizedBox(height: TSizes.spaceBtwSections*2,)
    
    
      ],
    );
  }
}