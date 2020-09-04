import 'package:flutter/material.dart';
import 'package:meple/blocs/find_user/find_user_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/find_user/find_user.dart';
import 'package:meple/models/user.dart';

class FinderUserSuccessFrom extends StatelessWidget {
  final User user;
  FinderUserSuccessFrom(this.user);
  void showUser(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: Text("以下のユーザーが見つかりました"),
                content: Card(
                    shadowColor: Colors.grey,
                    elevation: 10.0,
                    child: Container(
                      height: 110,
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    user.profileWithBackgroundImage(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(user.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 30,
                            child: RaisedButton(
                              color: Colors.white,
                              shape: StadiumBorder(
                                side: BorderSide(color: Colors.blue),
                              ),
                              onPressed: () => print("follow"),
                              child: Text("フォローする"),
                            ),
                          )
                        ],
                      ),
                    )),
                actions: <Widget>[
                  FlatButton(
                    child: const Text("戻る"),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ]));
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FindUserBloc>(context).add(FindUserInitialize());
    Future.delayed(Duration.zero, () => showUser(context));
    return Container();
  }
}
