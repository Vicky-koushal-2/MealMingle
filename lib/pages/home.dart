import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mealmingle/pages/details.dart';
import 'package:mealmingle/service/databse.dart';
import 'package:mealmingle/widget/widget_support.dart';
class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false,
      pizza = false,
      salad = false,
      burgger = false;

  Stream? foodItemStream;
ontheLoad() async{
  foodItemStream=await Databasemethod().getFoodItem("Pizza");
  setState(() {

  });
}
@override
  void initState() {
    ontheLoad();
    super.initState();
  }


    @override
    Widget allItems() {
      return StreamBuilder(
          stream: foodItemStream, builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData ? ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: snapshot.data.docs.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.docs[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Details()));
                },
                child: Container(
                  margin: EdgeInsets.all(4),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRect(

                            child: Image.network(ds["Image"], height: 150,
                              width: 150,
                              fit: BoxFit.cover,),
                          ),
                          Text(ds["Name"], style: AppWidget.semiLightText(),),
                          SizedBox(height: 5,),
                          Text(ds["Detail"], style: AppWidget.LightText(),),
                          SizedBox(height: 5.0,),
                          Text(ds["Price"], style: AppWidget.semiLightText(),)
                        ],),
                    ),
                  ),
                ),
              );
            }) : CircularProgressIndicator();
      });
    }

  Widget allItemsVertically() {
    return StreamBuilder(
        stream: foodItemStream, builder: (context, AsyncSnapshot snapshot) {
      return snapshot.hasData ? ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Details()));
              },
              child:Container(
                margin: EdgeInsets.only(right: 0,bottom: 20),
                child: Material(

                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRect(


                          child: Image.network(ds["Image"], height: 120,
                            width: 80,
                            fit: BoxFit.cover,),
                        ),
                        SizedBox(width: 20.0,),
                        Column(children: [
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 2,
                            child: Text(ds["Name"],
                              style: AppWidget.semiLightText(),),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 2,
                            child: Text(ds["Detail"],
                              style: AppWidget.LightText(),),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 2,
                            child: Text(
                              ds["Price"], style: AppWidget.semiLightText(),),
                          )
                        ],)
                      ],
                    ),
                  ),
                ),
              ),

            );
          }) : CircularProgressIndicator();
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20),
        child: SingleChildScrollView(
          child: (
          
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hello Vicky",
                        style: AppWidget.boldText(),
          
                      ),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.shopping_cart_outlined, color: Colors.white,),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text("Delious Food", style: AppWidget.headlineText(),),
                  Text("Discover and Get Great Food ",
                    style: AppWidget.LightText(),),
                  SizedBox(height: 25,),
          
                  showItem(),
                  SizedBox(height: 30.0,),
          
                  Container(
                    height: 300,
                    child: allItems(),
                  ),


                 allItemsVertically()
          
                ],
              )
          ),
        ),
      ),

    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: ()  async{
            icecream = true;
            pizza = false;
            burgger = false;
            salad = false;
            foodItemStream = await Databasemethod().getFoodItem("Ice-cream");

            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),

            child: Container(
              decoration: BoxDecoration(
                  color: icecream ? Colors.deepOrange.shade500 : Colors.black,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset("assets/ice-cream.png", height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: icecream ? Colors.black : Colors.white,),

            ),
          ),
        ),

        GestureDetector(
          onTap: ()async {
            icecream = false;
            pizza = true;
            burgger = false;
            salad = false;

            foodItemStream = await Databasemethod().getFoodItem("Pizza");

            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),

            child: Container(
              decoration: BoxDecoration(
                  color: pizza ? Colors.deepOrange.shade500 : Colors.black,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset("assets/pizza.png", height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: pizza ? Colors.black : Colors.white,),

            ),
          ),
        ),
        GestureDetector(
          onTap: () async{
            icecream = false;
            pizza = false;
            burgger = true;
            salad = false;
            foodItemStream = await Databasemethod().getFoodItem("Burger");

            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),

            child: Container(
              decoration: BoxDecoration(
                  color: burgger ? Colors.deepOrange.shade500 : Colors.black,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset("assets/burger.png", height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: burgger ? Colors.black : Colors.white,),

            ),
          ),
        ),
        GestureDetector(
          onTap: () async{
            icecream = false;
            pizza = false;
            burgger = false;
            salad = true;
             foodItemStream = await Databasemethod().getFoodItem("Salad");
            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),

            child: Container(
              decoration: BoxDecoration(
                  color: salad ? Colors.deepOrange.shade500 : Colors.black,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset("assets/salad.png", height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: salad ? Colors.black : Colors.white,),

            ),
          ),
        ),

      ],
    );
  }
}
