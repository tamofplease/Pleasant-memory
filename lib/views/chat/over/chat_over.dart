import 'package:flutter/material.dart';
import 'package:meple/blocs/chat_over/chat_over.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ChatOver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ChatOverBloc>(context)
        .add(ChatOverLoading(Provider.of<String>(context)));
    return Container(
      height: 100,
      child:
          BlocBuilder<ChatOverBloc, ChatOverState>(builder: (context, state) {
        if (state is ChatOverInitial) {
          return CircularProgressIndicator();
        } else if (state is ChatOverLoaded) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(state.rooms[index].photoUrl),
                  ),
                  Text(state.rooms[index].name),
                ],
              ));
            },
            itemCount: state.rooms.length,
          );
        }
        return Container(child: Text("else"));
      }),
    );
  }
}
