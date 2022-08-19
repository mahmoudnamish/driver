

import 'package:dlx_task/controller/shared/bloc/home_screen/state.dart';
import 'package:dlx_task/view/screens/persone_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../view/screens/delat.dart';
import '../../../../view/screens/history_screen.dart';

class CubitHome extends Cubit<StatesHome> {
  CubitHome() : super(InitialState());

  static  CubitHome get(context) => BlocProvider.of(context);

  int current = 0;

  List<Widget> bottomScreen = [
    const PersoneScreen(),

    const DelaitesScreen(),

    const HistoryScreen()
  ];

  List<String>title=[
    'Orders',
    'Orders Details',
    'Orders History',
  ];

  void changeBottom(int index) {
    current = index;
    emit(ChangebottomNavigateState());
  }






}

