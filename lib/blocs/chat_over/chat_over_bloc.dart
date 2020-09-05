import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/chat_over/chat_over.dart';
import 'package:meple/blocs/index/index.dart';

class ChatOverBloc extends Bloc<ChatOverEvent, ChatOverState> {
  final ChatOverRepository _chatOverRepo;

  ChatOverBloc(this._chatOverRepo);

  @override
  get initialState => ChatOverInitial();
  Stream<ChatOverState> mapEventToState(
    ChatOverEvent event,
  ) async* {
    if (event is ChatOverLoading) {
      _mapChatOverLoadingToState(event.uid);
    } else if (event is ChatOverInitialize) {
      yield ChatOverInitial();
    }
  }

  Stream<ChatOverState> _mapChatOverLoadingToState(String uid) {}
}
