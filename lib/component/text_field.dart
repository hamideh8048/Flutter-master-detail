import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// final String hintText;
// final Function() onChanged;
// final bool? hidePassword;
// final Function()? suffixIconOnpress;
// final bool? isObscure;
// const TextFieldWidget({
//   Key? key,
//   required this.hintText,
//   required this.onChanged,
//   this.hidePassword=true,
//   this.suffixIconOnpress,
//   this.isObscure = true,
// }) : super(key: key);

class TextFieldWidget extends StatefulWidget {
  final String hintText;
  final Function() onChanged;
  final bool showPassword;
  final bool keyType;
  final  TextEditingController? controller;
  const TextFieldWidget({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.showPassword,
    required this.keyType,
    this.controller
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType:
          widget.keyType == true ? TextInputType.number : TextInputType.text,
      onChanged: widget.onChanged(),
      obscureText: widget.showPassword == true ? hidePassword : !hidePassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: widget.hintText,
        suffixIcon: widget.showPassword == true
            ? IconButton(
                icon: hidePassword
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
              )
            : null,
      ),
    );
  }
}
