import 'package:flutter/material.dart';
import 'package:meple/blocs/find_user/find_user_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/find_user/find_user.dart';
import 'package:meple/models/user.dart';
import 'package:provider/provider.dart';
import 'package:meple/blocs/follow/follow.dart';

class FinderUserSuccessFrom extends StatelessWidget {
  final User user;
  final String uid;
  FinderUserSuccessFrom(this.user, this.uid);

  void showUser(BuildContext context, String uidTo) {
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
                      backgroundImage: user.profileWithBackgroundImage(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        user.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                user.uid == Provider.of<String>(context)
                    ? BlocBuilder<FollowBloc, FollowState>(
                        builder: (context, state) {
                          if (state is InitialFollowState) {
                            Container(child: Text("init"));
                          } else if (state is UserFindState) {
                            return Container(
                              height: 30,
                              child: RaisedButton(
                                color: Colors.blue,
                                shape: StadiumBorder(
                                  side: BorderSide(color: Colors.white),
                                ),
                                onPressed: () =>
                                    BlocProvider.of<FollowBloc>(context)
                                        .add(UnFollowUserEvent(uid, uidTo)),
                                child: Text("フォロー済み"),
                              ),
                            );
                          } else if (state is UserUnFindState) {
                            return Container(
                              height: 30,
                              child: RaisedButton(
                                color: Colors.white,
                                shape: StadiumBorder(
                                  side: BorderSide(color: Colors.blue),
                                ),
                                onPressed: () =>
                                    BlocProvider.of<FollowBloc>(context)
                                        .add(FollowUserEvent(uid, uidTo)),
                                child: Text("フォローする"),
                              ),
                            );
                          }
                          return Container();
                        },
                      )
                    : Container(),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text("戻る"),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String uidTo = user.uid;
    BlocProvider.of<FollowBloc>(context).add(CheckUserFollowd(uid, uidTo));
    BlocProvider.of<FindUserBloc>(context).add(FindUserInitialize());
    Future.delayed(Duration.zero, () => showUser(context, uidTo));
    return Container();
  }
}
