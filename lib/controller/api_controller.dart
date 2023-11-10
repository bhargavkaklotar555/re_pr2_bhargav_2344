import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:re_pr2_bhargav_2344/helper/API_Helper.dart';
import '../modals/Productsmodals.dart';

class ProductController extends ChangeNotifier {
  List<ProductModal> allProducts = <ProductModal>[];

  Future<List<ProductModal>> getAllProducts() async {
    allProducts = (await ProductsHelper.productsHelper.getProducts())!;
    log("$allProducts");
    return allProducts;
  }
}
