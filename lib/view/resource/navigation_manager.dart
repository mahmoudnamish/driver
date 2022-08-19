import 'package:dlx_task/view/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../../controller/shared/shared_prefrance/local/shard_prefrance.dart';
import '../screens/Register_screen.dart';
import '../screens/enter_user_name_phone_location_screen.dart';
import '../screens/layout/home_screen.dart';

void submit(context) {
  CacheHelper.saveData(key: 'OnBoardingScreen', value: true).then((value) {

    if(value!)
    {
      Navigator.pushAndRemoveUntil((context),
          MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false);
    }

  });


}

void SingUp(context) => Navigator.pushAndRemoveUntil(
    (context),
    MaterialPageRoute(builder: (context) => const RegisterScreen()),
    (route) => false);

void home(context) => Navigator.pushAndRemoveUntil(
    (context),
    MaterialPageRoute(builder: (context) => const HomeScreen()),
    (route) => false);


// void  EnterNameAndPhoneNavigation(context)=>Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
