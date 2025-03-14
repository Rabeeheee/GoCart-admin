import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/templates/login_template.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/reset_password/widgets/reset_password_widget.dart';

class ResetPasswordDesktopTablet extends StatelessWidget {
  const ResetPasswordDesktopTablet({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {

    return TLoginTemplate(
      child: ResetpasswordWidget(email: email,),
    );
  }
}

