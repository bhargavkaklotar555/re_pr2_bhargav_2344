import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/DB_Controller.dart';

class FavritePage extends StatelessWidget {
  FavritePage({super.key});

  DBController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            backgroundColor:
                                Colors.primaries[index % 18].shade200,
                            child: Text(
                              "${controller.allProducts[index].name?.substring(0, 1).toUpperCase()}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
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
