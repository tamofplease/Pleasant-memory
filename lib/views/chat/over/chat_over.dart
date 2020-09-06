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
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.grey,
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage("assets/home/choice/find_mem.jpg"),
        ),
      ),
      child:
          BlocBuilder<ChatOverBloc, ChatOverState>(builder: (context, state) {
        if (state is ChatOverInitial) {
          return CircularProgressIndicator();
        } else if (state is ChatOverLoaded) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 100,
                child: Card(
                    color: Colors.white70,
                    shadowColor: Colors.black,
                    elevation: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(state.rooms[index].photoUrl),
                        ),
                        Text(
                          state.rooms[index].name,
                        ),
                      ],
                    )),
              );
            },
            itemCount: state.rooms.length,
          );
        }
        return Container(child: Text("else"));
      }),
    );
  }
}
