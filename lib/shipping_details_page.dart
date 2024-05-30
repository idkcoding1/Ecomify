import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/cart_management.dart';
import 'package:project/main_screen.dart';

class ShippingDetailsPage extends StatefulWidget {
  @override
  _ShippingDetailsPageState createState() => _ShippingDetailsPageState();
}

class _ShippingDetailsPageState extends State<ShippingDetailsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {
    'fullName': '',
    'addressLine1': '',
    'addressLine2': '',
    'city': '',
    'state': '',
    'postalCode': ''
  };

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Show a SnackBar with the success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Order Successful'),
          duration: Duration(seconds: 2),
        ),
      );

      // Clear the cart
      Provider.of<Cart>(context, listen: false).clearCart();

      // Navigate back to the main screen
      Navigator.popUntil(context, ModalRoute.withName('/'));
    }
  }

  Widget _buildTextField(String label, String key) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Color(0xffc47726),
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xffc47726), width: 2.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
      onSaved: (value) {
        _formData[key] = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shipping Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xffc47726),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextField('Full Name', 'fullName'),
              SizedBox(height: 16.0),
              _buildTextField('Address Line 1', 'addressLine1'),
              SizedBox(height: 16.0),
              _buildTextField('Address Line 2', 'addressLine2'),
              SizedBox(height: 16.0),
              _buildTextField('City', 'city'),
              SizedBox(height: 16.0),
              _buildTextField('State', 'state'),
              SizedBox(height: 16.0),
              _buildTextField('Postal Code', 'postalCode'),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: Color(0xffc47726),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'SUBMIT',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
