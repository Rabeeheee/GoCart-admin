import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/data/repositories/authentication/authentication_repository.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/reset_password/reset_password.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/helpers/network_manager.dart';
import 'package:yt_ecommerce_admin_panel/utils/popups/full_screen_loader.dart';
import 'package:yt_ecommerce_admin_panel/utils/popups/loaders.dart';
class ForgetPasswordController extends GetxController {

  static ForgetPasswordController get instance => Get.find();


  final email = TextEditingController();
  GlobalKey<FormState> ForgetPasswordFormkey = GlobalKey<FormState>();


  sendPasswordResetEmail() async{
    try {
      TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.defaultLoaderAnimation);
    final isConnected = await NetworkManager.instance.isConnected();
    if(!isConnected){
      TFullScreenLoader.stopLoading();
      return;
    }

    if(!ForgetPasswordFormkey.currentState!.validate()){
      TFullScreenLoader.stopLoading();
      return;       
    }

    await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
    TFullScreenLoader.stopLoading();

    TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password.'.tr);

    Get.to(()=> ResetPasswordScreen(email: email.text.trim(),));

    } catch(e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email)async{
    try {
       TFullScreenLoader.openLoadingDialog('Processing your request...', TImages.defaultLoaderAnimation);

    final isConnected = await NetworkManager.instance.isConnected();
    if(!isConnected){
      TFullScreenLoader.stopLoading();
      return;
    }

    await AuthenticationRepository.instance.sendPasswordResetEmail(email);
    TFullScreenLoader.stopLoading();

    TLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password.'.tr);

    } catch(e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}