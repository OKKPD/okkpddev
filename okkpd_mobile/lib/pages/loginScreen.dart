import 'package:flutter/material.dart';
import 'package:okkpd_mobile/model/repository/login_repo.dart';
import 'package:okkpd_mobile/pages/homeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // @override
  // void initState() {
  //   checkLogin();
  //   super.initState();
  // }

  // checkLogin() async{
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     if(prefs.getString("loginFolder") != null){
        
  //     }
  //     return;
  //   }
 var _usernameController = TextEditingController();
 var _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Future loginProcess() async { 
//      Future<bool> resultLogin = LoginRepo().loginProcess(_usernameController.text, _passwordController.text);
//      if(await resultLogin == true){
       Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
//      }else{
//      }
    }

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: _usernameController,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: _passwordController,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            loginProcess();
          },
          color: Colors.lightBlueAccent,
          child: Text('Log In', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );
    final signupLabel = FlatButton(
      child: Text(
        'Sign Up',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 8.0),
            loginButton,
            forgotLabel,
            signupLabel
          ],
        ),
      ),
    );
  }
}
