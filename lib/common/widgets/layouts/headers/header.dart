import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/images/t_rounded_image.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/shimmers/shimmer.dart';
import 'package:yt_ecommerce_admin_panel/features/authentication/controller/user_controller.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:yt_ecommerce_admin_panel/utils/device/device_utility.dart';

class THeader extends StatelessWidget implements PreferredSizeWidget {
  THeader({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Container(
        decoration: const BoxDecoration(
          color: TColors.white,
          border: Border(bottom: BorderSide(color: TColors.grey, width: 1)),
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.md, vertical: TSizes.sm),
        child: AppBar(
          leading: !TDeviceUtils.isDesktopScreen(context)
              ? IconButton(
                  onPressed: () => scaffoldKey?.currentState?.openDrawer(),
                  icon: const Icon(Iconsax.menu))
              : null,
          title: TDeviceUtils.isDesktopScreen(context)
              ? SizedBox(
                  width: 400,
                  child: TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.search_normal),
                        hintText: 'Search anything...'),
                  ),
                )
              : null,
          actions: [
            if (!TDeviceUtils.isDesktopScreen(context))
              IconButton(onPressed: () {}, icon: Icon(Iconsax.search_normal)),
            IconButton(onPressed: () {}, icon: Icon(Iconsax.notification)),
            SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => TRoundedImage(
                    width: 40,
                    padding: 2,
                    height: 40,
                    imageType: controller.user.value.profilePicture.isNotEmpty
                        ? ImageType.network
                        : ImageType.asset,
                    image: controller.user.value.profilePicture.isNotEmpty
                        ? controller.user.value.profilePicture
                        : TImages.user,
                  ),
                ),
                SizedBox(
                  width: TSizes.sm,
                ),
                if (!TDeviceUtils.isMobileScreen(context))
                  Obx(
                    () => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.loading.value
                            ?  TShimmerEffect(width: 50, height: 13)
                            : Text(
                                controller.user.value.fullName,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                        controller.loading.value
                            ? TShimmerEffect(width: 50, height: 13)
                            : Text(
                                controller.user.value.email,
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                      ],
                    ),
                  )
              ],
            )
          ],
        ));
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(TDeviceUtils.getAppBarHeight() + 15);
}
