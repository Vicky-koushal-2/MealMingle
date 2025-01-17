import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mealmingle/widget/widget_support.dart';
import 'package:http/http.dart'as http;
class Walet extends StatefulWidget {
  const Walet({Key? key}) : super(key: key);

  @override
  State<Walet> createState() => _WaletState();
}

class _WaletState extends State<Walet> {
  Map<String,dynamic>? paymentIntent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         margin: EdgeInsets.only(top: 60),
         child:
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
            Material (
                elevation: 2.0,
                child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                    child: Center(

                        child: Text("Walet",style: AppWidget.headlineText(),)))),
SizedBox(height: 30,),
         Container(
           padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
           width: MediaQuery.of(context).size.width,
           decoration: BoxDecoration(color: Colors.white70),
           child: Row(
             children: [
               Image.asset("assets/wallet.png",height: 60,width: 60,fit: BoxFit.cover,
               ),
               SizedBox(width: 40.0,),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Youre Wallet",style: AppWidget.LightText(),),
                   SizedBox(height: 5,),
                   Text("Rs."+"100",style: AppWidget.boldText(),)
                 ],

               )
             ],
           ),

         ),
             SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.only(left: 20),
               child: Text("Add money",style: AppWidget.semiLightText(),),
             ),
               SizedBox(height: 10,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Container(
                   padding: EdgeInsets.all(5),
                   decoration: BoxDecoration(
                     border: Border.all(color:
                     Colors.white),
                     borderRadius: BorderRadius.circular(5),

                   ),
                   child: Text("Rs."+"100",style: AppWidget.boldText(),),
                 ),
                 Container(
                   padding: EdgeInsets.all(5),
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.white),
                     borderRadius: BorderRadius.circular(5),

                   ),
                   child: Text("Rs."+"500",style: AppWidget.boldText(),),
                 ),
                 Container(
                   padding: EdgeInsets.all(5),
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.white),
                     borderRadius: BorderRadius.circular(5),

                   ),
                   child: Text("Rs."+"1000",style: AppWidget.boldText(),),
                 ),
                 Container(
                   padding: EdgeInsets.all(5),
                   decoration: BoxDecoration(
                     border: Border.all(color: Colors.white),
                     borderRadius: BorderRadius.circular(5),

                   ),
                   child: Text("Rs."+"2000",style: AppWidget.boldText(),),
                 ),
               ],
             ),
             SizedBox(height: 50,),
             Container(
               margin: EdgeInsets.symmetric(horizontal: 20),
               padding: EdgeInsets.symmetric(vertical: 12),
               width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(
                 color: Colors.blueGrey,
                 borderRadius: BorderRadius.circular(20)
               ),

               child: Center(
                 child: Text("Add Money",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
               ),
             ),

           ],
         ),

         ),

    );
  }
  // Future<void> makeOayment(String amount) async{
  //
  //   try{
  //     paymentIntent = await createPaymentIntent(amount,'INR');
  //     await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
  //     paymentIntentClientSecret: paymentIntent!['cline_secret'],style: ThemeMode.dark,
  //       merchantDisplayName: 'Vicky'
  //
  //
  //     )).then((value){});
  //     displayPaymentSheet(amount);
  //
  //   }catch(e,s)
  //   {
  //     print('exception: $e$s');
  //   }
  //
  // }
  // displayPaymentSheet(String amount) async {
  //   try {
  //     await Stripe.instance.presentPaymentSheet().then((value) async {
  //       add = int.parse(walet!) + int.parse(amount);
  //       await SharedPreferenceHelper().saveUserWallet(add.toString());
  //       await DatabaseMethods().UpdateUserwallet(id!, add.toString());
  //       // ignore: use_build_context_synchronously
  //       showDialog(
  //           context: context,
  //           builder: (_) => AlertDialog(
  //             content: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Row(
  //                   children: const [
  //                     Icon(
  //                       Icons.check_circle,
  //                       color: Colors.green,
  //                     ),
  //                     Text("Payment Successfull"),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ));
  //       await getthesharedpref();
  //       // ignore: use_build_context_synchronously
  //
  //       paymentIntent = null;
  //     }).onError((error, stackTrace) {
  //       print('Error is:--->$error $stackTrace');
  //     });
  //   } on StripeException catch (e) {
  //     print('Error is:---> $e');
  //     showDialog(
  //         context: context,
  //         builder: (_) => const AlertDialog(
  //           content: Text("Cancelled "),
  //         ));
  //   } catch (e) {
  //     print('$e');
  //   }
  // }
  //
  // //  Future<Map<String, dynamic>>
  // createPaymentIntent(String amount, String currency) async {
  //   try {
  //     Map<String, dynamic> body = {
  //       'amount': calculateAmount(amount),
  //       'currency': currency,
  //       'payment_method_types[]': 'card'
  //     };
  //
  //     var response = await http.post(
  //       Uri.parse('https://api.stripe.com/v1/payment_intents'),
  //       headers: {
  //         'Authorization': 'Bearer $secretKey',
  //         'Content-Type': 'application/x-www-form-urlencoded'
  //       },
  //       body: body,
  //     );
  //     // ignore: avoid_print
  //     print('Payment Intent Body->>> ${response.body.toString()}');
  //     return jsonDecode(response.body);
  //   } catch (err) {
  //     // ignore: avoid_print
  //     print('err charging user: ${err.toString()}');
  //   }
  // }
  //
  // calculateAmount(String amount) {
  //   final calculatedAmout = (int.parse(amount)) * 100;
  //
  //   return calculatedAmout.toString();
  // }
  //
  // Future openEdit() => showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       content: SingleChildScrollView(
  //         child: Container(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Row(
  //                 children: [
  //                   GestureDetector(
  //                       onTap: () {
  //                         Navigator.pop(context);
  //                       },
  //                       child: Icon(Icons.cancel)),
  //                   SizedBox(
  //                     width: 60.0,
  //                   ),
  //                   //flutterfire configure -- projects=mealmingle-4c218
  //                   Center(
  //                     child: Text(
  //                       "Add Money",
  //                       style: TextStyle(
  //                         color: Color(0xFF008080),
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //               SizedBox(
  //                 height: 20.0,
  //               ),
  //               Text("Amount"),
  //               SizedBox(
  //                 height: 10.0,
  //               ),
  //               Container(
  //                 padding: EdgeInsets.symmetric(horizontal: 10.0),
  //                 decoration: BoxDecoration(
  //                     border: Border.all(color: Colors.black38, width: 2.0),
  //                     borderRadius: BorderRadius.circular(10)),
  //                 child: TextField(
  //                   controller: amountcontroller,
  //                   decoration: InputDecoration(
  //                       border: InputBorder.none, hintText: 'Enter Amount'),
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 20.0,
  //               ),
  //               Center(
  //                 child: GestureDetector(
  //                   onTap: (){
  //                     Navigator.pop(context);
  //                     makePayment(amountcontroller.text);
  //                   },
  //                   child: Container(
  //                     width: 100,
  //                     padding: EdgeInsets.all(5),
  //                     decoration: BoxDecoration(
  //                       color: Color(0xFF008080),
  //                       borderRadius: BorderRadius.circular(10),
  //                     ),
  //                     child: Center(
  //                         child: Text(
  //                           "Pay",
  //                           style: TextStyle(color: Colors.white),
  //                         )),
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ));
}
