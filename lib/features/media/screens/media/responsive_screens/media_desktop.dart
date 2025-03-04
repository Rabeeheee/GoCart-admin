import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class MediaDesktopScreen extends StatelessWidget {
  const MediaDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TBreadcrumbWithHeading(heading: 'Media', breadcrumbItem: [TRoutes.media],),
            ],
            ),
            SizedBox(height: TSizes.spaceBtwSections,),
          ],
        ),
        ),
      ),
    );
  }
}