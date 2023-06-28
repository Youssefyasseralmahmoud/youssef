// import 'package:flutter/material.dart';
// import 'package:project_after_update/static_colors/StaticColors.dart';
// import 'package:get/get.dart';
//
// class Home_reception extends StatelessWidget {
//   const Home_reception({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ListView(
//         children: [
//           Container(
//             margin: const EdgeInsets.only(top: 10),
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Row(
//               children: [
//                 Expanded(
//                     child: TextFormField(
//                   decoration: InputDecoration(
//                       contentPadding: const EdgeInsets.symmetric(vertical: 10),
//                       prefixIcon: const Icon(Icons.search),
//                       hintText: "البحث",
//                       hintStyle: const TextStyle(fontSize: 20),
//                       border: OutlineInputBorder(
//                           borderSide: BorderSide.none,
//                           borderRadius: BorderRadius.circular(10)),
//                       filled: true,
//                       fillColor: Colors.grey[200]),
//                 )),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: StaticColor.primarycolor,
//                   ),
//                   width: 60,
//                   height: 55,
//                   padding: const EdgeInsets.symmetric(vertical: 8),
//                   child: IconButton(
//                     onPressed: () {
//                       Get.toNamed("/notification");
//                     },
//                     icon: const Icon(
//                       Icons.notifications_active_outlined,
//                       size: 25,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 5),
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: StaticColor.primarycolor,
//                   ),
//                   width: 60,
//                   height: 55,
//                   padding: const EdgeInsets.symmetric(vertical: 8),
//                   child: IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.settings,
//                       size: 25,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//           Container(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 const Text(
//                   "قسم الإستقبال",
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                 ),
//                 const Text(
//                   "مركز ألفا الطبي",
//                   style: TextStyle(fontSize: 15, color: Colors.grey),
//                 ),
//                 const Divider(
//                   height: 10,
//                   color: Colors.black45,
//                 ),
//                 GridView(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 10),
//                   shrinkWrap: true,
//                   padding: const EdgeInsets.all(10),
//                   children: [
//                     GestureDetector(
//                       onTap: () {
//                         Get.toNamed("/clinics");
//                       },
//                       child: Container(
//                           // height: MediaQuery.of(context).size.height * 0.3,
//                           // width: MediaQuery.of(context).size.width * 0.5,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: StaticColor.primarycolor,
//                           ),
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 flex: 5,
//                                 child: Image.asset(
//                                     "assets/images/Body anatomy-rafiki.png",
//                                     fit: BoxFit.fill),
//                               ),
//                               const Expanded(
//                                   child: Text(
//                                 "العيادات",
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 15),
//                               ))
//                             ],
//                           )),
//                     ),
//                     Container(
//                         // height: MediaQuery.of(context).size.height * 0.3,
//                         // width: MediaQuery.of(context).size.width * 0.5,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: StaticColor.primarycolor,
//                         ),
//                         child: Column(
//                           children: [
//                             Expanded(
//                               flex: 5,
//                               child: Image.asset(
//                                   "assets/images/Rheumatology-pana.png",
//                                   fit: BoxFit.fill),
//                             ),
//                             const Expanded(
//                                 child: Text(
//                               "الأشعة",
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 15),
//                             ))
//                           ],
//                         )),
//                     GestureDetector(
//                       onTap: (){
//                         Get.toNamed("/wating_in_laboratory");
//                       },
//                       child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: StaticColor.primarycolor,
//                           ),
//                           child: Column(
//                             children: [
//                               Expanded(
//                                 flex: 6,
//                                 child: Image.asset(
//                                     "assets/images/Laboratory-bro.png",
//                                     fit: BoxFit.fill),
//                               ),
//                               const Expanded(
//                                   child: Text(
//                                 "المخبر",
//                                 style:
//                                     TextStyle(color: Colors.white, fontSize: 15),
//                               ))
//                             ],
//                           )),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/core/class/StatusRequest.dart';
import 'package:project_after_update/modules/manager/home/home_manager_controller.dart';
import 'package:project_after_update/modules/reception/home/home_reception_controller.dart';
import 'package:project_after_update/static_colors/StaticColors.dart';
class Home_reception extends StatelessWidget {
  const Home_reception({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Home_reception_controller controller =Get.put(Home_reception_controller());

    return RefreshIndicator(
      onRefresh: ()async{
        await controller.get_all_section();
      },
      child: SafeArea(
          child: GetBuilder<Home_reception_controller>(builder: (controller){
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
                        children:  [
                          Text(
                            "قسم الإستقبال",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.black),
                          ),
                          Container(
                            color: StaticColor.primarycolor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height:70,
                                  width: 100,
                                  child: Image.asset(
                                    "assets/images/logo.jpg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 5),
                                  child: const Text(
                                    " مركز ألفا الطبي",
                                    style: TextStyle(fontSize: 15, color: Colors.white),
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Divider(
                            height: 10,
                            color: Colors.black45,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height*0.6,
                            child: GridView.builder(
                              itemCount: controller.data.length,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(10),
                              itemBuilder: (context,index){
                                return
                                  GestureDetector(
                                    onTap: () {
                                      if(controller.data[index]['Name']=='clinic'){
                                        Get.toNamed("/clinics",arguments: {
                                          "id_section":controller.data[index]['id']
                                        }
                                        );
                                      }else if(controller.data[index]['Name']=='xray'){
                                        Get.toNamed("/Wating_in_xray",arguments: {
                                          "id_section":controller.data[index]['id']
                                        });
                                      }else if(controller.data[index]['Name']=='Laboratory'){
                                        Get.toNamed("/wating_in_laboratory",arguments: {
                                          "id_section":controller.data[index]['id']
                                        });
                                      }else if(controller.data[index]['Name']=='Store'){
                                     //   Get.toNamed("/Storage_in_managment");
                                      }

                                    },
                                    child: Container(
                                      // height: MediaQuery.of(context).size.height * 0.3,
                                      // width: MediaQuery.of(context).size.width * 0.5,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: StaticColor.primarycolor,
                                        ),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child:
                                              controller.data[index]['Name']=='clinic'?
                                              Image.asset(
                                                  "assets/images/Body anatomy-rafiki.png",
                                                  fit: BoxFit.fill):
                                              controller.data[index]['Name']=='xray'?
                                              Image.asset(
                                                  "assets/images/Rheumatology-pana.png",
                                                  fit: BoxFit.fill):
                                              controller.data[index]['Name']=='Laboratory'?
                                              Image.asset(
                                                  "assets/images/Laboratory-bro.png",
                                                  fit: BoxFit.fill):
                                              controller.data[index]['Name']=='Store'?
                                              Image.asset(
                                                  "assets/images/storage.png",
                                                  fit: BoxFit.fill):
                                              controller.data[index]['Name']=='Reception'?
                                              Image.asset(
                                                  "assets/images/reception.png",
                                                  fit: BoxFit.fill):
                                              controller.data[index]['Name']=='Finance'?
                                              Image.asset(
                                                  "assets/images/finance.png",
                                                  fit: BoxFit.fill) :
                                              Image.asset(
                                                  "assets/images/logo.png",
                                                  fit: BoxFit.fill) ,
                                            ),
                                            Expanded(
                                                child:
                                                controller.data[index]['Name']=='clinic'?
                                                Text(
                                                  "العيادات",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 15),
                                                ):
                                                controller.data[index]['Name']=='xray'?
                                                Text(
                                                  "الأشعة",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 15),
                                                ):
                                                controller.data[index]['Name']=='Laboratory'?
                                                Text(
                                                  "المخبر",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 15),
                                                ) :
                                                controller.data[index]['Name']=='Store'?
                                                Text(
                                                  "المخزن",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 15),
                                                ) :
                                                controller.data[index]['Name']=='Reception'?
                                                Text(
                                                  "الإستقبال",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 15),
                                                ) :
                                                controller.data[index]['Name']=='Finance'?
                                                Text(
                                                  "المالية",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 15),
                                                ) :
                                                Text(
                                                  "${controller.data[index]['Name']}",
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 15),
                                                )
                                            )
                                          ],
                                        )),
                                  );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
          })
      ),
    );
  }
}
