import 'package:flutter/material.dart';
import 'package:moltaqa_task/shared/styles/colors.dart';
import 'package:moltaqa_task/shared/styles/sizes.dart';

/// Button
class DefaultButton extends StatelessWidget {
  final Function() onTap;
  final String text;
   const DefaultButton({Key? key, required this.onTap, required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getHeight(context)/12,
      clipBehavior:Clip.antiAliasWithSaveLayer ,
      decoration:  BoxDecoration(
        gradient:const LinearGradient(
            colors: [
              primaryColor,
              primaryLColor,
            ],
            begin: Alignment.topLeft, //begin of the gradient color
            end: Alignment.bottomRight, //end of the gradient color
            stops: [.3, 0.6,] //stops for individual color
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: MaterialButton(
        onPressed:
          onTap,
         child: Text(text,style:const TextStyle(
           fontFamily: 'Almarai',
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: whiteColor,
        ) ,
         ),
      ),
    );
  }
}

