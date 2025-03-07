import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/category_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class ProductCategories extends StatelessWidget {
  const ProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Categories', style: Theme.of(context).textTheme.headlineSmall,),
          SizedBox(height: TSizes.spaceBtwItems,),

          MultiSelectDialogField(items: [
            MultiSelectItem(CategoryModel(id: 'id', image: 'image', name: 'Shoes'), 'Shoes'),
            MultiSelectItem(CategoryModel(id: 'id', image: 'image', name: 'Shirts'), 'Shirts'),
          ], 
          listType: MultiSelectListType.CHIP,
          onConfirm: (value) {},
          )
        ],
      ),
    );
  }
}