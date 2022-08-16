import 'package:flutter/material.dart';
import 'package:moltaqa_task/shared/styles/colors.dart';
import 'package:moltaqa_task/shared/styles/sizes.dart';
import 'package:moltaqa_task/shared/styles/styles.dart';


Widget formFeild({
  IconData? suffix,
  Color? suffixColor,
  IconData? prefix,
  required String txt,
  required bool isClikable,
  dynamic validate,
  Function(String)? onSubmit,
  Function()? onTap,
  TextEditingController? controller,
  TextInputType? type,
  VoidCallback? suffixPressed,
  InputBorder? focusedBorder,
  InputBorder? disabledBorder,
  bool? isPassword=false,
}) =>
    MaterialButton(
      onPressed: onTap,
      child: TextFormField(
        obscureText: isPassword!,
        autofocus: true,
        style: black14bold(),
        enabled: isClikable,
        controller: controller,
        validator: validate,
        onFieldSubmitted: onSubmit,
        keyboardType: type,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          prefixIconColor: primaryColor,
          suffixIconColor: blackColor,
          hintText: txt,
          contentPadding: EdgeInsets.zero,
          // contentPadding: const EdgeInsets.all(0.0),
          hintStyle:const TextStyle(fontFamily: 'Almarai',color: blackLColor,
            fontSize: 16.0, fontWeight: FontWeight.normal,),
          labelStyle: black14bold(),
          suffixIcon: suffix!= null ?IconButton(icon: Icon(suffix,color: suffixColor,),onPressed: suffixPressed,): null,
          prefixIcon: Icon(
            prefix,
            color: primaryColor,
          ),
        ),
      ),
    );

