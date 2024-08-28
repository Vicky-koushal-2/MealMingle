import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mealmingle/pages/bottom_nav.dart';
import 'package:mealmingle/pages/home.dart';
import 'package:mealmingle/pages/login.dart';
import 'package:mealmingle/widget/widget_support.dart';

class Singup extends StatefulWidget {
  const Singup({Key? key}) : super(key: key);

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {

String email="", password="",name="";
TextEditingController namecontroller = new TextEditingController();

TextEditingController passwordcontroller = new TextEditingController();

TextEditingController mailcontroller = new TextEditingController();

final _formkey= GlobalKey<FormState>();

registration() async{
  if(password!=null)
    {
      try
          {
            UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar

        (
          backgroundColor: Colors.redAccent,
          content: Text("Reistration Successful",style: TextStyle(fontSize: 20),)));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNav(),));
          }

          on FirebaseException catch(e)
  {
    if(e.code=='weak-password')
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orange.shade600,
            content: Text("Youre password is weak",style: TextStyle(fontSize: 18),)));
      }
    else if(e.code=="email-already-in-use")
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orange.shade600,
            content: Text("Account Already exsists",style: TextStyle(fontSize: 18),)));
      }
  }
    }

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child:Stack(children: [
            Container(

              height: MediaQuery.of(context).size.height/2.5 ,
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                  gradient: LinearGradient(

                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,

                      colors:[
                        Color(0xFFff5c30),
                        Color(0xFFe74b1a)

                      ] )),
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40))),
              child: Text(""),

            ),


            Container(
              margin: EdgeInsets.only(top: 60,left: 20,right: 20),
              child: Column(
                children: [

                  Center(child: Image.asset("assets/foodlogo.png",width: MediaQuery.of(context).size.width/2,fit: BoxFit.cover,)),
                  SizedBox(height: 30,),
                  Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.only(left: 20,right: 20),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/1.9,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              SizedBox(height: 30,),
                              Text("Sign Up",style: TextStyle(fontSize:30,fontWeight: FontWeight.bold ),
                          
                              ),
                              SizedBox(height: 30,),
                              TextFormField(
                                controller: namecontroller,
                          validator: (value)
                                  {
                                    if(value==null || value.isEmpty)
                                      {
                                        return 'Please Enter Name';
                                      }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'Enter Name',prefixIcon: Icon(Icons.person_outline) )
                              ),
                              SizedBox(height: 30,),
                              TextFormField(

                                  controller: mailcontroller ,
                                  validator: (value)
                                  {
                                    if(value==null || value.isEmpty)
                                    {
                                      return 'Please Enter E-mail';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      hintText: 'Enter Email',prefixIcon: Icon(Icons.email_outlined) )
                              ),
                              SizedBox(height: 30,),
                              TextFormField(

                                  controller: passwordcontroller,
                                  validator: (value)
                                  {
                                    if(value==null || value.isEmpty)
                                    {
                                      return 'Please Enter E-mail';
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                          
                                      hintText: 'Enter Password',prefixIcon: Icon(Icons.password_outlined) )
                              ),
                              SizedBox(height: 30,),
                              GestureDetector(
                                onTap: () async{
                                  if(_formkey.currentState!.validate())
                                    {
                                      setState(() {
                                        email=mailcontroller.text;
                                        name = namecontroller.text;
                                        password = passwordcontroller.text;
                                      });
                                    }
                                  registration();


                                },
                                child: Material(
                                  elevation: 5,

                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    width: 200,
                                    decoration: BoxDecoration(color:Color(0xFFe74b1a),borderRadius: BorderRadius.circular(20)),
                                    child: Center(child:
                                    Text("Signu UP",style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),)),
                                  ),
                                ),
                              )
                            ],
                          
                          
                          
                          ),
                        ),)
                  ),

                  SizedBox(height: 70,),
                  GestureDetector

                    (
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                    },
                      child: Text("Already have an account? Login",style:AppWidget.boldText()))
                ],
              ),
            )
          ],)
      ),
    );


  }
}
