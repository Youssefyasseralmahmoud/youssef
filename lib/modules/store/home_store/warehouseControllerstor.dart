import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/modules/store/home_store/products_store.dart';

import '../../Lab/Warehose/products.dart';



class warehouseControllerstor extends GetxController{
  int index = 0;
  var products = [

    Product_store(name: 'كحول',quantity: 000,production_date : '2/2/2023',expiry_date: '3/3/2023',min: 20),
    Product_store(name: 'علبة',quantity: 20,production_date : '2/2/2023',expiry_date: '3/3/2023',min: 50),
    Product_store(name: 'كحول',quantity: 000,production_date : '2/2/2023',expiry_date: '3/3/2023',min: 20),
    Product_store(name: 'علبة',quantity: 20,production_date : '2/2/2023',expiry_date: '3/3/2023',min: 50),
    Product_store(name: 'كحول',quantity: 000,production_date : '2/2/2023',expiry_date: '3/3/2023',min: 20),
    Product_store(name: 'علبة',quantity: 20,production_date : '2/2/2023',expiry_date: '3/3/2023',min: 50),

  ].obs;



  // void updateQuantity(int index, String value) {
  //   products[index].quantity = int.parse(value);
  // }
  void errors(int quantity,int index) {
    print("ddddddddddddddddddddddddddddddddddddddddddddddddddddddd");
    print(quantity);
    print(products[index].quantity);
    if (quantity > products[index].quantity) {
      Get.snackbar(
        'خطأ !!',
        'الكمية المدخلة أكبر من الكمية المتوافرة',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

  }

  var selectedValue = 'Option 1'.obs;
  var dropdownValues = ['Option 1', 'Option 2', 'Option 3'].obs;

}