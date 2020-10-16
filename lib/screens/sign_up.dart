import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;

  SignUp({this.toggleView});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController usernameEditingController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App'),
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
              Spacer(),
              Text(
                "Sign Up",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: usernameEditingController,
                keyboardType: TextInputType.text,
                obscureText: false,
                decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: '',
                    border: InputBorder.none),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Username can\'t be empty';
                  }
                  return null;
                },
                onSaved: (value) {},
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: emailEditingController,
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
                controller: passwordEditingController,
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
              FlatButton(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20.0,
                ),
                onPressed: () {},
                child: Text(
                  'Sign Up',
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
                    "Already have an account? ",
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.toggleView();
                    },
                    child: Text(
                      "Sign In now",
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
