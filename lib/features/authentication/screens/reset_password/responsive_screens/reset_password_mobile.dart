import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/reset_password/widgets/reset_password_widget.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class ResetPasswordMobile extends StatelessWidget {
  const ResetPasswordMobile({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ResetpasswordWidget(email: email,),
        ),
      ),
    );
  }
}