import 'package:flutter/material.dart';
import 'package:mealmingle/pages/signup.dart';
import 'package:mealmingle/widget/content_mdel.dart';
import 'package:mealmingle/widget/widget_support.dart';

class Onbord extends StatefulWidget {
  const Onbord({Key? key}) : super(key: key);

  @override
  State<Onbord> createState() => _OnbordState();
}

class _OnbordState extends State<Onbord> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
      _controller = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose() {
       _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(padding: EdgeInsets.only(top: 40,left: 20,right: 20),
                    child: Column(children: [
                      Image.asset(
                        contents[i].image, height: 450, width: MediaQuery
                          .of(context)
                          .size
                          .width , fit: BoxFit.fill,
                      ),
                      SizedBox(height: 40,),
                      Text(contents[i].titile, style: AppWidget.headlineText(),),
                      SizedBox(height: 20,),
                      Text(contents[i].description,
                        style: AppWidget.semiLightText(),),

                    ],),
                  );
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              List.generate(contents.length, (index) =>
                  builDot(index, context),
              ),

            ),
          ),
          GestureDetector(
            onTap: (){
          if(currentIndex==contents.length-1)
            {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Singup(),));
            }
               _controller.nextPage(duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20)),
              height: 60,
              margin: EdgeInsets.all(40),
              width: double.infinity,
              child: Center(child:
              Text(          currentIndex==contents.length-1?"Start":
    "Next", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),)),
            ),
          )

        ],
      ),


    );
  }

    Container builDot(int index, BuildContext context)
    {
    return Container(
      height: 10,
      width: currentIndex==index?18:7,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color: Colors.black38),
    );

  }

}
