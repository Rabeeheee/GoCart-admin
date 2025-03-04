import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/controller/login_controller.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/text_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Column(
        children: [
          TextFormField(
            controller: controller.email,
            validator: TValidator.validateEmail,
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right), labelText: TTexts.email
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields,),
          Obx(
            ()=> TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validateEmptyText('Password', value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check), labelText: TTexts.password,
                suffixIcon: IconButton(onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value, icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye) ),
              ),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields/2,),
    
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                 mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    ()=> Checkbox(value: controller.rememberMe.value, onChanged: (value) => controller.rememberMe.value = value!,),
                  ),
                  Text(TTexts.rememberMe),
                ],
              ),
              TextButton(onPressed: () => Get.toNamed(TRoutes.forgetPassword) , child: Text(TTexts.forgetPassword))
            ],
          ),
          SizedBox(height: TSizes.spaceBtwSections,),
          SizedBox(width: double.infinity,
          child: ElevatedButton(onPressed: ()=> controller.emailAndPasswordSignIn(), child: Text(TTexts.signIn)),
          // child: ElevatedButton(onPressed: ()=> controller.registerAdmin(), child: Text(TTexts.signIn)),
          )
        ],
      ),
      ),
      );
  }
}
