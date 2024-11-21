import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? hintText;
  final Widget? prefix;
  final Widget? subfix;
  final dynamic obscureText;
  final dynamic lebalText;

  final FormFieldValidator<String>? validator;
  const CustomTextFormField({super.key,
 required this.controller,
    this.lebalText,
  this .textInputType = TextInputType.text,
  this.hintText,
  this.prefix,
  this.validator,
    this.subfix,
    this.obscureText
  }) ;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child:

        TextFormField(

          controller: widget.controller,
          decoration:  InputDecoration(

            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff999999),width: 1.2),
            ),
            hintText: widget.hintText,
            label: widget.lebalText,
            hintStyle:  TextStyle(

            color: Color(0xff222222),
                fontFamily: 'Tajawal',

           ),

            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 50),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),

            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            focusedBorder: const OutlineInputBorder(

              borderSide: BorderSide(color: Color(0xff095372)),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),



            prefixIcon: widget.prefix,

          ), // textInputAction: textInputAction,
          keyboardType: widget.textInputType,

          validator: widget.validator,
          obscureText: widget.obscureText == null ? false : widget.obscureText,
        ),
      );
  }
}