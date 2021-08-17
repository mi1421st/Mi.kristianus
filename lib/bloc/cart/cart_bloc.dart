import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kulina/cart/model/cart_model.dart';
import 'package:kulina/cart/model/cart_view_model.dart';
import 'package:kulina/model/products.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial());

  Map<String, CartItem> _items = Map();

  Map<String, CartItem> get items {
    return {...items};
  }

  int get itemCount{
    return _items.length;
  }

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is AddItemToCart) {
      yield* _mapAddItemToCartToState(event);
    }
    if (event is DeleteItem) {
      yield* _mapDeleteItemToState(event);
    }
    if (event is DecrementItem) {
      yield* _mapDecrementItemToState(event);
    }
    if (event is LoadCartPage) {
      yield* _mapLoadCartPageToState();
    }
  }

  Stream<CartState> _mapLoadCartPageToState() async* {
    try{
      yield CartLoading();
      yield CartLoaded(CartViewModel().items);
    }
    catch (e) {
      print(e);
      yield CartError();
    }
  }

  Stream<CartState> _mapAddItemToCartToState(AddItemToCart event) async*{
    try{
      yield CartLoading();
      CartViewModel().addItemToCart(event.cartItem);
      yield CartLoaded(CartViewModel().items);
    }
    catch (e) {
      print(e);
      yield CartError();
    }
  }

  Stream<CartState> _mapDecrementItemToState(DecrementItem event) async*{
    if(!_items.containsKey(event.cartItem.id.toString())) {
      return ;
    }
    else if(_items[event.cartItem.id.toString()]!.qty! > 1){
      _items.update(event.cartItem.id.toString(), (value) => CartItem(
        cartItem: event.cartItem,
        qty: value.qty! - 1,
      ));
    }
    else if(_items[event.cartItem.id.toString()]!.qty! == 1){
      _items.remove(event.cartItem.id.toString());
    }
  }

  Stream<CartState> _mapDeleteItemToState(DeleteItem event) async*{
    try{
      yield CartLoading();
      _items.remove(event.cartItem.id.toString());
    }
    catch (e) {
      yield CartError();
    }
  }

}
