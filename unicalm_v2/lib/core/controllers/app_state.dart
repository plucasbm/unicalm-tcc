
import 'package:flutter/material.dart';

class AppState {
  static final AppState _instance = AppState._internal();

  factory AppState(){
    return _instance;
  }

  AppState._internal();
  ValueNotifier<bool> assessmentListState = ValueNotifier(false);

  updateAssessmentsList(){
    assessmentListState.value = !assessmentListState.value;
  }
}