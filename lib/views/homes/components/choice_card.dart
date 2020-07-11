import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:meple/helper/coming_soon_with_btn.dart';
import 'package:meple/models/choice.dart';
// import 'package:meple/screens/details/details_screen.dart';

class ChoiceCard extends StatelessWidget {
  final Choice choice;

  const ChoiceCard({Key key, this.choice}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: OpenContainer(
        closedElevation: 0,
        openElevation: 0,
        closedBuilder: (context, action) => buildChoiceCard(context),
        openBuilder: (context, action) => ComingSoonWithBtn(1.0, choice.image),
      ),
    );
  }

  Column buildChoiceCard(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0 / 2),
          child: Text(
            choice.title,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                color: Colors.black26,
              )],
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(choice.image),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
