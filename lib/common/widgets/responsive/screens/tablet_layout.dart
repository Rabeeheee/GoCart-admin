import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/headers/header.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/side_bars/side_bar.dart';

class TabletLayout extends StatelessWidget {
   TabletLayout({super.key, this.body});

  final Widget? body;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: TSideBar(),
      appBar: THeader(scaffoldKey: scaffoldKey,),
      body: body,
    );
  }
}