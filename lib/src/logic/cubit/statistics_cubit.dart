import 'package:bloc/bloc.dart';
import 'dart:math';

/// {@template statistics_cubit}
/// A [Cubit] which manages an [CardType] as its state.
/// {@endtemplate}
class StatisticsCubit extends Cubit<int> {
  /// {@macro statistics_cubit}
  StatisticsCubit() : super(0);
}
