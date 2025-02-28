import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right), labelText: TTexts.email
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields,),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.password_check), labelText: TTexts.password,
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields/2,),
    
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                 mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(value: true, onChanged: (value) {
                    
                  },),
                  Text(TTexts.rememberMe),
                ],
              ),
              TextButton(onPressed: (){}, child: Text(TTexts.forgetPassword))
            ],
          ),
          SizedBox(height: TSizes.spaceBtwSections,),
          SizedBox(width: double.infinity,
          child: ElevatedButton(onPressed: (){}, child: Text(TTexts.signIn)),
          )
        ],
      ),
      ),
      );
  }
}
