import 'package:dss_code/controller/apps/ecommerce/product/product_controller.dart';
import 'package:get/get.dart';
class Productbinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(()=>ProductController());
  }

}