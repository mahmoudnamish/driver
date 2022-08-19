import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dlx_task/controller/shared/bloc/login_screen_bloc/bloc.dart';
import 'package:dlx_task/controller/shared/bloc/login_screen_bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/shared/shared_prefrance/local/shard_prefrance.dart';
import '../constant/design.dart';
import '../constant/validator.dart';
import '../resource/color_manager.dart';
import '../resource/navigation_manager.dart';
import '../resource/text_manager.dart';

class LoginScreen extends StatelessWidget {

   const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return BlocConsumer<LoginCubit,LoginStates>(
    listener: (context,state){
      if(state is ErrorStates){
        Showtoast(masage: state.error, state: tostestate.error);
      }
      if(state is SuccesStates){
        CacheHelper.saveData(
            key: 'uId', value:state.uId)
            .then((value) {
          home(context);
        });

      }

    },
    builder: (context,state){
      var cubit = LoginCubit.get(context);
     return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key:cubit.valdiatorKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment:MainAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.black),
                          ),
                          const SizedBox(width: 5,),
                          Text(
                            'Back!',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: ColorManager.primary),
                          ),
                        ],),
                      const SizedBox(height: 5,),
                      Text(
                        'Login',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 30),
                      DefultTextFormField(
                       // onsubmitted: (String ? value){
                       //   if (cubit.valdiatorKey.currentState!.validate()) {
                       //       cubit.userlogin();
                       //       home(context);
                       //   }
                       // },
                        textScure: false,
                          text: 'Email',
                          prefux: Icons.email,
                          type: TextInputType.emailAddress,
                          controle: cubit.emailcontroler,
                          valaditor: emailValidator),
                      const SizedBox(
                        height: 15,
                      ),
                      DefultTextFormField(
                              // onsubmitted: (String ? value){
                              //   if (cubit.valdiatorKey.currentState!.validate()) {
                              //     cubit.userlogin();
                              //     home(context);
                              //   }
                              //
                              // },
                          text: 'Passswored',
                          prefux: Icons.lock,
                          textScure: cubit.textScure,

                          suficepress: () {
                            cubit.TextSecure();
                          },
                          sufex: cubit.icon,
                          type: TextInputType.visiblePassword,
                          controle: cubit.passworedcontroler,
                          valaditor: passwordValidator
                          ),
                      const SizedBox(
                        height: 30,
                      ),
                      ConditionalBuilder(
                        condition: state is!LoadingStates,
                        builder: (context) => DefultBottom(
                            width: double.infinity,
                            background: Colors.teal,
                            onpresse: () {
                              if (cubit.valdiatorKey.currentState!.validate()){
                                cubit.userlogin();
                                if(state is SuccesStates){
                                  home(context);
                                }

                              }
                            },
                            text: TextManager.login),
                        fallback: (context) => const Center(
                            child: CircularProgressIndicator(
                              color:ColorManager.primary,
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account ?'),
                          const SizedBox(
                            width: 15,
                          ),

                          DefultTextButtom(
                              color: ColorManager.primary,
                              function: () {
                                SingUp(context);
                              },
                              text: TextManager.signup)
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ),
      );
    },

  );
  }
}
