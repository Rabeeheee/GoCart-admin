import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/screens/dashboard/widgets/dashboard_card.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/sizes.dart';

class DashboardMobileScreen extends StatelessWidget {
  const DashboardMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dashboard', style: Theme.of(context).textTheme.headlineLarge,),
            SizedBox(height: TSizes.spaceBtwSections,),

            TDashboardCard(
             stats: 25,
             title: 'Sales total',
             subtitle: '\$365.9',
            ),
            SizedBox(height: TSizes.spaceBtwItems,),
            TDashboardCard(
             stats: 15,
             title: 'Average Order Value',
             subtitle: '\$325',
            ),
              SizedBox(height: TSizes.spaceBtwItems,),
            TDashboardCard(
             stats: 44,
             title: 'Total Orders',
             subtitle: '\$36',
            ),
            SizedBox(height: TSizes.spaceBtwItems,),
            TDashboardCard(
             stats: 2,
             title: 'Visitors',
             subtitle: '\$25,035',
            ),
          ],
        ),
        ),
      ),
    );
  }
}