import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchView extends StatefulWidget {
  // navegation gorouter
  static const String name = 'search_view';

  const SearchView({super.key});

  @override
  SearchViewState createState() => SearchViewState();
}

// variables to be used later
class SearchViewState extends State<SearchView> {
  late String _productId;
  late String _productName;
  late String _productImage;
  bool _isLoading = false; // Add loading state variable

// state variables
  @override
  void initState() {
    super.initState();
    _productId = '';
    _productName = '';
    _productImage = '';
  }

  // interface user
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: GestureDetector(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  // textField where the user can enter the product ID
                  decoration: const InputDecoration(
                    hintText: 'Enter ID',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                    labelText: 'Product ID',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _productId = value;
                    });
                  },
                ),
              ),
              ElevatedButton(
                // elevatedButton 'search' that calls _fetchProductDetails() when pressed.
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.deepPurpleAccent),
                ),

                // si la funcion _isloading es "false" se establece como _fetchProductDetails
                onPressed: _isLoading
                    ? null
                    : _fetchProductDetails, // pero si es "true" el boton de la funcion on pressed es "null" se deshabilita, mientras entra en un estado de carga
                child: _isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      ) // se muestra si _isloading es "true"
                    : const Text(
                        // se muestra si _isloading es "false"
                        'Search',
                        style: TextStyle(color: Colors.white),
                      ),
              ),
              const SizedBox(height: 20),
              if (_productName.isNotEmpty)
                Center(
                  child: Column(
                    children: [
                      Text(
                        // Shows the product name and product image if available
                        'Product Name: \n'
                        '$_productName',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 20),
                      if (_productImage.isNotEmpty)
                        SizedBox(child: Image.network(_productImage))
                      else
                        const SizedBox(),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // method that makes an HTTP request to the API
  Future<void> _fetchProductDetails() async {
    if (_productId.isEmpty) {
      // checks if the product ID is empty and shows an error dialog if so
      _showErrorDialog('Please enter ID');
      return;
    }

    setState(() {
      _isLoading = true; // Set loading state to true when starting the request
    });

    try {
      final response = await http.get(Uri.parse(
          'https://api.spoonacular.com/food/products/$_productId?apiKey=c2586dd5afe747eda9f45412406ef8bc'));

      if (response.statusCode == 200) {
        // If the request is successful, update the state variables
        final Map<String, dynamic> productDetails = jsonDecode(response.body);
        setState(() {
          // state variables update
          _productName = productDetails['title'];
          _productImage = productDetails['image'];
        });
        // If the request fails, show an error dialog
      } else {
        _resetProductDetails();
        throw Exception('Failed to load product');
      }
    } catch (e) {
      _resetProductDetails();
      _showErrorDialog('Failed to load product');
    } finally {
      setState(() {
        _isLoading =
            false; // Set loading state to false when request is completed
      });
    }
  }

  // method resets the _productName and _productImage state variables to empty values.
  void _resetProductDetails() {
    setState(() {
      _productName = '';
      _productImage = '';
    });
  }

  // this method show error dialog (widget AlertDialog)
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
