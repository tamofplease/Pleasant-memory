import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/bloc/auth_bloc.dart';
import 'package:meple/blocs/event/auth_event.dart';

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Center(
      child: Column(
        children: <Widget>[
          Text("EventList"),
          RaisedButton(
            child: Text("LoggedOut"),
            onPressed: () {
              authenticationBloc.add(LoggedOut());
            }
          )
        ],
      )

    );
  }
}