import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat App',
        ),
        centerTitle: false,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 18.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                decoration: InputDecoration(
                    labelText: 'Email', hintText: '', border: InputBorder.none),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email can\'t be empty';
                  }
                  return null;
                },
                onSaved: (value) {},
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: _isPasswordHidden,
                decoration: InputDecoration(
                  hintText: '',
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordHidden
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isPasswordHidden = !_isPasswordHidden;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password can\'t be empty';
                  } else if (value.length < 8) {
                    return 'Password can\'t be less than 8 characters';
                  }
                  return null;
                },
                onSaved: (value) {},
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8.0,
                      ),
                      child: Text(
                        "Forgot Password?",
                      )),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              FlatButton(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20.0,
                ),
                onPressed: () {},
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have account? ",
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.toggleView();
                    },
                    child: Text(
                      "Register now",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
