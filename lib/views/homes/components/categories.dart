import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meple/blocs/category/category.dart';


// We need stateful widget because we need to change some sate on our category
class Categorylist extends StatefulWidget {
  @override
  _CategorylistState createState() => _CategorylistState();
}

class _CategorylistState extends State<Categorylist> {
  int selectedCategory = 0;
  List<String> categories = ["思い出", "会話", "探す"];
  @override
  Widget build(BuildContext context) {
    final categoryBloc = BlocProvider.of<CategoryBloc>(context);
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 20.0 / 2),
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index, context, categoryBloc),
      ),
    );
  }

  Widget buildCategory(int index, BuildContext context, CategoryBloc bloc) {  
    CategoryEvent _selectedEvent = index == 0 ? MemoryEvent() : (index == 1) ? ChatEvent() : FindEvent();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: GestureDetector(
          onTap: () {
            bloc.add(_selectedEvent);
            setState(() {
              selectedCategory = index;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                categories[index],
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.w600,
                      color: index == selectedCategory
                          ? Color(0xFF12153D)
                          : Colors.black.withOpacity(0.4),
                    ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0 / 2),
                height: 6,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: index == selectedCategory
                      ? Color(0xFFFCC419)
                      : Colors.transparent,
                ),
              )
            ],
          ),
        ),
    );
  }
}
