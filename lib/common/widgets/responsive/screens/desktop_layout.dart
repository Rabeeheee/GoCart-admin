import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/headers/header.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/side_bars/side_bar.dart';

class DesktopLayout extends StatelessWidget {
   DesktopLayout({super.key, this.body});

  final Widget? body;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: TSideBar()
            ),
            Expanded(
              flex: 5,
              child: Column(
              children: [
               THeader(),

                body ?? const SizedBox()
              ],
            ))
        ],
      ),
    );
  }
}