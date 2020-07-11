import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/signin/signin.dart';
import 'package:meple/blocs/auth/auth.dart';
import 'package:meple/helper/splash_screen.dart';



class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}


class _LoginFormState extends State<LoginForm> {
  
  final _formKey = GlobalKey<FormState>();
  String email="";
  String password="";
  String error="";

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    final signInBloc = SignInBloc(signInRepository: FirebaseSignInRepository());
    return BlocBuilder<SignInBloc,SignInState>(
      bloc: signInBloc,
      builder: (context, state) {
        if(state is SignInLoading) {
          return SplashScreen();
        }
        if(state is SignInSuccess) {
          authBloc.add(LoggedIn());
        }
        if(state is SignInFailure) {
          error="無効な値です";
        }
        return Container(
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 25, 
                child: Text(
                  error,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.fromLTRB(16.0,0.0,16.0,16.0),
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter email",
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) {
                        if(val.isEmpty) return "メールアドレスを入力してください";
                        // else if(error.isNotEmpty)return "正しい値を入力してください";
                        return null;
                      },
                      onChanged: (val){
                        setState(() => email=val);
                      },
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) {                        
                        if(val.isEmpty)return "パスワードを入力してください";
                        // else if(error.isNotEmpty) return "正しい値を入力してください";
                        return null;
                      },
                      onChanged: (val) {
                        setState(() => password=val);
                      }
                    ),
                    const SizedBox(height: 10.0),
                    RaisedButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text("Login"),
                      onPressed: () {
                        if(_formKey.currentState.validate()) {
                          signInBloc.add(SignInWithEmailAndPassword(
                              email: email, 
                              password: password
                          ));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
        
    );
  }
}
