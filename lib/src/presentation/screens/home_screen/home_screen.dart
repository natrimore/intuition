import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intuition/src/core/enums/cardType.dart';
import 'package:intuition/src/presentation/screens/home_screen/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Intuition'),
          actions: [
            PopupMenuButton(
                icon: Icon(Icons.settings),
                onSelected: (newValue) {
                  controller.popupSelect(newValue);
                },
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: Text("Statistics"),
                      value: 0,
                    ),
                    PopupMenuItem(
                      child: Text("Settings"),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text("Clear"),
                      value: 2,
                    ),
                    PopupMenuItem(
                      child: Text("About"),
                      value: 3,
                    ),
                    PopupMenuItem(
                      child: Text("Exit"),
                      value: 4,
                    ),
                  ];
                })
          ],
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(80, 60, 80, 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(
                () => Container(
                    // color: Colors.black,
                    color: controller.color.value,
                    child: Opacity(
                        opacity: controller.color.value != Colors.transparent
                            ? 0
                            : 1,
                        child: Image.asset('assets/shirt_corner.png'))),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    color: Colors.white,
                    height: 80.0,
                    width: 80.0,
                    child: GestureDetector(
                        onTap: () => controller.onTap(CardType.White)),
                  ),
                  Spacer(),
                  Container(
                      color: Colors.black,
                      height: 80.0,
                      width: 80.0,
                      child: GestureDetector(
                          onTap: () => controller.onTap(CardType.Black)))
                ],
              )
            ],
          ),
        ));
  }
}
