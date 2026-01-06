/*import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/auth/model/login_model.dart';
import 'package:home_boom_app/auth/service/auth_service.dart';

import 'state_auth.dart';

class CubitAuth extends Cubit<StateAuth> {
  CubitAuth() : super(AuthInitial());
  AuthService auth = AuthService();
  Future<void> login(Map<String, dynamic> data) async {
    emit(AuthLoading());
    User? user = await auth.Login(data);
    if (user != null) {
      emit(AuthSuccess(user));
    } else {
      emit(AuthFauiler(message: "check your intrernet conaction "));
    }
  }

  Future<void> register({
    required Map<String, dynamic> data,
    required File profileImage,
    required File idImage,
  }) async {
    emit(AuthLoading());
    User? user = await auth.register(
      data: data,
      profileImage: profileImage,
      idImage: idImage
    );
    if (user != null) {
      emit(AuthSuccess(user));
    } else if (user != null) {
      emit(AuthFauiler(message: "email exit "));
    } else {
      emit(AuthFauiler(message: "check your intrernet conaction"));
    }
  }
}
*/
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_boom_app/auth/model/login_model.dart';
import 'package:home_boom_app/auth/service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'state_auth.dart';

class CubitAuth extends Cubit<StateAuth> {
  CubitAuth() : super(AuthInitial());
  final AuthService auth = AuthService();

  Future<void> login(Map<String, dynamic> data) async {
    emit(AuthLoading());
    User? user = await auth.login(data);
    if (user != null) {
    if (user.active == "no") {
      emit(EmailFailure("Your account is awaiting admin approval. Please wait."));
    } else {
      emit(AuthSuccess(user));
      
        final prefs = await SharedPreferences.getInstance();
        print("Saved user_id in storage: ${prefs.getInt('user_id')}");
         final prefss = await SharedPreferences.getInstance();
        print("Saved phone_number in storage: ${prefss.getString('number_phone')}");
    
    }
  } else {
    emit(AuthFauiler(message: "Server error or invalid credentials"));
  }
  }

  Future<void> register({
    required Map<String, dynamic> data,
    required File? profileImage,
    required File? idImage,
  }) async {
    if (profileImage == null || idImage == null) {
      emit(AuthFauiler(message: "Please pick profile and ID images"));
      return;
    }

    emit(AuthLoading());
    User? user = await auth.register(
      data: data,
      profileImage: profileImage,
      idImage: idImage,
    );

   if (user != null) {
  if (user.active == "no") {
    emit(EmailFailure("Your account is awaiting admin approval."));
  } else {
    emit(AuthSuccess(user));
  }
} else {
  emit(AuthFauiler(message: "Server error or validation failed"));
}
  }
  Future<void> logout() async {
  emit(AuthLoading());

  final success = await auth.logout();

  if (success) {
    emit(LogoutSuccess());
  } else {
    emit(AuthFauiler(message: "You cannot logout"));
  }
}

}
