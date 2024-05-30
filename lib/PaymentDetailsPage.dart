import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/cart_management.dart';
import 'package:project/shipping_details_page.dart';

class PaymentDetailsPage extends StatefulWidget {
  @override
  _PaymentDetailsPageState createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _paymentData = {
    'cardNumber': '',
    'expiryDate': '',
    'cvv': '',
    'phoneNumber': '',
  };
  String _paymentMethod = 'Card';

  void _submitPayment() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ShippingDetailsPage()),
      );
    }
  }

  Widget _buildTextField(String label, String key) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
      onSaved: (value) {
        _paymentData[key] = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
        backgroundColor: Color(0xffc47726),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Select Payment Method",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: const Text('Credit / Debit Card'),
                leading: Radio<String>(
                  value: 'Card',
                  groupValue: _paymentMethod,
                  onChanged: (String? value) {
                    setState(() {
                      _paymentMethod = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('JazzCash'),
                leading: Radio<String>(
                  value: 'JazzCash',
                  groupValue: _paymentMethod,
                  onChanged: (String? value) {
                    setState(() {
                      _paymentMethod = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Cash on Delivery'),
                leading: Radio<String>(
                  value: 'Cash',
                  groupValue: _paymentMethod,
                  onChanged: (String? value) {
                    setState(() {
                      _paymentMethod = value!;
                    });
                  },
                ),
              ),
              if (_paymentMethod == 'Card') ...[
                _buildTextField('Card Number', 'cardNumber'),
                SizedBox(height: 16.0),
                _buildTextField('Expiry Date', 'expiryDate'),
                SizedBox(height: 16.0),
                _buildTextField('CVV', 'cvv'),
                SizedBox(height: 24.0),
              ] else if (_paymentMethod == 'JazzCash') ...[
                _buildTextField('Phone Number', 'phoneNumber'),
                SizedBox(height: 24.0),
              ],
              ElevatedButton(
                onPressed: _submitPayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffc47726), // background
                  foregroundColor: Colors.white, // foreground
                ),
                child: Text('Proceed to Shipping'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
