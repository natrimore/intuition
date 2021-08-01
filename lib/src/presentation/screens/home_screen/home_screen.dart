import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intuition/src/core/enums/cardType.dart';
import 'package:intuition/src/presentation/screens/home_screen/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF6F6FA),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xffF6F6FA),
          title: Text(
            'Intuition',
            style: TextStyle(
                letterSpacing: 0.5,
                color: Color(0xff282F38),
                fontSize: 18,
                fontWeight: FontWeight.w700),
          ),
          actions: [
            PopupMenuButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                onSelected: (newValue) {
                  controller.popupSelect(newValue);
                },
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Text("Settings"),
                      value: 0,
                    ),
                    PopupMenuItem(
                      child: Text("About"),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text("Exit"),
                      value: 2,
                    ),
                  ];
                })
          ],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 24, 20, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.4, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        side: BorderSide(width: 1.2, color: Color(0xff5B7ED7)),
                      ),
                      child: Text(
                        "Statistics",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat',
                            color: Color(0xff5B7ED7)),
                      ),
                      onPressed: () {
                        controller.goToStatistics();
                      }),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.4, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        side: BorderSide(width: 1.2, color: Color(0xff5B7ED7)),
                      ),
                      child: Text(
                        "Clear",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            color: Color(0xff5B7ED7)),
                      ),
                      onPressed: () {
                        controller.clearAllAttempts();
                      }),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Obx(
                () => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: controller.color.value,
                        border: Border.all(
                          width: 0.5,
                          color: Colors.grey.withOpacity(0.6),
                        )),
                    // padding: EdgeInsets.all(4),
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Opacity(
                        opacity: controller.color.value != Colors.transparent
                            ? 0
                            : 1,
                        child: ClipRRect(
                          child: Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.45,
                            child: Text(
                              "?",
                              style: TextStyle(
                                  fontSize: 100,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black.withOpacity(0.4)),
                            ),
                            decoration: BoxDecoration(
                              gradient: RadialGradient(
                                center: Alignment(0, 0),
                                colors: [
                                  Color.fromRGBO(3, 235, 225, 100),
                                  Color.fromRGBO(152, 180, 242, 20)
                                ],
                                radius: 0.7,
                              ),
                            ),
                          ),
                        )
                        // Image.asset('assets/shirt_corner.png')

                        )),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 8),
                              blurRadius: 40,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        borderRadius: BorderRadius.circular(9)),
                    height: 100.0,
                    width: 100.0,
                    child: GestureDetector(
                        onTap: () => controller.onTap(CardType.White)),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 8),
                                blurRadius: 40,
                                color: Colors.black.withOpacity(0.1))
                          ],
                          borderRadius: BorderRadius.circular(9)),
                      height: 100.0,
                      width: 100.0,
                      child: GestureDetector(
                          onTap: () => controller.onTap(CardType.Black))),
                ],
              )
            ],
          ),
        ));
  }
}
