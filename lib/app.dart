import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/common/widgets/responsive/screens/mobile_layout.dart';
import 'package:yt_ecommerce_admin_panel/routes/app_routes.dart';
import 'package:yt_ecommerce_admin_panel/routes/routes.dart';
import 'utils/constants/text_strings.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      getPages: TAppRoute.pages,
      initialRoute: TRoutes.responsiveDesignScreen,
      unknownRoute: GetPage(
          name: '/Page not found',
          page: () => Scaffold(
                body: Center(
                  child: Text('Page not found'),
                ),
              )),
    );
  }
}

class ResponsiveDesignScreen extends StatelessWidget {
  const ResponsiveDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
      desktop: Desktop(),
      tablet: Tablet(),
      mobile: Mobile(),
    );
  }
}

class Desktop extends StatelessWidget {
  const Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              children: [
                TRoundedContainer(
                  height: 450,
                  backgroundColor: Colors.blue.withOpacity(0.2),
                  child: Center(
                    child: Text('BOX 1'),
                  ),
                )
              ],
            ))
          ],
        )
      ],
    );
  }
}

class Tablet extends StatelessWidget {
  const Tablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  TRoundedContainer(
                    height: 450,
                    backgroundColor: Colors.blue.withOpacity(0.2),
                    child: Center(
                      child: Text('BOX 1'),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    TRoundedContainer(
                      height: 215,
                      backgroundColor: Colors.orange.withOpacity(0.2),
                      child: Center(
                        child: Text('BOX 2'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row()
                  ],
                ))
          ],
        )
      ],
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TRoundedContainer(
                      height: 215,
                      backgroundColor: Colors.orange.withOpacity(0.2),
                      child: Center(
                        child: Text('BOX 2'),
                      ),
                    ),
                     SizedBox(
              width: 20,
            ),
        TRoundedContainer(
                      height: 215,
                      backgroundColor: Colors.orange.withOpacity(0.2),
                      child: Center(
                        child: Text('BOX 2'),
                      ),
                    ),
                     SizedBox(
              width: 20,
            ),
        TRoundedContainer(
                      height: 215,
                      backgroundColor: Colors.orange.withOpacity(0.2),
                      child: Center(
                        child: Text('BOX 2'),
                      ),
                    ),
                     SizedBox(
              width: 20,
            ),
        TRoundedContainer(
                      height: 215,
                      backgroundColor: Colors.orange.withOpacity(0.2),
                      child: Center(
                        child: Text('BOX 2'),
                      ),
                    ),
                     SizedBox(
              width: 20,
            ),
      ],
    );
  }
}
