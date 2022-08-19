
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dlx_task/controller/shared/bloc/home_screen/state.dart';
import 'package:dlx_task/view/resource/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/shared/bloc/home_screen/bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitHome,StatesHome>(
      listener: (context, state) {},
      builder:(context, state) {

        var cubit = CubitHome.get(context);

        return Scaffold(appBar: AppBar(
          title:  Text( cubit.title[cubit.current] ,
            style: const TextStyle(color: ColorManager.primary,fontSize: 25,fontWeight: FontWeight.bold),),

        ),

          body:cubit.bottomScreen[cubit.current],
          drawer: Drawer(
            child: Scaffold(
              appBar: AppBar(),
              body: Column(children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(color: Colors.grey[300]),
                  child:Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('User',style: TextStyle(fontSize: 22,color: ColorManager.primary,fontWeight: FontWeight.bold),),
                          const SizedBox(height: 5,),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                      radius: 44,child:
                          Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE5G6-DO5od6mf50_N39Che2cAKlT2mU9hCA&usqp=CAU',)),

                          ),
                    const SizedBox(height: 15,),
                    const Expanded(child: Text('mahmoud Essam',style: TextStyle(fontSize: 15,color: ColorManager.primary,fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                          const  SizedBox(height: 10,),
                    const Text('011154655',style: TextStyle(fontSize: 15,color: ColorManager.captionTextColor,)),




                    ]),


                  ) ,)

              ]),
            ),
            
          ),

          bottomNavigationBar: CurvedNavigationBar(
            height: 50,
            backgroundColor: Colors.grey,
            color: ColorManager.primary,
            index: cubit.current,
            onTap: (index){
              cubit.changeBottom(index);
            },
            items: const [
              Icon(Icons.home),
              Icon(Icons.person),
              Icon(Icons.history),
            ],

          ),

        );
      } ,
    );
  }
}
