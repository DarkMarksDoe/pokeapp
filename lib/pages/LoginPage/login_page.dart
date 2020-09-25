import 'package:flutter/material.dart';

import '../../calls/local_storage_API.dart';
import '../../models/factories/User/user_model.dart';
import '../HomePage/home_page.dart';
import 'validators/email_validator.dart';
import 'validators/password_validator.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

enum FormType {
  login,
  register,
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;

  signInWithEmailAndPassword(String email, String password) async {
    UserModel user = await LocalStorageApiCall().getUser();
    if (user == null) {
      _showSnackBar('User Doesnt Exists', Colors.red);
    } else if (user.email == email) {
      //user exists
      if (user.password == password) {
        LocalStorageApiCall().login();
        _showSnackBar('Welcome again $user', Colors.green);
        Navigator.of(context).pushReplacement(new MaterialPageRoute(
            builder: (BuildContext newContexts) => HomePage()));
      } else {
        _showSnackBar('Bad Password', Colors.red);
      }
    } else {
      _showSnackBar('User Doesnt Exists', Colors.red);
    }
  }

  createUserWithEmailAndPassword(String email, String password) {
    LocalStorageApiCall().signUpEmailPassword(email, password);
    _showSnackBar('Registered user: $email', Colors.green);

    Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: (BuildContext newContext) => HomePage()));
  }

  _showSnackBar(String text, Color color) {
    final snackBar = new SnackBar(
      content: new Text(text),
      backgroundColor: color,
    );
    _scaffoldState.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    _setAppInitialized();
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text('PokeLogin'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildInputs() + buildSubmitButtons(context),
          ),
        ),
      ),
    );
  }

  List<Widget> buildInputs() {
    return <Widget>[
      TextFormField(
        key: Key('email'),
        decoration: InputDecoration(labelText: 'Email'),
        validator: EmailValidator.validate,
        onSaved: (String value) => _email = value,
      ),
      TextFormField(
        key: Key('password'),
        decoration: InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: PasswordValidator.validate,
        onSaved: (String value) => _password = value,
      ),
    ];
  }

  List<Widget> buildSubmitButtons(BuildContext context) {
    if (_formType == FormType.login) {
      return <Widget>[
        RaisedButton(
          key: Key('signIn'),
          child: Text('Login', style: TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),
        FlatButton(
          child: Text('Create an account', style: TextStyle(fontSize: 20.0)),
          onPressed: moveToRegister,
        ),
      ];
    } else {
      return <Widget>[
        RaisedButton(
          child: Text('Create an account', style: TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),
        FlatButton(
          child:
              Text('Have an account? Login', style: TextStyle(fontSize: 20.0)),
          onPressed: moveToLogin,
        ),
      ];
    }
  }

  _setAppInitialized() async {
    await LocalStorageApiCall().setJustInstalled();
  }

  bool validateAndSave() {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          await signInWithEmailAndPassword(_email, _password);
        } else {
          await createUserWithEmailAndPassword(_email, _password);
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }
}
