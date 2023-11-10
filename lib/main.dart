import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:re_pr2_bhargav_2344/utils/MyRoutes.dart';
import 'package:re_pr2_bhargav_2344/views/screens/Detail_Page.dart';
import 'package:re_pr2_bhargav_2344/views/screens/FavritePage.dart';
import 'package:re_pr2_bhargav_2344/views/screens/HomePage.dart';
import 'package:re_pr2_bhargav_2344/views/screens/Splash_Screen.dart';
import 'controller/DB_Controller.dart';
import 'controller/api_controller.dart';
import 'helper/DB_Helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DBHelper.dbHelper.init_DB();
  DBController controller = Get.put(
    DBController(),
  );
  controller.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "e commerce",
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: MyRoutes.Splash_Screen,
      routes: {
        MyRoutes.homepage: (context) => HomePage(),
        MyRoutes.Splash_Screen: (context) => Splash_Screen(),
        MyRoutes.ProductDetailedPage: (context) => ProductDetailedPage(),
        MyRoutes.FavritePage: (context) => FavritePage(),
      },
    );
  }
}
