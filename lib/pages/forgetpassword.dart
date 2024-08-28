import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mealmingle/pages/login.dart';
import 'package:mealmingle/pages/signup.dart';
class Forgetpassword extends StatefulWidget {
  const Forgetpassword({Key? key}) : super(key: key);

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  TextEditingController mailcontroller = new TextEditingController();
String email = "";
final _formkey=GlobalKey<FormState>();
resetPassword() async{
  try{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password Reset Email has been sent !",)));

  }
  on FirebaseAuthException catch(e)
  {
    if(e.code == "user-not-found")
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No user found for the email",style: TextStyle(
          fontSize: 18.0
        ),
        )));
      }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container( child: Column(children: [
       SizedBox(height: 70.0,),
        Container(
          alignment: Alignment.topCenter,
          child: Text(
            "Pasword Recovery",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        SizedBox(height: 30,),
        Text("Enter youre Email",style: TextStyle(
          color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18
        ),),
        Expanded(child: Form(
          key: _formkey,
          
          child: Padding(

            padding: EdgeInsets.only(left: 10.0),
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white70,width: 2.0),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextFormField(
                    controller: mailcontroller,
                    validator: (value){
                      if(value == null || value.isEmpty)
                        {
                          return 'Please Enter Email';
                        }
                      return null;
                    },
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: 18,color: Colors.white),
                      prefixIcon: Icon(Icons.mail,color: Colors.white70,size: 30,
                      ),
                      border: InputBorder.none,

                    ),
                  ),
                ),
                SizedBox(height: 40,),

                      GestureDetector(
                        onTap: (){
                      if(_formkey.currentState!.validate())
                        {
                          setState(() {
                            email=mailcontroller.text;
                          });
                          resetPassword();
                        }
                        },
                        child: Container(
                          width: 140,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text("Send Email",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                      ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [


                    Text("Don't have an account",style: TextStyle(fontSize: 18,color: Colors.white),),
                    SizedBox(width: 5.0,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Singup(),));
                      },
                      child: Text('Create',style: TextStyle(color: Colors.yellow,fontSize: 20,fontWeight: FontWeight.bold),),

                    ),
                  ],
                )
                    ],
                  ),
                )

            ),
          ),



        

      ],),),
    );
  }
}

    