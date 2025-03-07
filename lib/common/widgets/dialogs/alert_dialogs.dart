import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class TAlertDialogs {
  void showCompletionDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Congratulations'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(TImages.productsIllustration, height: 200, width: 200),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              'Your product has been created!',
              style: Get.context?.theme.textTheme.bodyLarge ??
                  const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); 
              Get.back(); 
            },
            child: const Text('Go to Products'),
          ),
        ],
      ),
    );
  }

  Widget buildCheckbox(String label, RxBool value){
    return Row(
      children: [
        AnimatedSwitcher(
          duration: Duration(seconds: 2),
          child: value.value 
          ? Icon(CupertinoIcons.checkmark_alt_circle_fill, color: Colors.blue,)
          : Icon(CupertinoIcons.checkmark_alt_circle),
          ),
          SizedBox(width: TSizes.spaceBtwItems,),
          Text(label),
      ],
    );
  }


}
