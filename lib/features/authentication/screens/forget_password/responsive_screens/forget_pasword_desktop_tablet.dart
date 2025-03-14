import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/templates/login_template.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/forget_password/widgets/header_form.dart';

class ForgetPaswordScreenDesktopTablet extends StatelessWidget {
  const ForgetPaswordScreenDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return TLoginTemplate(
      child: HeaderAndForm(),
    );
  }
}

