import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/manager/home/clinics_in_managment/clinics_in_managment_controller.dart';
import 'package:project_after_update/modules/manager/home/laboratory_in_managment/laboratory_center_services/laboratory_center_services_controller.dart';
import 'package:project_after_update/modules/manager/home/x_ray_in_managment/xray_center_services/xray_center_service_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Xray_center_services extends StatelessWidget {
  const Xray_center_services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Xray_center_service_controller controller=Get.put(Xray_center_service_controller());
    return Scaffold(
      drawer: Drawer(
        child:    Container(
          child: ListView(children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "أطباء الأشعة",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "مركز ألفا الطبي",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.black45,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.data_doctor.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                         Get.toNamed("/Doctors_details_in_xray",arguments: {
                           "id":controller.data_doctor[index]['user']['id']
                         });
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        margin: const EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          color: StaticColor.thirdgrey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${controller.data_doctor[index]['user']['name']} ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            // Text("اسم العيادة : الأطفال",style: TextStyle(color: Colors.grey),),
                            // Text(" حالة الطبيب : متواجد",style: TextStyle(color: Colors.grey),),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ]),
        ),
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: StaticColor.primarycolor,
          child: Icon(Icons.add_circle),
          onPressed: (){
            Get.toNamed("/Add_xray_service",arguments: {
              "id_type":controller.id_type
            });
          },
        ),
        body:
        GetBuilder<Xray_center_service_controller>(builder: (controller){
          return
            controller.statusRequest==StatusRequest.loading ?
            Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),) :
            Container(
              child: ListView(children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 10),
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
                      )
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
                        " الخدمات المتوافرة",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "مركز ألفا الطبي / قسم الإدارة",
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                      const Divider(
                        height: 10,
                        color: Colors.black45,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: GridView.builder(
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 20),
                          shrinkWrap: true,
                          itemCount: controller.data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.bottomSheet(
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text("${controller.data[index]['Details']}"),
                                              Text(" : التفاصيل  ",style: TextStyle(fontWeight: FontWeight.bold),),
                                              SizedBox(width: 5,),

                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                );
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    color: StaticColor.primarycolor,
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 8,
                                        child: Container(
                                          width: 200,
                                          child: Image.asset(
                                              "assets/images/clinic.png",
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          " ${controller.data[index]['Name']}",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 15),
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          "${controller.data[index]['Price']}",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 15),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Get.defaultDialog(
                                                  title:
                                                  "هل تريد تعديل نوع هذه الخدمة ؟",
                                                  content: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: (){
                                                          Get.toNamed("/Edit_xray_service",arguments: {
                                                            "id_type":controller.data[index]['id_TypeCenterServices'],
                                                            "id":controller.data[index]['id']
                                                          });
                                                        },
                                                        child: Container(
                                                          padding:
                                                          const EdgeInsets.all(5),
                                                          alignment: Alignment.center,
                                                          height: 50,
                                                          width: MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                              0.2,
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                            color: StaticColor
                                                                .primarycolor,
                                                          ),
                                                          child: const Text(
                                                            "نعم",
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 20),
                                                          ),
                                                        ),

                                                      ),
                                                      GestureDetector(
                                                        onTap: (){
                                                          Get.back();
                                                        },
                                                        child: Container(
                                                          padding:
                                                          const EdgeInsets.all(5),
                                                          alignment: Alignment.center,
                                                          height: 50,
                                                          width: MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                              0.2,
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                            color: StaticColor
                                                                .primarycolor,
                                                          ),
                                                          child: const Text(
                                                            "لا",
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 20),
                                                          ),
                                                        ),

                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                child: Image.asset(
                                                    "assets/images/pen.png"),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Get.defaultDialog(
                                                  title:
                                                  "هل تريد حذف هذه الخدمة   ؟",
                                                  content: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: (){
                                                          controller.delete_xray_services(controller.data[0]['center_service'][index]['id']);
                                                        },
                                                        child: Container(
                                                          padding:
                                                          const EdgeInsets.all(5),
                                                          alignment: Alignment.center,
                                                          height: 50,
                                                          width: MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                              0.2,
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                            color: StaticColor
                                                                .primarycolor,
                                                          ),
                                                          child: const Text(
                                                            "نعم",
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 20),
                                                          ),
                                                        ),

                                                      ),
                                                      GestureDetector(
                                                        onTap: (){
                                                          Get.back();
                                                        },
                                                        child: Container(
                                                          padding:
                                                          const EdgeInsets.all(5),
                                                          alignment: Alignment.center,
                                                          height: 50,
                                                          width: MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                              0.2,
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                10),
                                                            color: StaticColor
                                                                .primarycolor,
                                                          ),
                                                          child: const Text(
                                                            "لا",
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 20),
                                                          ),
                                                        ),

                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                child: Image.asset(
                                                    "assets/images/delete.png"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  )),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            );
        })
    );
  }
}
