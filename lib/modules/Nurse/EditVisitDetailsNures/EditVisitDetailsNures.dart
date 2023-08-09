import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/function/validinput.dart';
import 'package:project_after_update/modules/Ambulance/ambulance_patients/ambulance_patients_visits/ambulance_patient_visits_details/ambulance_patient_visits_details_controller.dart';
import 'package:project_after_update/modules/Nurse/EditVisitDetailsNures/EditVisitDetailsNuresController.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class EditVisitDetailsNures extends StatelessWidget {
  // const Ambulance_Patient_visits_details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditVisitDetailsNuresController controller =Get.put(EditVisitDetailsNuresController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black54,size: 28),
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Expanded(
              child: Text(
                'تعديل تيجة المعاينة',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 22, color: Colors.black54),
              ),
            ),
            SizedBox(
              width: 25,
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView(
          children: [

            SizedBox(
              width: 35,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: controller.formstate2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    TextFormField(
                      validator: (val) {
                        return validinput(val!, 4, 100, "Pressure");
                      },
                      onChanged: (val) {
                        controller.Pressure = val;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: const Text(
                            "الضغط",
                            style: TextStyle(
                                fontSize: 20,
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                          hintText: controller.hint_Pressure.toString(),
                          hintStyle: TextStyle(color:Colors.grey.withAlpha(70)),
                          suffixIcon: Container(
                            padding: EdgeInsets.all(5),
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              "assets/images/preasure.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (val) {
                        return validinput(val!, 2, 2, "BodyHeat");
                      },
                      onChanged: (val) {
                        controller.BodyHeat = val;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: const Text(
                            "الحرارة",
                            style: TextStyle(
                                fontSize: 20,
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                          hintText: controller.hint_BodyHeat.toString(),
                          hintStyle: TextStyle(color:Colors.grey.withAlpha(70)),
                          suffixIcon: Container(
                            padding: EdgeInsets.all(5),
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              "assets/images/heat.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (val) {
                        return validinput(val!, 4, 100, "ClinicalStory");
                      },
                      onChanged: (val) {
                        controller.ClinicalStory = val;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: const Text(
                            " القصة السريرية ",
                            style: TextStyle(
                                fontSize: 20,
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                          hintText: controller.hint_ClinicalStory.toString(),
                          hintStyle: TextStyle(color:Colors.grey.withAlpha(70)),
                          suffixIcon: Container(
                            padding: EdgeInsets.all(5),
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              "assets/images/hospital-bed.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (val) {
                        return validinput(val!, 4, 100, "ClinicalExamination");
                      },
                      onChanged: (val) {
                        controller.ClinicalExamination = val;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: const Text(
                            "الفحص الطبي",
                            style: TextStyle(
                                fontSize: 20,
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                          hintText: controller.hint_ClinicalExamination.toString(),
                          hintStyle: TextStyle(color:Colors.grey.withAlpha(70)),
                          suffixIcon: Container(
                            padding: EdgeInsets.all(5),
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              "assets/images/weakness.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (val) {
                        return validinput(val!, 2, 100, "Heartbeat");
                      },
                      onChanged: (val) {
                        controller.Heartbeat = val;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: const Text(
                            "ضربات القلب",
                            style: TextStyle(
                                fontSize: 20,
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                          hintText: controller.hint_Heartbeat.toString(),
                          hintStyle: TextStyle(color:Colors.grey.withAlpha(70)),
                          suffixIcon: Container(
                            padding: EdgeInsets.all(6),
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              "assets/images/heart-shape-outline-with-lifeline.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (val) {
                        return validinput(val!, 2, 100, "comments");
                      },
                      onChanged: (val) {
                        controller.comments = val;
                      },
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: const Text(
                            "الملاحظات",
                            style: TextStyle(
                                fontSize: 20,
                                color: StaticColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                          hintText: controller.hint_comments.toString(),
                          hintStyle: TextStyle(color:Colors.grey.withAlpha(70)),
                          suffixIcon: Container(
                            padding: EdgeInsets.all(6),
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              "assets/images/notes.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    // const Center(
                    //   child: Text(
                    //     "الإجراءات المقدمة للمريض",
                    //     style: TextStyle(fontSize: 15),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    //
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // TextFormField(
                    //   onChanged: (val) {},
                    //   decoration: InputDecoration(
                    //       floatingLabelBehavior: FloatingLabelBehavior.always,
                    //       label: const Text(
                    //         "الإجراءات الشعاعية",
                    //         style: TextStyle(
                    //             fontSize: 20,
                    //             color: StaticColor.primarycolor,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //       suffixIcon: Container(
                    //         padding: EdgeInsets.all(6),
                    //         height: 20,
                    //         width: 20,
                    //         child: Image.asset(
                    //           "assets/images/x-rays.png",
                    //           fit: BoxFit.cover,
                    //         ),
                    //       ),
                    //       contentPadding: const EdgeInsets.all(10),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(20),
                    //       )),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // TextFormField(
                    //   onChanged: (val) {},
                    //   decoration: InputDecoration(
                    //       floatingLabelBehavior: FloatingLabelBehavior.always,
                    //       label: const Text(
                    //         "التشخيص",
                    //         style: TextStyle(
                    //             fontSize: 20,
                    //             color: StaticColor.primarycolor,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //       suffixIcon: Container(
                    //         padding: EdgeInsets.all(6),
                    //         height: 20,
                    //         width: 20,
                    //         child: Image.asset(
                    //           "assets/images/medical-check.png",
                    //           fit: BoxFit.cover,
                    //         ),
                    //       ),
                    //       contentPadding: const EdgeInsets.all(10),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(20),
                    //       )),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
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
                            "تأكيد",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
