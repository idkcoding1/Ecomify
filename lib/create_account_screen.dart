import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/login_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  Future<void> _createAccount(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'firstName': _firstNameController.text,
          'lastName': _lastNameController.text,
          'username': _usernameController.text,
          'email': _emailController.text,
          'gender': _genderController.text,
          'age': _ageController.text,
        });

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } catch (e) {
        print('Error: $e');
        // Display error message to the user
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                      MediaQuery.of(context).size.height * 0.10),
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  color: Color(0xffc47726),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.015,
                          child: Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.contain,
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height * 0.25,
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.25,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Create Your\nAccount',
                                style: TextStyle(
                                  fontFamily: 'SquadaOne',
                                  fontSize: 40,
                                  color: Color(0xff251a1a),
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: MediaQuery.of(context).size.height * 0.40,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildTextField(context, 'First Name', Icons.person,
                            _firstNameController),
                        SizedBox(height: 10.0),
                        _buildTextField(context, 'Last Name', Icons.person,
                            _lastNameController),
                        SizedBox(height: 10.0),
                        _buildTextField(context, 'Username',
                            Icons.account_circle, _usernameController),
                        SizedBox(height: 10.0),
                        _buildTextField(
                            context, 'Gender', Icons.person, _genderController),
                        SizedBox(height: 10.0),
                        _buildTextField(
                            context, 'Age', Icons.cake, _ageController),
                        SizedBox(height: 10.0),
                        _buildTextField(
                            context, 'Email', Icons.email, _emailController),
                        SizedBox(height: 10.0),
                        _buildTextField(context, 'Password', Icons.lock,
                            _passwordController,
                            isPassword: true),
                        SizedBox(height: 20.0),
                        _buildOrangeButton(context, 'Create Your Account',
                            () => _createAccount(context)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xffc47726),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            currentIndex: 2, // Set the current index to 2 for Cart
            onTap: (int index) {
              if (index == 0) {
                Navigator.pop(context); // Navigate back if Back is tapped
              } else if (index == 2) {
                // Do nothing, we are already in the cart page
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_back),
                label: 'Back',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              )
            ]));
  }

  Widget _buildTextField(BuildContext context, String labelText, IconData icon,
      TextEditingController _controller,
      {bool isPassword = false}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TextFormField(
        controller: _controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon),
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $labelText';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildOrangeButton(
      BuildContext context, String buttonText, Function() onPressed) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xffc47726)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(vertical: 19.0),
          ),
        ),
        child: Text(buttonText),
      ),
    );
  }
}
