import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/colors.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class ProductAdditionalImage extends StatelessWidget {
  const ProductAdditionalImage(
      {super.key,
      required this.additionalProductImageURLs,
      this.onTapToAddImage,
      this.onTapToRemoveImage});

  final RxList<String> additionalProductImageURLs;
  final void Function()? onTapToAddImage;
  final void Function(int index)? onTapToRemoveImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: onTapToAddImage,
                child: TRoundedContainer(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          TImages.defaultAttributeColorsImageIcon,
                          width: 50,
                          height: 50,
                        ),
                        Text('Add Additional Product Images'),
                      ],
                    ),
                  ),
                ),
              )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child:
                      SizedBox(height: 80, child: _uploadedImageOrEmptyList())),
              SizedBox(
                width: TSizes.spaceBtwItems / 2,
              ),
              TRoundedContainer(
                width: 80,
                height: 80,
                showBorder: true,
                borderColor: TColors.grey,
                backgroundColor: TColors.white,
                onTap: onTapToAddImage,
                child: Center(
                  child: Icon(Iconsax.add),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _uploadedImageOrEmptyList() {
    return emptyList();
  }

  Widget emptyList() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => SizedBox(
        width: TSizes.spaceBtwItems / 2,
      ),
      itemCount: 6,
      itemBuilder: (context, index) => TRoundedContainer(
        backgroundColor: TColors.primaryBackground,
        width: 80,
        height: 80,
      ),
    );
  }

  // ListView _uploadedImages() {
  //   return ListView.separated(
  //     separatorBuilder: (context, index) => SizedBox(
  //       width: TSizes.spaceBtwItems / 2,
  //     ),
  //     itemCount: additionalProductImageURLs.length,
  //     itemBuilder: (context, index) {
  //       final image = additionalProductImageURLs[index];
  //       return TImageUploader(
  //         top: 0,
  //         right: 0,
  //         width: 80,
  //         height: 80,
  //         left: null,
  //         bottom: null,
  //         image: image,
  //         imageType: ImageType.network,
  //         onIconButtonPressed: () => onTapToRemoveImage!(index),
  //       );
  //     },
  //   );
  // }
}
