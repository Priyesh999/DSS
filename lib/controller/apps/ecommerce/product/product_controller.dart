
import 'package:dss_code/controller/apps/ecommerce/product/productbinding.dart';
import 'package:dss_code/controller/apps/ecommerce/product/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../app_route/app_pages.dart';
import '../../../../model/product.dart';
import '../../../my_controller.dart';



class ProductController extends MyController {
  List<Product> products = [];
  DataTableSource? data;

  ProductController();

  @override
  void onInit() {
    super.onInit();

    Product.dummyList.then((value) {
      products = value;
      data = MyData(products);
      update();
    });
  }

  void goToCreateProduct() {
    Get.toNamed(Routes.ADDPRODUCT);
  }
}
