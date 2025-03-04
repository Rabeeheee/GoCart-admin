import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/texts/page_heading.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class TBreadcrumbWithHeading extends StatelessWidget {
  const TBreadcrumbWithHeading({
    super.key,
    required this.heading,
    required this.breadcrumbItem,
    this.returnToPreviousScreen = false,
  });

  final String heading;

  final List<String> breadcrumbItem;

  final bool returnToPreviousScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () => Get.offAllNamed(TRoutes.dashboard),
              child: Padding(
                padding: const EdgeInsets.all(TSizes.xs),
                child: Text(
                  'Dashboard',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .apply(fontWeightDelta: -1),
                ),
              ),
            ),
            for (int i = 0; i < breadcrumbItem.length; i++)
              Row(
                children: [
                  Text('/'),
                  InkWell(
                    onTap: i == breadcrumbItem.length - 1
                        ? null
                        : () => Get.toNamed(breadcrumbItem[i]),
                    child: Padding(
                      padding: const EdgeInsets.all(TSizes.xs),
                      child: Text(
                        i == breadcrumbItem.length - 1
                            ? breadcrumbItem[i].capitalize.toString()
                            : capitalize(breadcrumbItem[i].substring(1)),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(fontWeightDelta: -1),
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),
        SizedBox(
          height: TSizes.sm,
        ),
        Row(
          children: [
            if (returnToPreviousScreen)
              IconButton(
                  onPressed: () => Get.back(), icon: Icon(Iconsax.arrow_left)),
            if (returnToPreviousScreen)
              SizedBox(
                width: TSizes.spaceBtwItems,
              ),
            TPageHeading(heading: heading),
          ],
        ),
      ],
    );
  }

  String capitalize(String s) {
    return s.isEmpty ? '' : s[0].toUpperCase() + s.substring(1);
  }
}
