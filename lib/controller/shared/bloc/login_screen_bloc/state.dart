

abstract class  LoginStates {}

class InitialeStates extends LoginStates{}
class LoadingStates extends LoginStates{}
class SuccesStates extends LoginStates{
  final String uId;

  SuccesStates(this.uId);

}
class ErrorStates extends LoginStates{
  final String error;
  ErrorStates(this.error);

}
class EyeStates extends LoginStates{}