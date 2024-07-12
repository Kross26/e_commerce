part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<ProductDetail> products;

  const CartState({this.products = const []});

  @override
  List<Object> get props => [];
}

// define una subclase de CartState que representa un estado específico donde el carrito ha sido actualizado.
class CartUpdated extends CartState {
  // es un constructor constante que llama al constructor de CartState con una lista de productos.
  // este constructor inicializa la propiedad products con la lista proporcionada.
  const CartUpdated(List<ProductDetail> products) : super(products: products);
}
