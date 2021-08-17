part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class AddItemToCart extends CartEvent {
  final Products cartItem;

  AddItemToCart(this.cartItem);
}

class IncrementItem extends CartEvent {
  final Products cartItem;

  IncrementItem(this.cartItem);
}

class DecrementItem extends CartEvent {
  final Products cartItem;

  DecrementItem(this.cartItem);
}

class DeleteItem extends CartEvent {
  final Products cartItem;

  DeleteItem(this.cartItem);
}

class LoadCartPage extends CartEvent {}