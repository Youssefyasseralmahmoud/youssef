import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/core/function/handlingdata.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/Clinics_details_in_managment/clinics_details_in_managment_services.dart';
import 'package:project_after_update/modules/manager/home/laboratory_in_managment/laboratory_center_services/laboratory_center_service_services.dart';
import 'package:project_after_update/secure_storage/secure_storage.dart';
class laboratory_center_service_controller extends GetxController {
  bool droped = false;

  ontapdropdown(bool droped) {
    this.droped = !droped;
    update();
  }
  bool droped_two = false;

  ontapdropdown_two(bool droped_two) {
    this.droped_two = !droped_two;
    update();
  }

  Laboratory_center_service_services services = Laboratory_center_service_services(Get.find(),Get.find());
  StatusRequest? statusRequest;
  Secury_storage secury_storage = new Secury_storage();
  List data=[];
  List test_data=[];
  List test_data_doctor=[];
  List data_doctor=[];
  late int id_type;



  get_all_services_intype() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_services_in_type(id_type);
    test_data.addAll(response['data'][0]['center_service']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data.isNotEmpty) {
      data.clear();
      data.addAll(response['data'][0]['center_service']) ;
      print("response from get all section controller");
      print(data);
    }
    else if(test_data.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد خدمات لعرضهم",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تحذير",
        "لا يوجد خدمات لعرضهم",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  delete_laboratory_services(int id) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.delete_laboratory_services(id);

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
  get_all_doctors() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await services.get_all_doctors(id_type);
    test_data_doctor.addAll(response['data'][0]['user']) ;
    statusRequest = handlingdata(response);

    if (StatusRequest.succes == statusRequest&& test_data_doctor.isNotEmpty) {
      data_doctor.clear();
      data_doctor.addAll(response['data'][0]['user']) ;
      print("response from patient controller");
      print(data_doctor);

    }
    else if(test_data_doctor.isEmpty) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد أطباء لعرضهم",
      );
    }
    else if (StatusRequest.failure == statusRequest) {
      await Get.snackbar(
        "تنبيه",
        "لا يوجد أطباء لعرضهم",
      );
    }
    else {
      Get.defaultDialog(title: " خطأ", content: Text("حدث خطا ما"));
    }
    update();
  }
  @override
  void onInit() {
    id_type=Get.arguments['id_type'];
    get_all_services_intype();
    get_all_doctors();

    super.onInit();
  }
}