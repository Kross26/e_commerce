// se define la clase que que posee esas propiedades
class ProductDetail {
  final int id;
  final String title;
  final String description;
  final dynamic price;
  final String category;
  final String image;
  final Rating rating;
// constructor de la clase que toma argumentos "required"
// para inicializar una instancia 'ProductDetail.'
  ProductDetail({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    required this.rating,
  });
// toma un Json que convierte en una instancia de "ProductDetail"
  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      category: json['category'],
      image: json['image'],
      rating: Rating(
        rate: json['rating']['rate'],
        count: json['rating']['count'],
      ),
    );
  }
}

// clase que representa la clasificacion del producto, rate (tasa calificacion) y count (cantidad de calificacion)
class Rating {
  final dynamic rate;
  final int count;

  Rating({required this.rate, required this.count});
}
