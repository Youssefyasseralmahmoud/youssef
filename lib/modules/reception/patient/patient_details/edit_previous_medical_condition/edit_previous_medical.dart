import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/reception/add_record/add_record_controller.dart';
import 'package:project_after_update/modules/reception/add_record/previous_medical_condition/add_pervious_medical_controller.dart';
import 'package:project_after_update/modules/reception/patient/patient_details/edit_previous_medical_condition/edit_previous_medical_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Edit_Previous_medical_cond extends StatelessWidget {
  const Edit_Previous_medical_cond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Edit_previous_medical_controller controller =Get.put(Edit_previous_medical_controller());
    return Scaffold(
      body: Container(
        child: Form(
          key: controller.formstate4,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                              prefixIcon: const Icon(Icons.search),
                              hintText: "البحث",
                              hintStyle: const TextStyle(fontSize: 20),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)),
                              filled: true,
                              fillColor: Colors.grey[200]),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: StaticColor.primarycolor,
                      ),
                      width: 60,
                      height: 55,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_active_outlined,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "قسم الإستقبال",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "تعديل الحالات المرضية السابقة",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    const Divider(
                      height: 10,
                      color: Colors.black45,
                    ),
                    const Center(
                      child: Text(
                        "الحالات المرضية",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    TextFormField(
                      validator: (val){
                        return  validinput(val!, 3, 20,"ill");
                      },
                      keyboardType: TextInputType.name,
                      onChanged: (val) {
                        controller.DiseaseName=val;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label:  const Text(
                            " اسم المرض",
                            style: TextStyle(
                                fontSize: 20,
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                          suffixIcon: const Icon(Icons.person_2_outlined),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    const SizedBox(height: 30,),
                    TextFormField(
                      validator: (val){
                        return validinput(val!, 1,100,"idpersonal");
                      },
                      keyboardType: TextInputType.text,
                      onChanged: (val) {
                        controller.Details=val;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label:  const Text(
                            "التفاصيل",
                            style: TextStyle(
                                fontSize: 20,
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                          suffixIcon: const Icon(Icons.credit_card_outlined),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: GestureDetector(
                        onTap: (){
                          controller.checkinput();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: StaticColor.primarycolor,
                          ),
                          child: const Text(
                            "تعديل",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}