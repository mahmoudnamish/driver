
import 'package:flutter/material.dart';
import '../../controller/shared/shared_prefrance/local/shard_prefrance.dart';
import '../resource/assets_manager.dart';
import 'OnBoardingScreen.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);



  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2),(){
      CacheHelper.saveData(key: 'SplachScreen', value: true).then((value) {
        if(value!) {
          Navigator.pushAndRemoveUntil(
              (context),
              MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
                  (route) => false);
        }
      } );


    },
    );

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Image.asset(ImageAssets.splashScreen),

    ),);
  }
}
