import 'package:flutter/material.dart';
import 'package:prayer_hybrid_app/utils/app_colors.dart';
import 'package:prayer_hybrid_app/utils/asset_paths.dart';

class CustomTextFormField extends StatelessWidget {
  double containerWidth,borderRadius,contentPaddingTop,contentPaddingBottom,contentPaddingLeft,contentPaddingRight,prefixIconWidth,suffixIconWidth;
  String hintText,prefixIcon,suffixIcon;
  bool obscureText;
  TextEditingController textController;
  Function(String) onValidate;
  int errorMaxLines;

  CustomTextFormField({this.textController,this.containerWidth,this.hintText,this.borderRadius,this.contentPaddingTop,this.contentPaddingBottom,this.contentPaddingLeft,this.contentPaddingRight,this.prefixIcon,this.prefixIconWidth,this.suffixIcon,this.suffixIconWidth,this.obscureText,this.errorMaxLines,this.onValidate});



  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*containerWidth,
      child: TextFormField(
        controller: textController,
        validator: onValidate,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: AppColors.WHITE_COLOR)
          ),

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: AppColors.WHITE_COLOR)
          ),
          errorBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: AppColors.ERROR_COLOR,width: 1.5)
          ),

          focusedErrorBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: AppColors.ERROR_COLOR,width: 1.5)
          ),


          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 17.0,
            color: AppColors.WHITE_COLOR,
            fontWeight: FontWeight.w400,
          ),
          errorStyle: TextStyle(
            fontSize: 13.0,
            color:  AppColors.ERROR_COLOR,
            fontWeight: FontWeight.w600,
          ),
          contentPadding: EdgeInsets.only(top: contentPaddingTop ?? 15.0,bottom: contentPaddingBottom ?? 15.0,left: contentPaddingLeft ?? 14.0,right: contentPaddingRight ?? 14.0),
          prefixIcon: prefixIcon != null ?
          Padding(
            padding: EdgeInsets.only(left: 16.0,right: 14.0),
              child: Image.asset(prefixIcon,width: prefixIconWidth)
          )
          :
           null,
          prefixIconConstraints: BoxConstraints(),

          suffixIcon: suffixIcon != null ?
          Padding(
            padding: EdgeInsets.only(right: 14.0),
              child: Image.asset(suffixIcon,width: suffixIconWidth)
          )
          :
             null,
          suffixIconConstraints: BoxConstraints(),
          errorMaxLines: errorMaxLines ?? 1
        ),
        style: TextStyle(
          fontSize: 17.0,
          color: AppColors.WHITE_COLOR,
          fontWeight: FontWeight.w600,
        ),
        keyboardType: TextInputType.emailAddress,
        obscureText: obscureText ?? false,
        cursorColor: Colors.white,
      ),
    );
  }
}
