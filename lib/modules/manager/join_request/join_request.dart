import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/manager/join_request/join_request_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';

class Join_request extends StatelessWidget {
  const Join_request({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Join_request_controller controller =Get.put(Join_request_controller());
    return RefreshIndicator(
      onRefresh:()async{
      await controller.get_all_join_request();
      } ,
      child: SafeArea(
        child: GetBuilder<Join_request_controller>(builder: (controller){
          return
          controller.statusRequest==StatusRequest.loading?
              Center(child: CircularProgressIndicator(color: StaticColor.primarycolor,),):
            Container(
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
                          onPressed: () {
                            Get.toNamed("/notification");
                          },
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
                        "قسم الإدارة",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Container(
                        //  padding: EdgeInsets.all(2),
                        color: StaticColor.primarycolor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 70,
                              width: 100,
                              child: Image.asset(
                                "assets/images/logo.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(right: 5),
                              child: const Text(
                                "طلبات الإنضمام",
                                style: TextStyle(fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 10,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
               GetBuilder<Join_request_controller>(builder: (controller){
                 return
                     controller.data.isEmpty?Container(child: Center(child: Text("لا يوجد طلبات انضمام لعرضها",style: TextStyle(color: StaticColor.primarycolor),),),):
                     Card(
                       child: Container(
                         padding: const EdgeInsets.all(8),
                         height: MediaQuery.of(context).size.height * 0.6,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20),
                         ),
                         child: ListView.builder(
                             itemCount: controller.data.length,
                             itemBuilder: (context, index) {
                               return Container(
                                 padding: const EdgeInsets.all(8),
                                 height: MediaQuery.of(context).size.height * 0.1,
                                 margin: const EdgeInsets.only(bottom: 10),
                                 decoration: BoxDecoration(
                                   color: StaticColor.thirdgrey.withAlpha(30),
                                   borderRadius: BorderRadius.circular(20),
                                 ),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   children: [
                                     Expanded(
                                       child: Container(
                                         child: Row(
                                           children: [
                                             GestureDetector(
                                               onTap: (){
                                                 Get.defaultDialog(
                                                   title: "يرجى تأكيد نوع المستخدم",
                                                   content: Column(
                                                     children: [

                                                       Container(
                                                           margin: EdgeInsets.only(bottom: 10),
                                                           padding: const EdgeInsets.all(10),
                                                           width: MediaQuery.of(context).size.width,
                                                           height: MediaQuery.of(context).size.height * 0.07,
                                                           decoration: BoxDecoration(
                                                             color: StaticColor.thirdgrey.withAlpha(20),
                                                             borderRadius: BorderRadius.circular(20),
                                                             border: Border(
                                                               top: BorderSide(
                                                                   width: 1, color: Colors.black.withAlpha(80)),
                                                               right: BorderSide(
                                                                   width: 1, color: Colors.black.withAlpha(80)),
                                                               left: BorderSide(
                                                                   width: 1, color: Colors.black.withAlpha(80)),
                                                               bottom: BorderSide(
                                                                   width: 1, color: Colors.black.withAlpha(80)),
                                                             ),
                                                           ),
                                                           child: Row(
                                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                             children: [
                                                               DropdownButton(
                                                                 items: controller.department
                                                                     .map((e) => DropdownMenuItem(
                                                                   child: Text("$e"),
                                                                   value: e,
                                                                 ))
                                                                     .toList(),
                                                                 onChanged: (val) {
                                                                   controller.changedepartment(val!);
                                                                   controller.type=val;
                                                                   // controller.selected = val.toString();
                                                                   print(controller.selected);
                                                                 },
                                                                 value: controller.selected,
                                                                 style: const TextStyle(
                                                                     fontSize: 15,
                                                                     color: StaticColor.blackcolor,
                                                                     fontWeight: FontWeight.bold),
                                                               ),
                                                               const Icon(Icons.work_outline_outlined,
                                                                   color: StaticColor.primarycolor),
                                                             ],
                                                           )),

                                                       SizedBox(height: 10,),
                                                       GestureDetector(
                                                         onTap: (){
                                                           Get.defaultDialog(
                                                             title: "هل تريد قبول طلب الإنضمام ",
                                                             content:  Row(
                                                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                               children: [
                                                                 GestureDetector(
                                                                   onTap: (){
                                                                     controller.accept_join(controller.data[index]['id']);
                                                                   },
                                                                   child: Container(
                                                                     padding: EdgeInsets.all(5),
                                                                     alignment: Alignment.center,
                                                                     height: 50,
                                                                     width: MediaQuery.of(context).size.width*0.3,
                                                                     decoration: BoxDecoration(
                                                                       borderRadius: BorderRadius.circular(10),
                                                                       color: StaticColor.primarycolor,
                                                                     ),
                                                                     child: Center(child: Text("نعم ",style: TextStyle(color: Colors.white,fontSize: 20),)),
                                                                   ),
                                                                 ),
                                                                 GestureDetector(
                                                                   onTap: (){
                                                                     Get.back();
                                                                   },
                                                                   child: Container(
                                                                     padding: EdgeInsets.all(5),
                                                                     alignment: Alignment.center,
                                                                     height: 50,
                                                                     width: MediaQuery.of(context).size.width*0.3,
                                                                     decoration: BoxDecoration(
                                                                       borderRadius: BorderRadius.circular(10),
                                                                       color: StaticColor.primarycolor,
                                                                     ),
                                                                     child: Center(child: Text("لا ",style: TextStyle(color: Colors.white,fontSize: 20),)),
                                                                   ),
                                                                 ),
                                                               ],
                                                             ),
                                                           );
                                                         },
                                                         child: Container(
                                                           padding: EdgeInsets.all(5),
                                                           alignment: Alignment.center,
                                                           height: 50,
                                                           width: MediaQuery.of(context).size.width*0.3,
                                                           decoration: BoxDecoration(
                                                             borderRadius: BorderRadius.circular(10),
                                                             color: StaticColor.primarycolor,
                                                           ),
                                                           child: Center(child: Text("تأكيد ",style: TextStyle(color: Colors.white,fontSize: 20),)),
                                                         ),

                                                       ),
                                                     ],
                                                   ),
                                                 );

                                               },
                                               child: Container(
                                                 height: 60,
                                                 width: 50,
                                                 child: Column(
                                                   children: [
                                                     Expanded(
                                                         flex: 2,
                                                         child: Image.asset(
                                                           "assets/images/approved.png",
                                                           fit: BoxFit.fill,
                                                         )),
                                                     const Expanded(child: Text("قبول")),
                                                   ],
                                                 ),
                                               ),
                                             ),
                                             GestureDetector(
                                               onTap: (){
                                                 Get.defaultDialog(
                                                   title: "هل تريد رفض طلب الإنضمام ",
                                                   content:  Row(
                                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                     children: [
                                                       GestureDetector(
                                                         onTap: (){
                                                           controller.reject_join(controller.data[index]['id']);


                                                         },
                                                         child: Container(
                                                           padding: EdgeInsets.all(5),
                                                           alignment: Alignment.center,
                                                           height: 50,
                                                           width: MediaQuery.of(context).size.width*0.3,
                                                           decoration: BoxDecoration(
                                                             borderRadius: BorderRadius.circular(10),
                                                             color: StaticColor.primarycolor,
                                                           ),
                                                           child: Center(child: Text("نعم ",style: TextStyle(color: Colors.white,fontSize: 20),)),
                                                         ),
                                                       ),
                                                       GestureDetector(
                                                         onTap: (){
                                                           Get.back();
                                                         },
                                                         child: Container(
                                                           padding: EdgeInsets.all(5),
                                                           alignment: Alignment.center,
                                                           height: 50,
                                                           width: MediaQuery.of(context).size.width*0.3,
                                                           decoration: BoxDecoration(
                                                             borderRadius: BorderRadius.circular(10),
                                                             color: StaticColor.primarycolor,
                                                           ),
                                                           child: Center(child: Text("لا ",style: TextStyle(color: Colors.white,fontSize: 20),)),
                                                         ),
                                                       ),
                                                     ],
                                                   ),
                                                 );
                                               },
                                               child: Container(
                                                 height: 60,
                                                 width: 50,
                                                 child: Column(
                                                   children: [
                                                     Expanded(
                                                         flex: 2,
                                                         child: Image.asset(
                                                           "assets/images/cancel.png",
                                                           fit: BoxFit.fill,
                                                         )),
                                                     const Expanded(child: Text("رفض")),
                                                   ],
                                                 ),
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                     ),
                                     Expanded(
                                       child: Container(
                                         child: ListTile(
                                           trailing: GestureDetector(
                                             onTap: () {
                                               Get.bottomSheet(Container(
                                                 decoration: const BoxDecoration(
                                                     borderRadius: BorderRadius.only(
                                                         topLeft: Radius.circular(20),
                                                         topRight: Radius.circular(20)),
                                                     color: Colors.white),
                                                 child: Column(
                                                   children: [
                                                     Container(
                                                       margin: const EdgeInsets.only(
                                                           bottom: 8),
                                                       padding: EdgeInsets.all(8),
                                                       width: MediaQuery.of(context)
                                                           .size
                                                           .width,
                                                       height: 60,
                                                       color: StaticColor.thirdgrey
                                                           .withAlpha(30),
                                                       child: Row(
                                                         mainAxisAlignment:
                                                         MainAxisAlignment.end,
                                                         children: [
                                                           Text(" ${controller.data[index]['type']} :"),
                                                           const Text(" الإختصاص",
                                                               style: TextStyle(
                                                                   fontWeight:
                                                                   FontWeight.bold)),
                                                           Container(
                                                             height: 50,
                                                             width: 50,
                                                             child: Image.asset(
                                                                 "assets/images/medical-team.png"),
                                                           )
                                                         ],
                                                       ),
                                                     ),
                                                   ],
                                                 ),
                                               ));
                                             },
                                             child: CircleAvatar(
                                               radius: 20,
                                               child:
                                               Image.asset("assets/images/doctor.png"),
                                             ),
                                           ),
                                           leading:  Text("${controller.data[index]['name']}"),
                                         ),
                                       ),
                                     )
                                   ],
                                 ),
                               );
                             }),
                       ),
                     );
               })
              ],
            ),
          );
        })
      ),
    );
  }
}
