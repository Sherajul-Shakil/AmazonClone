import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/features/home/widgets/category_product/appliances.dart';
import 'package:amazon_clone/features/home/widgets/category_product/books.dart';
import 'package:amazon_clone/features/home/widgets/category_product/essentials.dart';
import 'package:amazon_clone/features/home/widgets/category_product/fashion.dart';
import 'package:amazon_clone/features/home/widgets/category_product/mobile.dart';
import 'package:amazon_clone/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

//Category product list
class AllProductCategoryWise extends StatefulWidget {
  static const String routeName = '/all-product';
  const AllProductCategoryWise({
    Key? key,
  }) : super(key: key);

  @override
  State<AllProductCategoryWise> createState() => _AllProductCategoryWiseState();
}

class _AllProductCategoryWiseState extends State<AllProductCategoryWise> {
  List<Product>? productList;

  final HomeServices homeServices = HomeServices();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Mobile(),
        SizedBox(height: 10),
        Essentials(),
        SizedBox(height: 10),
        Appliances(),
        SizedBox(height: 10),
        Books(),
        SizedBox(height: 10),
        Fashion(),
        SizedBox(height: 10),
      ],
    );
  }
}
