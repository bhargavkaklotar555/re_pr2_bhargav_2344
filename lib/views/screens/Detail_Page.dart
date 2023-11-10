import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../controller/DB_Controller.dart';
import '../../controller/api_controller.dart';
import '../../modals/Productsmodals.dart';

class ProductDetailedPage extends StatelessWidget {
  const ProductDetailedPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductModal data =
        ModalRoute.of(context)!.settings.arguments as ProductModal;

    Size size = MediaQuery.of(context).size;
    DBController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${data.title}",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.insert_product(
                  name: "${data.title}", image: "${data.thumbnail}");
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
          ),
          Hero(
            tag: 'a',
            child: Center(
              child: Image.network(
                data.thumbnail,
                height: size.height * 0.25,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Consumer<ProductController>(builder: (context, pro, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${data.title}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const Text(
                    "Description:",
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${data.descprition}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Text(
                        "Category:",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${data.category}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Quantity:",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 40,
                    width: 157,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (data.quantity > 0) {
                              data.quantity--;
                            }
                          },
                          icon: const Icon(
                            Icons.remove,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Text(
                          "${data.quantity}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 27,
                        ),
                        IconButton(
                          onPressed: () {
                            data.quantity++;
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Stock:",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "${data.stock}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      // pro.addCart(productModal: data);
                      // Navigator.of(context).pushNamed(MyRoutes.cartPage);
                    },
                    child: Container(
                      height: 40,
                      width: 330,
                      decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Add to Cart",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
