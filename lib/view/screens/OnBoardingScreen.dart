
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../constant/design.dart';
import '../resource/assets_manager.dart';
import '../resource/navigation_manager.dart';
import '../resource/text_manager.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool islast = false;
  var pageviewc = PageController();

  List<BoardingModele> modele = [
    BoardingModele(

        image: ImageAssets.onBoardingLogo1,
        title: TextManager.onBoardingTitleTextOne,
        body: TextManager.onBoardingBodyTextOne),
    BoardingModele(
        image: ImageAssets.onBoardingLogo2,
        title: TextManager.onBoardingTitleTextTwo,
        body:TextManager.onBoardingBodyTextTwo),
    BoardingModele(
        image: ImageAssets.onBoardingLogo3,
        title: TextManager.onBoardingTitleTextThree,
        body:TextManager.onBoardingBodyTextThree),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SafeArea(
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        submit(context);
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.yellow[100],
                          ),
                          child: const Text(
                            'Skip',
                            style: TextStyle(fontSize: 18),
                          )
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (int index) {
                      setState(() {
                        if (index == modele.length - 1) {
                          islast = true;
                        } else {
                          islast = false;
                        }
                      });
                    },
                    controller: pageviewc,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Bordinditem(modele[index]),
                    itemCount: modele.length,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SmoothPageIndicator(
                    effect: SwapEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.orangeAccent.withOpacity(.9),
                      radius: 6,
                      dotHeight: 6,
                      dotWidth: 18,
                    ),
                    controller: pageviewc,
                    count: modele.length),
                const  SizedBox(
                  height: 18,
                ),
                DefultBottom(
                    width: double.infinity,
                    background: Colors.teal,
                    onpresse: () {
                      if (islast) {
                        submit(context);
                      } else {
                        pageviewc.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    text:TextManager.started ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const    Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    DefultTextButtom(
                        function: () {
                          SingUp(context);
                        },
                        text: TextManager.signup,

                        color: Colors.teal)
                  ],
                ),
              ],
            ),
          ),
        ));
  }


}

