import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  static String userIdKey="USERKEY";
  static String userNameKey = "USERNAMELEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userWaletLKEY = "USERWALLETKEY";
 static String userProfileKey = "USERPROFILE";

 // Future<bool> saveUserId(String getUserId) async{
 //   SharedPreferences prefs = await SharedPreferences.getInstance;
 //   return pref.setString(userIdKey,getUserId);
 // }
  Future<bool> saveUserId(String getUserId) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userIdKey, getUserId);
  }

  Future<bool> saveUserName(String getUSerName) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userNameKey, getUSerName);
  }

  Future<bool> saveUserEmail(String getUSerEmail) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userEmailKey, getUSerEmail);
  }

  Future<bool> saveUserwallet(String getUSerWallet) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userWaletLKEY, getUSerWallet);
  }

  Future<bool> saveUserProfile (String getUserProfile) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(userProfileKey,getUserProfile);
  }
  Future<String?> getUserId() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userIdKey);
  }
  Future<String?> getUserName() async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    return preferences.getString(userNameKey);
  }
  Future<String?> getUserEmail() async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    return preferences.getString(userEmailKey);
  }

  Future<String?> getUserWallet() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userWaletLKEY);
  }
  Future<String?> getUserProfile() async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    return preferences.getString(userProfileKey);
  }


}