import 'package:bloc/bloc.dart';
import 'package:meple/blocs/category/category.dart';
import 'package:meple/models/enums/category.dart';

class CategoryBloc extends Bloc<CategoryEvent, Category> {
  
  @override
  Category get initialState => Category.Memory;

  @override
  Stream<Category> mapEventToState(
    CategoryEvent event,
  ) async* {
    if(event is MemoryEvent) {
      yield Category.Memory;
    }else if(event is ChatEvent) { 
      yield Category.Chat;
    }else if(event is FindEvent) { 
      yield Category.Find;
    }
  }

}