import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/forget_password/responsive_screens/forget_password_mobile.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/screens/forget_password/responsive_screens/forget_pasword_desktop_tablet.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      uselayout: false,
      mobile: ForgetPasswordScreenMobile(),
      desktop: ForgetPaswordScreenDesktopTablet(),
    );
  }
}