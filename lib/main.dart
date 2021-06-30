import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intuition/src/intuition_observer.dart';
import 'src/app.dart';

void main() {
  Bloc.observer = IntuitionObserver();
  runApp(App());
}
