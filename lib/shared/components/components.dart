import 'package:flutter/material.dart';




///enum for snackBar
enum SnackBarStates{SUCCESS , ERROR ,WARNING}

Color? chooseSnackBarColor(SnackBarStates state){
  Color color;
  switch(state){
    case SnackBarStates.SUCCESS :
      color= Colors.green;
      break ;
    case SnackBarStates.ERROR :
      color= Colors.red;
      break ;
    case SnackBarStates.WARNING :
      color= Colors.amber;
      break ;

  }
  return color;
}

///Navigate.push
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

///Navigate And Remove
void navigateAndFinish(context, widget) =>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
        // return false,
        (route) {
      return false;
    });



