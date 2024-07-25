import 'package:demo_app/core/constants/color_constant.dart';
import 'package:demo_app/core/utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomEditText extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool isMandatory;
  final bool showLabel;
  final bool readOnly;
  final bool isNumeric;
  final bool isEmail;
  final int minLines;
  final int maxLines;
  final int? maxLength;
  final bool showIcon;
  final bool isPasswordField;
  final bool isCapitalize;

  const CustomEditText({
    super.key,
    required this.controller,
    required this.hint,
    this.isMandatory = true,
    this.showLabel = true,
    this.readOnly = false,
    this.isNumeric = false,
    this.isEmail = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength,
    this.showIcon = false,
    this.isPasswordField = false,
    this.isCapitalize = false,
  });

  @override
  State<CustomEditText> createState() => _CustomEditTextState();
}

class _CustomEditTextState extends State<CustomEditText> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        child: TextFormField(
          controller: widget.controller,
          readOnly: widget.readOnly,
          obscureText: widget.isPasswordField ? obscureText : false,
          inputFormatters: [
            if (widget.isNumeric) FilteringTextInputFormatter.digitsOnly,
          ],
          keyboardType: widget.isNumeric
              ? TextInputType.number
              : widget.isEmail
                  ? TextInputType.emailAddress
                  : TextInputType.text,
          textCapitalization: widget.isCapitalize == true
              ? TextCapitalization.characters
              : TextCapitalization.none,
          validator: (value) {
            if (!widget.isMandatory && widget.isEmail) {
              if (widget.controller.text.isEmpty) {
                return null;
              } else if (widget.isEmail &&
                  !CommonUtils.isEmailValid(widget.controller.text)) {
                return "Please enter valid email id";
              }
              return null;
            } else if (!widget.isMandatory ||
                widget.controller.text.isNotEmpty) {
              if (widget.isEmail &&
                  !CommonUtils.isEmailValid(widget.controller.text)) {
                return "Please enter valid email id";
              }
              return null;
            } else {
              return "Please enter ${widget.hint}";
            }
          },
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          onTap: () async {
            if (widget.showIcon) {}
          },
          style: TextStyle(
            color: AppColors().darkBlue,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
          decoration: InputDecoration(
            suffixIcon: widget.isPasswordField
                ? IconButton(
                    onPressed: () async {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off),
                  )
                : null,
            hintText: widget.hint,
            alignLabelWithHint: true,
            labelText: widget.showLabel ? widget.hint : null,
            isDense: true,
            hintStyle: TextStyle(
                color: AppColors().darkBlue.withOpacity(0.8),
                fontWeight: FontWeight.w600,
                fontSize: 14),
            labelStyle: TextStyle(
                color: AppColors().darkBlue.withOpacity(0.5),
                fontWeight: FontWeight.w500,
                fontSize: 12),
            contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: AppColors().darkBlue,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: AppColors().darkBlue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
