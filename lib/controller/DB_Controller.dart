import 'dart:developer';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:re_pr2_bhargav_2344/modals/P_modal.dart';

import '../helper/DB_Helper.dart';

class DBController extends GetxController {
  RxList<Pmodal> allProducts = <Pmodal>[].obs;

  init() async {
    allProducts(await DBHelper.dbHelper.displayProduct());
    allProducts.value.forEach((element) {
      log("Data: ${element.id} => ${element.name}");
    });
  }

  Future<int> insert_product(
      {required String name, required String image}) async {
    log("${name} or ${image}");
    return await DBHelper.dbHelper.insert_product(name: name, image: image);
  }

  Future<List<Pmodal>> display_Product() async {
    allProducts(await DBHelper.dbHelper.displayProduct());
    log("getAllProdcuts - ${allProducts.toString()}");
    return allProducts;
  }
}
