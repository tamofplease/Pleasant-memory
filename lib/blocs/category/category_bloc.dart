import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meple/blocs/category/category_event.dart';
import 'package:meple/blocs/category/category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  
  @override
  CategoryState get initialState => SelectedChat();

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if(event is ChatEvent) {
      yield SelectedChat();
    }else if(event is MemoryEvent) { 
      yield SelectedMemory();
    }else if(event is FindEvent) { 
      yield SelectedFind();
    }
  }

}