import 'package:home_boom_app/auth/model/login_model.dart';

abstract class StateAuth {}
class AuthInitial extends StateAuth{}
class AuthLoading extends StateAuth{}
class AuthSuccess extends StateAuth{
  
final  User user;
 AuthSuccess(this.user);

}
class AuthFauiler extends StateAuth{
  final String message;

  AuthFauiler({required this.message});


}
class EmailFailure extends StateAuth{
  final String message;

  EmailFailure( this.message);
  
}
class LogoutSuccess extends StateAuth {}