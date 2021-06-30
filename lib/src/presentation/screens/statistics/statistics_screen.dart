import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intuition/src/logic/cubit/statistics_cubit.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({this.totalAttempts, this.incorrect, this.correct});

  static Widget screen(int totalAttempts, int incorrect, int correct) =>
      BlocProvider(
        create: (context) => StatisticsCubit(),
        child: StatisticsScreen(
          totalAttempts: totalAttempts,
          incorrect: incorrect,
          correct: correct,
        ),
      );

  final int totalAttempts;
  final int incorrect;
  final int correct;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Intuition')),
        body: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20.0,
            ),
            DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: TabBar(
                      labelColor: Colors.green,
                      unselectedLabelColor: Colors.black,
                      tabs: [Tab(text: 'Statistics'), Tab(text: 'Graphics')],
                    ),
                  ),
                  Container(
                      height: 400,
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.grey, width: 0.5))),
                      child: TabBarView(children: <Widget>[
                        Container(
                          child: Center(
                            child: Text(
                                'Total attempts: $totalAttempts. Correct answers: $correct.',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Text('Display Tab 2',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ])),
                ],
              ),
            )
          ],
        )));
  }
}
