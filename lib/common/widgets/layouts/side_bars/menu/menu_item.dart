import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/side_bars/side_bar_controller.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class TMenuItem extends StatelessWidget {
  const TMenuItem({
    super.key,
    required this.route,
    required this.icon,
    required this.itemName,
  });

  final String route;
  final IconData icon;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(SideBarController());

    return InkWell(
      onTap: () => menuController.menuOnTap(route),
      onHover: (hovering) =>
          menuController.changeHoverItem(hovering ? route : ''),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.xs),
          child: Container(
            decoration: BoxDecoration(
              color: menuController.isHovering(route) ||
                      menuController.isActive(route)
                  ? TColors.primary
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: TSizes.lg,
                    top: TSizes.md,
                    bottom: TSizes.md,
                    right: TSizes.md,
                  ),
                  child: Icon(
                    icon,
                    size: 22,
                    color: menuController.isActive(route)
                        ? TColors.white
                        : menuController.isHovering(route)
                            ? TColors.white
                            : TColors.darkGrey,
                  ),
                ),
                Flexible(
                  child: Text(
                    itemName,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: menuController.isActive(route) ||
                                  menuController.isHovering(route)
                              ? TColors.white
                              : TColors.darkerGrey,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
