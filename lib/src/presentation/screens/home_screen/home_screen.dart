import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intuition/src/core/enums/cardType.dart';
import 'package:intuition/src/logic/cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color whiteColor = Colors.white;
  Color blackColor = Colors.black;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Intuition'),
          actions: [
            PopupMenuButton(itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("Statistics"),
                ),
                PopupMenuItem(child: Text("Settings")),
                PopupMenuItem(child: Text("Clear")),
                PopupMenuItem(child: Text("About")),
                PopupMenuItem(child: Text("Exit")),
              ];
            })
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/background.jpg',
                    ))),
            child: Container(
              margin: EdgeInsets.fromLTRB(80, 60, 80, 150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: BlocBuilder<CounterCubit, CardType>(
                      builder: (context, state) {
                        if (state == CardType.White) {
                          return FittedBox(
                              fit: BoxFit.contain,
                              child: Image.asset('assets/card_white.PNG'));
                        }

                        if (state == CardType.Black) {
                          return FittedBox(
                              fit: BoxFit.contain,
                              child: Image.asset('assets/card_black.PNG'));
                        }

                        if (state == null) {
                          return FittedBox(
                              fit: BoxFit.contain,
                              child: Image.asset('assets/shirt_corner.png'));
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        color: whiteColor,
                        height: 80.0,
                        width: 80.0,
                        child: GestureDetector(
                          onTap: () => context
                              .read<CounterCubit>()
                              .onTap(CardType.White),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Container(
                        color: blackColor,
                        height: 80.0,
                        width: 80.0,
                        child: GestureDetector(
                            onTap: () => context
                                .read<CounterCubit>()
                                .onTap(CardType.Black)),
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}
