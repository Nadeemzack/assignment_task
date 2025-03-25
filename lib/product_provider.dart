import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:assignment_task/product.dart';
import 'package:dio/dio.dart';

final productProvider = FutureProvider<List<Product>>((ref) async {
  final response = await Dio().get('https://dummyjson.com/products');
  final List products = response.data['products'];
  return products.map((product) => Product.fromJson(product)).toList();
});
