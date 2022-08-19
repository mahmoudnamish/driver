
import 'package:bloc/bloc.dart';
import 'package:dlx_task/controller/shared/bloc/login_screen_bloc/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginCubit extends Cubit<LoginStates> {

  LoginCubit() : super(InitialeStates());
  static LoginCubit get(context) => BlocProvider.of(context);

  var emailcontroler = TextEditingController();
  var passworedcontroler = TextEditingController();
  var valdiatorKey = GlobalKey<FormState>();

  void userlogin() async{
    emit(LoadingStates());
   await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroler.text,
      password: passworedcontroler.text
    ).then((value) {

      emit(SuccesStates(value.user!.uid));
    }).catchError((error){emit(ErrorStates(error.toString()));});


    }


  IconData icon = Icons.visibility_off;
  bool textScure = true;
  void TextSecure() {
    textScure = !textScure;
    icon = textScure ?  Icons.visibility_off : Icons.visibility;
    emit(EyeStates());
  }
}