import 'package:shared_preferences/shared_preferences.dart';

const String _tokenKey = 'token';
Future<void> saveToken(String token) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(_tokenKey, token);
  print("Token saved successfully");
}

Future<String?> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString(_tokenKey);
  if (token == null) {
    return null;
  } else {
    print("Retrieved token :$token");
    return token;
  }
}

Future<void> deleteToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(_tokenKey);
  print('Token deleted successfully!');
}







const String _user_idKey="user_id";
Future<void>saveuserid(int user_id)async{
  final SharedPreferences prefs=await SharedPreferences.getInstance();
  await prefs.setInt(_user_idKey,user_id);
  print("user_id saved successfully ");


}
Future<int?>getUserId()async{

  final SharedPreferences prefs= await SharedPreferences.getInstance();
  final user_id=prefs.getInt(_user_idKey);
  if (user_id==null) {
    print("No user ID found");
    return null;
    
  } else {
     print("Retrieved user_id :$user_id");
    return user_id;
    
  }
}

Future<void>deleteUserId()async{
  final SharedPreferences prefs=await SharedPreferences.getInstance();
  await prefs.remove(_user_idKey);
   print('user_id deleted successfully!');
}




const String _number_phone="number_phone";
Future<void>saveNumberPhone(String number_phone)async{
  final SharedPreferences prefs=await SharedPreferences.getInstance();
  await prefs.setString(_number_phone,number_phone);
  print("phone_number saved successfully ");


}
Future<String?>getNumberPhone()async{

  final SharedPreferences prefs= await SharedPreferences.getInstance();
  final number_phone=prefs.getString(_number_phone);
  if (number_phone==null) {
    print("No phone_number found");
    return null;
    
  } else {
     print("Retrieved phone_number :$number_phone");
    return number_phone;
    
  }
}

Future<void>deleteNumberPhone()async{
  final SharedPreferences prefs=await SharedPreferences.getInstance();
  await prefs.remove(_number_phone);
   print('phone_number deleted successfully!');
}


