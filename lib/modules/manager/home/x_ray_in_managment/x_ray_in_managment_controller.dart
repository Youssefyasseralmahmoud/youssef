import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';

import 'x_ray_in_managment_services.dart';
class X_ray_in_managment_controller extends GetxController{
  bool droped = false;
  Xray_in_managment_services services = Xray_in_managment_services(Get.find(),Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  List data=[];
  List test_data=[];
  List test_data_doctor=[];
  List data_doctor=[];
  late int id_section;



  get_all_type_of_section() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_type_of_section(id_section);
    test_data.addAll(response['data']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data.isNotEmpty) {
      data.clear();
      data.addAll(response['data']) ;
      print("response from get all section controller");
      print(data);
    }
    else if(test_data.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد تحاليل لعرضهم",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد تحاليل لعرضهم",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  delete_xray_type(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.delete_xray_type(id);

    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest) {
      await Get.snackbar("تنبيه", "تمت عملية الحذف بنجاح");
    } else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "لم تتم عملية الحذف",
      );
    } else {
      Get.defaultDialog(title: " تم", content: Text("تمت عملية الحذف بنجاح"));
    }
    update();
  }
  // get_all_doctors() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await services.get_all_doctors(id_type);
  //   test_data_doctor.addAll(response['data'][0]['section']['user']) ;
  //   statusRequest = handlingdata(response);
  //
  //   if (StatusRequest.succes == statusRequest&& test_data_doctor.isNotEmpty) {
  //     data_doctor.clear();
  //     data_doctor.addAll(response['data'][0]['section']['user']) ;
  //     print("response from patient controller");
  //     print(data_doctor);
  //
  //   }
  //   else if(test_data_doctor.isEmpty) {
  //     await Get.snackbar(
  //       "تحذير",
  //       "لا يوجد أطباء لعرضههم",
  //     );
  //   }
  //   else if (StatusRequest.failure == statusRequest) {
  //     await Get.snackbar(
  //       "تحذير",
  //       "لا يوجد أطباء لعرضههم",
  //     );
  //   }
  //   else {
  //     Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
  //   }
  //   update();
  // }
  @override
  void onInit() {
    id_section=Get.arguments['id_section'];
    get_all_type_of_section();

    super.onInit();
  }
  ontapdropdown(bool droped) {
    this.droped = !droped;
    update();
  }
  bool droped_two = false;

  ontapdropdown_two(bool droped_two) {
    this.droped_two = !droped_two;
    update();
  }
}