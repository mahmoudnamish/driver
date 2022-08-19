
abstract class RegisterState{}

class InitialeState extends RegisterState{}
class  Registerloding extends RegisterState{}
class  Registersucces extends RegisterState{}
class  Registereerror extends RegisterState{
  final String error ;
  Registereerror(this.error);
}
class  EyeStatesregister extends RegisterState{}
class  Creatloding extends RegisterState{}
class  CreatsuccesState extends RegisterState{}
class  CreateerrorState extends RegisterState{
  final String error ;
  CreateerrorState(this.error);
}