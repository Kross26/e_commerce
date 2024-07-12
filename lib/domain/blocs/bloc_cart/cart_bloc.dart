import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:e_commerce/ui/screens.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    // registrar el manejador del evento AddProductToCart
    on<AddProductToCart>(_onAddProductToCart);
  }

  // método manejador del evento AddProductToCart
  void _onAddProductToCart(AddProductToCart event, Emitter<CartState> emit) {
    final updatedProducts = List<ProductDetail>.from(state.products)
      ..add(event.product);
    emit(CartUpdated(updatedProducts));
  }
}
