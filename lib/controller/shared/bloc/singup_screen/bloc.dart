

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dlx_task/controller/shared/bloc/singup_screen/state.dart';
import 'package:dlx_task/model/users_modele.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../view/constant/design.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(InitialeState());

  static  RegisterCubit get(context) => BlocProvider.of(context);
  var namecontroler = TextEditingController();
  var emailcontroler = TextEditingController();
  var passworedcontroler = TextEditingController();
   var phonecontroler = TextEditingController();
  // var namebasecontroler = TextEditingController();
  var valdiatorKey = GlobalKey<FormState>();
  var valdKey = GlobalKey<FormState>();


  void postregister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async{
    emit(Registerloding());
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
         email:email,
        password:password,

    ).then((value) {
      uId = value.user!.uid;
      userCreate(uId: uId!,name: name,phone: phone,email: email);
    }).catchError((error){emit(Registereerror(error.toString()));});

  }



  Future<void> userCreate( {
  required String  phone,
    required String uId,
    required String name,
    required String email

})
   async {
    UserModele modele = UserModele(
      phone: phone,
      name: name,
      uId: uId,
     email: email
    );

  await FirebaseFirestore.instance.collection('users')
      .doc(uId)
      .set(modele.toMap())
      .then((value)
   {

      emit(CreatsuccesState());

    }).catchError((error){emit(CreateerrorState(error.toString()));});

  }
  IconData icon = Icons.visibility_off;
  bool textScure = true;
  void textSecure() {
    textScure = !textScure;
    icon = textScure ?  Icons.visibility_off : Icons.visibility;
    emit(EyeStatesregister());
  }
}

