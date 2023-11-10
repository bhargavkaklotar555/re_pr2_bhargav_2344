import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../controller/api_controller.dart';
import '../../modals/Productsmodals.dart';
import 'package:provider/provider.dart';

import '../../utils/MyRoutes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/logo.png"),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.favorite_border,
                    size: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(MyRoutes.FavritePage);
                    },
                    child: const Text(
                      "Favrite",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    CupertinoIcons.cart,
                    size: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(MyRoutes.Cart_Page);
                    },
                    child: const Text(
                      "Cart",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<ProductController>(
          builder: (context, pro, _) {
            return FutureBuilder(
              future: pro.getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 300,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      ProductModal productModal = snapshot.data![index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            MyRoutes.ProductDetailedPage,
                            arguments: pro.allProducts[index],
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridTile(
                            child: Column(
                              children: [
                                Hero(
                                  tag: 'a',
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Center(
                                          child: SizedBox(
                                            height: 150,
                                            width: 200,
                                            child: Image.network(
                                              productModal.thumbnail,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      productModal.title,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize:
                                              productModal.title.length > 10
                                                  ? 8
                                                  : 12),
                                      overflow: TextOverflow.fade,
                                    ),
                                    const Spacer(),
                                    Text(
                                      "₹${productModal.price}",
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      productModal.category,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("ERROR: ${snapshot.error}"),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.indigo,
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
