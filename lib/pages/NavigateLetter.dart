import 'package:flutter/material.dart';
import 'package:sanabelsecondexercice/pages/DragToBoxExercice.dart';


class NavigateLetter {
  final String letter;

  NavigateLetter({@required this.letter});

  redirectToExercice() {
    
      return DragToExercice(subQuestion: letter); // 7 cards and 4 boxes only Ba
  
     
   
  }
}
