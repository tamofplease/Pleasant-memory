import 'package:flutter/material.dart';
import 'enums/category.dart';

class Choice {
  final int id;
  final String title;
  final String image;
  final int parents;

  Choice({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.parents
  })
  : assert(id != null),
    assert(title != null),
    assert(image != null),
    assert(parents != null);
}

List<Choice> memoryChoices = [
  Choice(
    id: 1,
    title: "行きたい場所",
    image: "assets/home/choice/find_mem.jpg",
    parents: Category.Memory.index,
  ),
  Choice(
    id: 2,
    title: "行った場所",
    image: "assets/home/choice/reg_mem.jpg",
    parents: Category.Memory.index,
  ),
  Choice(
    id: 3,
    title: "ユーザーを探す",
    image: "assets/home/choice/find_user.jpg",
    parents: Category.Find.index
  ),
  Choice(
    id: 4,
    title: "場所を探す",
    image: "assets/home/choice/find_place.jpg",
    parents: Category.Find.index,
  ),
  Choice(
    id: 6,
    title: "一覧",
    image: "assets/home/choice/garary.jpg",
    parents: Category.Memory.index,
  )
];


List<Choice> chatChoices = [
  Choice(
    id: 3,
    title: "新しく始める",
    image: "",
    parents: Category.Chat.index,
  ),
  Choice(
    id: 4,
    title: "友達と話す",
    image: "",
    parents: Category.Chat.index,
  ),
];

List<Choice> findChoices = [
  Choice(
    id: 5,
    title: "友達を探す",
    image: "",
    parents: Category.Find.index,
  ),
];
