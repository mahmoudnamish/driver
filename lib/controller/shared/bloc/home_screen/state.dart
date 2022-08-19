
abstract class StatesHome {}

class InitialState extends StatesHome {}

class ChangebottomNavigateState extends StatesHome {}

class ShopHomeLodingState extends StatesHome {}

class ShopHomeSuccessState extends StatesHome {}

class ShopHomeErrorState extends StatesHome {
  final String error;

  ShopHomeErrorState(this.error);
}
