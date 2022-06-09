import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

//Fashion product list
class Fashion extends StatefulWidget {
  const Fashion({
    Key? key,
  }) : super(key: key);

  @override
  State<Fashion> createState() => _MobileState();
}

class _MobileState extends State<Fashion> {
  List<Product>? productList;

  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
      context: context,
      category: "Fashion",
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return productList == null
        ? const SizedBox()
        : Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                alignment: Alignment.topLeft,
                child: Text(
                  'Keep shopping for ${productList![0].category}',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 170,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 15),
                  itemCount: productList!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1.4,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final product = productList![index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ProductDetailScreen.routeName,
                          arguments: product,
                        );
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 130,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black12,
                                  width: 0.5,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.network(
                                  product.images[0],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                              left: 0,
                              top: 5,
                              right: 15,
                            ),
                            child: Text(
                              product.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
