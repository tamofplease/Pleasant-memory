import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/bloc/auth_bloc.dart';
import 'package:meple/blocs/bloc/signin_bloc.dart';
import 'package:meple/blocs/event/auth_event.dart';
import 'package:meple/blocs/event/signin_event.dart';
import 'package:meple/blocs/repository/signin_repository.dart';
import 'package:meple/blocs/state/signin_state.dart';
// import 'package:meple/helper/splash_screen.dart';


class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}


class _SignupFormState extends State<SignupForm> {
 
  final _formKey = GlobalKey<FormState>();
  String email="";
  String password="";
  String passwordConfirm="";

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    final signInBloc = SignInBloc(signInRepository: FirebaseSignInRepository());
    return BlocBuilder<SignInBloc, SignInState>(
      bloc: signInBloc,
      builder: (context, state) {

        if(state is SignInLoading) {
          
        }

        if(state is SignInSuccess) {
          authBloc.add(LoggedIn());
        }

        if(state is SignInFailure) {

        }

        return  Container(
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter email",
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) => val.isEmpty ?  "Emailを入力してください" : null,
                  onChanged: (val) {
                    setState(() => email=val);
                  }
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) => val.length < 6 ? "パスワードは6文字以上にしてください" : null,
                  onChanged: (val) {
                    setState(() => password=val);
                  }
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Confirm password",
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) => val != password ? "パスワードを正しく入力してください" : null,
                  onChanged: (val) {
                    setState(() => passwordConfirm=val);
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
                  child: Text("Signup"),
                  onPressed: () {
                    if(_formKey.currentState.validate()){
                      print(password);
                      signInBloc.add(CreateUserWithEmailAndPassword(email: email, password: password));
                    }
                  },
                ),
              ],
            ),
          ),
        );
      }
      
    );
  }
}