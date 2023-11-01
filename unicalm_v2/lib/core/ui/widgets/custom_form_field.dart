import 'package:flutter/material.dart';
import 'package:unicalm_v2/core/ui/styles/constants.dart';
import 'package:unicalm_v2/core/ui/styles/text_style.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType? type;
  final bool isObscure;
  final String? Function(String?)? validator;
  final Widget? suffix;

  const CustomFormField({
    super.key,
    required this.label,
    this.isObscure = false,
    this.controller,
    this.validator,
    this.type,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      controller: controller,
      validator: validator,
      keyboardType: type,
      obscureText: isObscure,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: TxtStyle.instance.textRegular16.copyWith(
          color: ColorsConstants.secondaryColor,
        ),
        suffix: suffix,
      ),
    );
  }
}
