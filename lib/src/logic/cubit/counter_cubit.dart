import 'package:bloc/bloc.dart';
import 'dart:math';

import 'package:intuition/src/core/enums/cardType.dart';

/// {@template counter_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}
class CounterCubit extends Cubit<CardType> {
  Random rnd = new Random();

  /// {@macro counter_cubit}
  CounterCubit() : super(null);
  var correct = 0;

  var incorrect = 0;

  var totalAttempts = 0;

  //1-black 0-white
  void onTap(CardType type) {
    totalAttempts++;

    var ans = this.generateRandomNumber();

    if (type == CardType.values[ans]) {
      this.correct++;
    } else {
      incorrect++;
    }

    emit(type);

    Future.delayed(new Duration(seconds: 1), () {
      emit(null);
    });
  }

  int generateRandomNumber() {
    return rnd.nextInt(CardType.values.length);
  }
}
