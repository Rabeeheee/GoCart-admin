import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/responsive/responsive_widget.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/responsive/screens/desktop_layout.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/responsive/screens/mobile_layout.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/responsive/screens/tablet_layout.dart';

class TSiteTemplate extends StatelessWidget {
  const TSiteTemplate({super.key, this.desktop,  this.tablet,  this.mobile, this.uselayout = true});

  final Widget? desktop;
  final Widget? tablet;
  final Widget? mobile;

  final bool uselayout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TResponsiveWidget(
          desktop: uselayout ? DesktopLayout(body: desktop) : desktop ?? Container(), 
          tablet:uselayout ? TabletLayout(body: tablet ?? desktop) : tablet ?? desktop ?? Container(), 
          mobile: uselayout ? MobileLayout(body: mobile ?? desktop) : mobile ?? desktop ?? Container(),
          ),
    );
  }
}