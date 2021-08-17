part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final Map<String, CartItem> carts ;

  CartLoaded(this.carts);
}

class CartError extends CartState {}
