import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/shared/bloc/singup_screen/bloc.dart';
import '../../controller/shared/bloc/singup_screen/state.dart';
import '../constant/design.dart';
import '../constant/validator.dart';
import '../resource/color_manager.dart';
import '../resource/navigation_manager.dart';

class RegisterScreen extends StatelessWidget {

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        // if (state is Registersucces) {
        //   if (state.registermodele.status!) {
        //     CachHelper.saveData(
        //         key: 'token', value: state.registermodele.data!.token)
        //         .then((value) {
        //       token = state.registermodele.data!.token!;
        //       Navigator.pushAndRemoveUntil(
        //           (context),
        //           MaterialPageRoute(builder: (context) => ShopeHomeScreen()),
        //               (route) => false);
        //     });
        //   } else {
        //     Showtoast(
        //         masage: state.registermodele.message!, state: tostestate.error);
        //   }
        // }
      },
      builder: (context, state) {

        var cubit = RegisterCubit.get(context);

        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: cubit.valdiatorKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text(
                            'Hello',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 5,),
                          Text(
                            'Friend!',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                color:ColorManager.primary,
                                fontWeight: FontWeight.bold),
                          ),
                        ],),
                        const SizedBox(height: 5,),
                        const  Text(
                          'Sign Up',
                          style:
                          TextStyle(
                              color: Colors.grey,
                              fontSize: 20
                          ),
                        ),

                        const SizedBox(height: 20),
                        DefultTextFormField(
                          textScure: false,
                            text: 'Name',
                            prefux: Icons.person,
                            type: TextInputType.name,
                            controle:cubit.namecontroler,
                            valaditor: ( value) {
                              if (value!.isEmpty) {
                                return 'please enter the Name';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        DefultTextFormField(
                          textScure: false,

                            text: 'Email',
                            prefux: Icons.email,
                            type: TextInputType.emailAddress,
                            controle:cubit.emailcontroler,
                            valaditor:emailValidator
                            ),
                        const SizedBox(
                          height: 15,
                        ),
                        DefultTextFormField(
                          text: 'Phone',
                          prefux: Icons.phone,
                          type: TextInputType.phone,
                          controle: cubit.phonecontroler,
                          valaditor: phoneValidator,

                          textScure: false,

                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        DefultTextFormField(
                            text: 'Passswored',
                            prefux: Icons.lock,
                            textScure: cubit.textScure,
                            suficepress: () {
                              cubit.textSecure();
                            },
                            sufex: cubit.icon,
                            type: TextInputType.visiblePassword,
                            controle: cubit.passworedcontroler,
                            valaditor: passwordValidator),
                        const SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is ! Registerloding,
                          builder: (context) => DefultBottom(
                            onpresse: (){
                              if (cubit.valdiatorKey.currentState!.validate())
                              {     cubit.postregister(
                                phone: cubit.phonecontroler.text,
                                    name: cubit.namecontroler.text
                                    , email: cubit.emailcontroler.text,
                                    password: cubit.passworedcontroler.text,);

                              }if(state is CreatsuccesState){
                                home(context);
                              }
                            },
                              width: double.infinity,
                              background: ColorManager.primary,
                              text: 'Sign Up'),

                          fallback: (context) => const Center(
                              child: CircularProgressIndicator(
                                color: ColorManager.primary,
                              )),

                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        Row(children: [
                          const Text('Already Have an Account? ',
                            style: TextStyle(fontSize:15),),
                          const  SizedBox(width: 5,),
                          DefultTextButtom(text: 'Sign In',function: (){
                            submit(context);

                          }, color: ColorManager.primary,)
                        ],)
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
