// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'dart:math';

// import 'package:intuition/src/core/enums/cardType.dart';

// /// {@template counter_cubit}
// /// A [Cubit] which manages an [CardType] as its state.
// /// {@endtemplate}
// class CounterCubit extends Cubit<CardType> {
//   Random rnd = new Random();

//   Timer _timer;

//   bool currentState = false;

//   DateTime initialDate;

//   /// {@macro counter_cubit}
//   CounterCubit() : super(null);
//   var correct = 0;

//   var incorrect = 0;

//   var totalAttempts = 0;

//   //1-black 0-white
//   void onTap(CardType type) async {
//     if (totalAttempts == 0) {
//       initialDate = DateTime.now();
//     }
//     totalAttempts++;

//     var ans = this.generateRandomNumber();

//     if (type == CardType.values[ans]) {
//       this.correct++;
//     } else {
//       incorrect++;
//     }

//     if (_timer != null && _timer.isActive) {
//       _timer.cancel();
//       currentState = false;
//       emit(null);
//     }

//     //Future.delayed(Duration(milliseconds: 200), () {});

//     emit(CardType.values[ans]);
//     currentState = true;

//     _timer = Timer(Duration(milliseconds: 500), () {
//       if (currentState == true) {
//         currentState = false;
//         emit(null);
//       }
//     });
//   }

//   int generateRandomNumber() {
//     return rnd.nextInt(CardType.values.length);
//   }

//   void clearAllAttempts() {
//     totalAttempts = 0;
//     incorrect = 0;
//     correct = 0;
//   }
// }
