import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intuition/src/core/enums/cardType.dart';
import 'package:intuition/src/logic/cubit/counter_cubit.dart';
import 'package:intuition/src/presentation/screens/statistics/statistics_screen.dart';
import 'package:flutter/src/rendering/box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color whiteColor = Colors.white;
  Color blackColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Intuition'),
          actions: [
            PopupMenuButton(
                icon: Icon(Icons.settings),
                onSelected: (newValue) {
                  if (newValue == 0) {
                    int totalAttepts =
                        context.read<CounterCubit>().totalAttempts;
                    int incorrect = context.read<CounterCubit>().incorrect;
                    int correct = context.read<CounterCubit>().correct;
                    DateTime initialDate =
                        context.read<CounterCubit>().initialDate;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StatisticsScreen.screen(
                                totalAttepts,
                                incorrect,
                                correct,
                                initialDate)));
                  } else if (newValue == 2) {
                    context.read<CounterCubit>().clearAllAttempts();
                    showInSnackBar('The data is cleared');
                  }
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

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context)
        .showSnackBar(new SnackBar(content: new Text(value)));
  }
}
