import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:sample/controller/homescreenController.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<Homescreencontroller>().university();
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,),
   
        
        body:Consumer<Homescreencontroller>(builder: (context, objjj, child) => 
        objjj.isloading?Center(child: LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.black,
        size: 50,
      ),
      ):

        ListView.separated(itemBuilder: (context, index) => 
        Container(
          color: const Color.fromARGB(255, 232, 142, 136),
          child: Column(
            children: [
              
              Text(context.watch<Homescreencontroller>().universitylists[index].code.toString()),
              Text(context.watch<Homescreencontroller>().universitylists[index].domain.toString()),
              Text(context.watch<Homescreencontroller>().universitylists[index].country.toString()),
              Text(context.watch<Homescreencontroller>().universitylists[index].province.toString()),
              Text(context.watch<Homescreencontroller>().universitylists[index].name.toString()),
              Text(context.watch<Homescreencontroller>().universitylists[index].webpage.toString()),

            ],
          ),
        ),

         separatorBuilder: (context, index) => SizedBox(height:10 ,), 
         itemCount:context.watch<Homescreencontroller>().universitylists.length),
          )  ,
    );
  }
}