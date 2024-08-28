import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mealmingle/admin/home_admin.dart';
import 'package:mealmingle/service/databse.dart';
import 'package:mealmingle/widget/widget_support.dart';
import 'package:random_string/random_string.dart';

class AddFood extends StatefulWidget {
  const AddFood({Key? key}) : super(key: key);

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  final List<String>items = ['Ice-cream', 'Burger', 'Salad', 'Pizza'];
  String? value;
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController pricecontrooler = new TextEditingController();
  TextEditingController detailcontrooler = new TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? selectdImage;

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    selectdImage = File(image!.path);
    setState(() {

    });
  }

  uploadItem() async{
    if (selectdImage != null && namecontroller.text != "" &&
        pricecontrooler.text != "" && detailcontrooler.text != ""){
      String addId= randomAlphaNumeric(10);

      Reference firebaseStorageRef =
      FirebaseStorage.instance.ref().child("blogImages").child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectdImage!);

      var downloadUrl = await (await task).ref.getDownloadURL();

      Map<String, dynamic> addItem = {
        "Image": downloadUrl,
        "Name": namecontroller.text,
        "Price": pricecontrooler.text,
        "Detail": detailcontrooler.text
      };
      await Databasemethod().addFoodItem(addItem, value!).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Food Item has been added Successfully",
              style: TextStyle(fontSize: 18.0),
            )));
      });

  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
              onTap: (){
           Navigator.pop(context);
              },
            child: Icon(Icons.arrow_back_ios_new_outlined,color:Colors.black ,)),
        centerTitle:true,
        title: Text("Add Item",style: AppWidget.headlineText(),),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20.0,right: 20,top: 20,bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Upload the Item Picture",style: AppWidget.boldText(),),
              SizedBox(height: 20,),
              selectdImage==null?
              GestureDetector(
                onTap: (){
                  getImage();
                },
                child: Center(
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 150,
                       height: 150,
                      decoration: BoxDecoration(
                       border: Border.all(color: Colors.black,width: 1.5),borderRadius: BorderRadius.circular(20),
                      ),
                
                  child: Icon(Icons.camera_alt_outlined,color: Colors.black,),
                    ),
                
                
                  ),
                ),
              ):
              Center(
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,width: 1.5),
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: ClipRect(


                      child:
                      Image.file(

                        selectdImage!
                            ,  fit: BoxFit.cover,
                      ),
                    ),
                  ),


                ),
              ),
              SizedBox(height: 30,),
              Text("Item Name",style: AppWidget.boldText(),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(border: InputBorder.none,hintText: "Enter Item Name "),
        
                ),
              ),
        
              SizedBox(height: 30,),
              Text("Item Price",style: AppWidget.boldText(),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: pricecontrooler,
                  decoration: InputDecoration(border: InputBorder.none,hintText: "Enter Item Price "),
                ),
              ),
        
              SizedBox(height: 30,),
              Text("Item Detail",style: AppWidget.boldText(),),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  maxLines: 6,
                  controller: detailcontrooler,
                  decoration: InputDecoration(border: InputBorder.none,hintText: "Enter Item Details "),
                ),
              ),
        SizedBox(height: 20,),
        Text("Select Category",style: AppWidget.boldText(),),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color(0xFFececf8),borderRadius: BorderRadius.circular(10)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(items: items.map((item)=> DropdownMenuItem<String>

              ( value: item,

                child: Text(item,style: TextStyle(fontSize: 18.0,color: Colors.black),)))
                .toList(),onChanged:((value)=>setState(() {
        this.value=value;
            })
            )
              ,dropdownColor: Colors.white,hint: Text("Selected Category",),icon: Icon(Icons.arrow_drop_down,color: Colors.black,),value: value,) ,
          ),
        ),
              SizedBox(height: 30,),
              GestureDetector(

                onTap: (){
                  uploadItem();
                },
                child: Center(
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      width: 150,
                
                      decoration: BoxDecoration(
                        color: Colors.black,borderRadius: BorderRadius.circular(10),
                      ),
                
                      child:Center(
                
                      child: Text("Add",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                    ),
                  ),
                ),
              )
        
        
            ],
          ),
        
        
        ),
      ),
    );
  }
}
