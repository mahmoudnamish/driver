
import 'package:dlx_task/controller/shared/bloc/home_screen/bloc.dart';
import 'package:dlx_task/view/constant/design.dart';
import 'package:dlx_task/view/resource/theme_manager.dart';
import 'package:dlx_task/view/screens/OnBoardingScreen.dart';

import 'package:dlx_task/view/screens/layout/home_screen.dart';
import 'package:dlx_task/view/screens/login_screen.dart';
import 'package:dlx_task/view/screens/splach_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controller/shared/bloc/login_screen_bloc/bloc.dart';
import 'controller/shared/bloc/singup_screen/bloc.dart';
import 'controller/shared/shared_prefrance/local/shard_prefrance.dart';
import 'controller/web_service/dio_api.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
 await CacheHelper.init() ;
  DioHelper.init();
  await Firebase.initializeApp();
  late Widget widget;
  bool? splachScreens = CacheHelper.getData(key: "SplachScreen");
  bool? onbording = CacheHelper.getData(key: "OnBoardingScreen");
 uId = CacheHelper.getData(key: "uId");
if(splachScreens!=null) {
  if(onbording != null){
    if (uId != null) {
      widget = const HomeScreen();
    } else {
      widget = const LoginScreen();
    }

  }else{
    widget = const OnBoardingScreen();
  }
}
else{
  widget = const SplachScreen();

}

  runApp( MyApp(startWidget: widget,));

}

class MyApp extends StatelessWidget {
  Widget? startWidget;

  MyApp({Key? key,this.startWidget}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
    providers:
      [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context)=>RegisterCubit(),),
        BlocProvider(create: (context) => CubitHome()),
      ],
      child: MaterialApp(
        theme: themelight,
        debugShowCheckedModeBanner: false,
        home: startWidget,
      ),
    );
  }
}

