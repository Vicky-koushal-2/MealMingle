import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Databasemethod{
Future addFoodItem(Map<String,dynamic>userInfoMap,String name) async
{
  return await FirebaseFirestore.instance.collection(name).add(userInfoMap);
}

Future<Stream<QuerySnapshot>> getFoodItem(String name ) async{
  return await FirebaseFirestore.instance.collection(name).snapshots();
}
Future addFoodToCard(Map<String,dynamic>userInfoMap,String id) async
{
  return await FirebaseFirestore.instance
      .collection('user')
  .doc(id).collection("Cart")
      .add(userInfoMap);
}


}