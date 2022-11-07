import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Input extends StatelessWidget {
  final TextEditingController ctl;
  final String? label;
  final TextInputAction action;
  final FocusScopeNode? scopeNode;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final Function? onEditingComplete;
  final TextInputType keyboardType;
  final bool obscureText;
  final int maxLine;
  final double borderRadius;
  final String? hintText;
  final Widget? suffix;

  const Input({
    Key? key,
    required this.ctl,
    required this.action,
    required this.keyboardType,
    required this.borderRadius,
    this.label,
    this.scopeNode,
    this.onSubmitted,
    this.onChanged,
    this.hintText,
    this.obscureText = false,
    this.maxLine = 1,
    this.onEditingComplete,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      // cursorColor: MyTheme.mainColor,
      cursorHeight: 24,
      cursorRadius: const Radius.circular(10),
      cursorWidth: 2,
      showCursor: true,
      controller: ctl,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLine,
      decoration: InputDecoration(
        hintText: hintText,
        // hintStyle: TextStyle(color: const Color.fromRGBO(197, 197, 197, 1.0)),
        // 输入文本是否默认带间距，true：内容有默认内边距
        isCollapsed: true,
        labelText: label,
        // labelStyle: const TextStyle(color: MyTheme.grayColor),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
        suffix: suffix,
      ),
      onSubmitted: onSubmitted,
      onEditingComplete: () {
        if (onEditingComplete != null) {
          onEditingComplete!();
        }
        scopeNode?.nextFocus();
      },
      onChanged: onChanged,
      textInputAction: action,
    );
  }

  InputBorder _buildBorder() => borderRadius > 0
      ? OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          borderSide: BorderSide(
            // color: MyTheme.grayColor,
            width: 2.w,
          ),
        )
      : InputBorder.none;
}
