import 'package:flutter/material.dart';
import 'package:productcategory/model/product_model.dart';
import 'package:productcategory/service/api_service.dart';
import 'package:productcategory/view/category_list_screen.dart';
import 'package:productcategory/view/product_grid_screen.dart';

class CategoryProductScreen extends StatefulWidget {
  const CategoryProductScreen({super.key});

  @override
  _CategoryProductScreenState createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> {
  List<Product> products = [];
  String selectedCategory = "All";

  final List<String> categories = [
    "All",
    "FRUITS",
    "VEGETABLES",
    "EXOTICS",
    "FLOWERS",
    "LEAVES"
  ];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      final fetchedProducts = await ProductService().fetchProducts();
      setState(() {
        products = fetchedProducts;
      });
    } catch (error) {
      print(error);
      setState(() {
        products = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts = selectedCategory == "All"
        ? products
        : products.where((p) => p.category == selectedCategory).toList();

    return Scaffold(
      appBar:
          AppBar(title: const Text("Vegetables & Fruits"), centerTitle: true),
      body: Row(
        children: [
          CategoryList(
            categories: categories,
            selectedCategory: selectedCategory,
            onCategorySelected: (category) {
              setState(() {
                selectedCategory = category;
              });
            },
          ),
          Expanded(child: ProductGrid(products: filteredProducts)),
        ],
      ),
    );
  }
}
