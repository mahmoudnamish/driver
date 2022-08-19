// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:dlx_task/controller/shared/bloc/singup_screen/state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../controller/shared/bloc/singup_screen/bloc.dart';
// import '../constant/design.dart';
// import '../constant/validator.dart';
// import '../resource/color_manager.dart';
// import '../resource/navigation_manager.dart';
//
//
// class EnterNameAndPhoneScreen extends StatelessWidget {
//
//   const EnterNameAndPhoneScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<RegisterCubit,RegisterState>(
//       listener: (context,state){},
//       builder: (context,state){
//         var cubit =RegisterCubit.get(context);
//         return  SafeArea(
//           child: Scaffold(
//             body: Form(
//               key:cubit.valdKey ,
//               child: Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   crossAxisAlignment:  CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment:MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Welcome',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headline4!
//                                 .copyWith(color: Colors.black),
//                           ),
//                           const SizedBox(width: 5,),
//                           Text(
//                             'To Drivers App',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headline6!
//                                 .copyWith(color: ColorManager.primary),
//                           ),
//                         ],),
//                       const SizedBox(height: 30,),
//                     const Text(' name ',style: TextStyle(color: ColorManager.captionTextColor,fontSize: 20,fontWeight: FontWeight.bold)),
//                       const SizedBox(height: 10,),
//                       DefultTextFormField(
//                           textScure: false,
//                           text: 'Name',
//                           prefux: Icons.person,
//                           type: TextInputType.name,
//                           controle:cubit.namebasecontroler,
//                           valaditor: ( value) {
//                             if (value!.isEmpty) {
//                               return 'please enter the Name';
//                             }
//                             return null;
//                           }),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       const Text('phone Number',style: TextStyle(color: ColorManager.captionTextColor,fontSize: 20,fontWeight: FontWeight.bold)),
//                       const SizedBox(height: 10,),
//                       DefultTextFormField(
//                         text: 'Phone',
//                         prefux: Icons.phone,
//                         type: TextInputType.phone,
//                         controle: cubit.phonecontroler,
//                         valaditor: phoneValidator,
//
//                         textScure: false,
//
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//
//                       ConditionalBuilder(
//                         condition: state is !Creatloding ,
//                         builder: (context)=> Align(
//                           alignment: Alignment.center,
//                           child: ElevatedButton(onPressed: (){
//                             if (cubit.valdKey.currentState!.validate()){
//                               cubit.userCreate();
//                               cubit.phonecontroler.clear();
//                               cubit.namebasecontroler.clear();
//                               if(state is CreatsuccesState){
//                                 home(context);
//                               }
//
//                             }
//
//
//
//                           },
//                             style: ElevatedButton.styleFrom(maximumSize:const Size(200,100),
//                                 primary: ColorManager.primary,
//                                 elevation: 20,
//                                 shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
//                             ),
//                             child: Text('Next', style: Theme.of(context)
//                                 .textTheme
//                                 .headline6!
//                                 .copyWith(color: ColorManager.backGround),),
//
//                           ),
//
//                         ),
//                         fallback: (context)=> const Center(
//                             child: CircularProgressIndicator(
//                               color:ColorManager.primary,
//                             )),
//
//                       )
//
//
//
//                     ]),
//               ),
//             ),
//
//           ),
//         );
//
//       },
//
//     );
//   }
//
//   // DefultTextFormField(
//   // text: 'Phone',
//   // prefux: Icons.phone,
//   // type: TextInputType.phone,
//   // controle: cubit.phonecontroler,
//   // valaditor: phoneValidator,
//   //
//   // textScure: false,
//   //
//   // ),
// }
