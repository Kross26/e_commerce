part of 'cart_bloc.dart';

// define una clase que todos los eventos relacionados con el carrito deben extender.
// extends Equatable hace que CartEvent herede de Equatable, lo que facilita la comparación de instancias.
class CartEvent extends Equatable {
  // es un constructor constante, lo que significa que todas las instancias de CartEvent son inmutables.
  const CartEvent();

  // es una lista de propiedades que se utiliza para comparar instancias de eventos.
  @override
  List<Object> get props => [];
}

// este evento se usa para agregar un producto al carrito.
class AddProductToCart extends CartEvent {
  // contiene el producto que se añadirá al carrito.
  final ProductDetail product;
  // es un constructor constante que inicializa la propiedad product.
  const AddProductToCart(this.product);
  // sobrescribe la lista de propiedades de CartEvent. Aquí, props incluye solo el product,
  // lo que significa que dos instancias de AddProductToCart se consideran iguales si tienen el mismo product.
  @override
  List<Object> get props => [product];
}
