import 'package:flutter/material.dart';

class ListItem {
  final String firstRowText;
  final String secondRowText;
  final String thirdRowText;
  final String forthRowText;
  final String imagePath;
  final bool isLocalImage;
  //Listitem Unique Id
  final String listItemId;

  ListItem(
      {this.firstRowText = "",
      this.secondRowText = "",
      this.thirdRowText = "",
      this.forthRowText = "",
      this.imagePath = "",
      this.isLocalImage = false,
      this.listItemId = ""});
}
