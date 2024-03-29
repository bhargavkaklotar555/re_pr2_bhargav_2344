import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re_pr2_bhargav_2344/helper/DB_Helper.dart';
import '../../controller/DB_Controller.dart';

class FavritePage extends StatelessWidget {
  FavritePage({super.key});

  DBController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.init();
    return Scaffold(
      appBar: AppBar(
        title: Text("FavritePage"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Obx(
          () {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.allProducts.value.length,
                    itemBuilder: (context, index) {
                      log("----------------");
                      log("${controller.allProducts.value[index].name}");
                      return Card(
                        child: ListTile(
                          onTap: () {},
                          title: Text(
                            controller.allProducts.value[index].name.toString(),
                          ),
                          leading: CircleAvatar(
                            radius: 22,
                            backgroundImage: NetworkImage(
                              controller.allProducts.value[index].image
                                  .toString(),
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              DBHelper.dbHelper.removeProduct(
                                pid: int.parse(
                                    "${controller.allProducts.value[index].id}"),
                              );
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
