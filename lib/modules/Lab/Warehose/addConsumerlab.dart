import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_after_update/Modules/Lab/Warehose/warehouseControllerlab.dart';

import 'ProductsinDepartmentlab.dart';
class addConsumerlab extends StatelessWidget {
  warehouseControllerlab controller = Get.put<warehouseControllerlab>(warehouseControllerlab());

  @override
  Widget build(BuildContext context) {
   return Scaffold(

       floatingActionButton: FloatingActionButton.extended(
         onPressed: () {Get.toNamed('/warehouseProductslab');},
         elevation: 0,


         backgroundColor: Color(0xff9bb4fd),
         label: Row(
           mainAxisSize: MainAxisSize.min,
           children: const [
             Text('طلب مواد',
                 style: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                     color: Colors.white)
               // style: FlutterFlowTheme.of(context).bodyText1,
             ),
             Padding(
               padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
               child: Icon(
                 Icons.add,
                 color: Colors.white,
                 size: 24,
               ),
             ),
           ],
         ),
       ),

    body: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
         // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Padding(
              padding:EdgeInsets.all(50.0),
              child: Text(
                "               مستهلكات القسم",
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 30,
                  color: Color(0xff36414d),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0,left: 40, right: 40),
              child: Center(
                  child:Obx(() => DropdownButton(
                    value: controller.selectedValue.value,
                    items: controller.dropdownValues
                        .map((value) => DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    ))
                        .toList(),
                    onChanged: (newValue) {
                      controller.selectedValue.value = newValue!;
                    },
                      dropdownColor:    Color(0xff809fff),

                    isExpanded: true,


                  )),
              ),
            ),
            Container(
              width: Get.width * 0.60,
              height: Get.height * 0.06,

              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                border: Border.all(color:     Color(0xffb3c6ff),width: 3),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xffd2ddfd),
                      Color(0xffb0c4ff),

                      Color(0xff88a4f6)
                    ]),
                borderRadius: BorderRadius.circular(15),
              ),

              child: Center(child: Text('تسجيل المستهلك')),
              // ),
            ),
            Divider(
              height: 5,
              indent: 30,
              endIndent: 30,
              color: Colors.black45,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,right: 30,left: 170),
              child: Text(
                'المواد المتوافرة بالقسم',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 24,color: Colors.black54,
                ),

              ),
            ),
           ProductsinDepartmentlab()
          ],

    ));
  }
}