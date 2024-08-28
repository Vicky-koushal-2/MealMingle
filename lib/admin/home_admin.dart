import 'package:flutter/material.dart';
import 'package:mealmingle/admin/add_food.dart';
import 'package:mealmingle/widget/widget_support.dart';
class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  State<HomeAdmin> createState() => _State();
}

class _State extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 body: Container(
   margin: EdgeInsets.only(top: 50,left: 20,right: 20),
   child: Column(
     children: [
       Center(child: Text("Home Admin",style: AppWidget.headlineText(),),),
       SizedBox(height: 50,),
       GestureDetector(
         onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>AddFood()));
         },
         child: Material(
           elevation: 10,
           borderRadius: BorderRadius.circular(10),
           child: Center(
             child: Container(
               padding: EdgeInsets.all(4),
               decoration: BoxDecoration(
                 color: Colors.black,
                 borderRadius: BorderRadius.circular(10),
               ),
               child: Row(children: [
                 Padding(padding: EdgeInsets.all(16),
                 child: Image.asset("assets/salad2.png",height: 100,width: 100,fit: BoxFit.cover,),
                 ),
                 SizedBox(width:30 ,),
                 Text("Add Food Items",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
         
                 
               ],),
               
             ),
           ),
         ),
       )
     ],
   ),
 ),
    );
  }
}
