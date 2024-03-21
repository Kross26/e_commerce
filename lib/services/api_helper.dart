import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:e_commerce/services/api_service.dart';
import 'package:quickalert/quickalert.dart';
import '../domain/entities/product_detail.dart';

class ApiHelper {
  static Future<List<ProductDetail>> getProduct(BuildContext context) async {
    try {
      final response = await http
          .get(Uri.parse(productUrl)); // hace la solicitud HTTP a la API
      final data = jsonDecode(
          response.body); // se codifica la respuesta utilizando jsonDecode
      print("data: $data");
      // se utiliza el map en la lista de datos decodificados para convertir cada elemento en un objeto "ProductDetail"
      // utilizando fromJson, luego se convierte en una lista utilizando "toList" y se devuelve como funcion "_getProduct"
      return data.map<ProductDetail>((e) => ProductDetail.fromJson(e)).toList();
    } catch (e) {
      print("error: $e");
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: 'error: $e',
      );
      rethrow;
    }
  }

  static Future<List<String>> getProductCategory(BuildContext context) async {
    try {
      String url = "https://fakestoreapi.com/products/categories";
      final response =
          await http.get(Uri.parse(url)); // hace la solicitud HTTP a la API
      final data = jsonDecode(
          response.body); // se codifica la respuesta utilizando jsonDecode
      return data.map<String>((e) => e.toString()).toList();
    } catch (e) {
      print("error: $e");
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: 'error: $e',
      );
      rethrow;
    }
  }
}
