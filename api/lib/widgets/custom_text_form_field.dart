import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final InputBorder? errorBorder;
  final int? maxLines;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLength;
  const AppTextFormField({
    Key? key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.prefixIcon,
    this.focusNode,
    this.controller,
    this.validator,
    this.onChanged,
    this.errorBorder,
    this.maxLines,
    this.readOnly = false,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TextFormField(
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      readOnly: readOnly,
      maxLines: maxLines,
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xffD8DADC), width: 1.3),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xffD8DADC), width: 1),
            ),
        errorBorder:
            errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colorScheme.error, width: 1),
            ),
        focusedErrorBorder:
            errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colorScheme.error, width: 1),
            ),
        hintStyle: hintStyle ?? TextStyle(fontSize: 16),
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: Colors.white,
        filled: true,
      ),
      focusNode: focusNode,
      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? TextStyle(fontSize: 16),
    );
  }
}
