import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_colors.dart';
import 'app_text_style.dart';

class InputFieldWithLabel extends StatelessWidget {
  final String label;
  final Color? labelColor;
  final String? hintText;
  final TextInputType? keyboardType;
  final int maxLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? errorText;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String? suffixText;
  final bool readOnly;
  final VoidCallback? onTap;

  const InputFieldWithLabel({
    super.key,
    required this.label,
    this.labelColor,
    this.hintText,
    this.keyboardType,
    this.maxLines = 1,
    this.suffixText,
    this.controller,
    this.validator,
    this.onChanged,
    this.errorText,
    this.obscureText,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppTextStyle(
              text: label,
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500, // Medium
            ),
            validator == null
                ? SizedBox.shrink()
                : AppTextStyle(
                    text: "*",
                    fontSize: 15.sp,
                    color: Colors.red.shade800,
                  ),
          ],
        ),
        TextFormField(
          readOnly: readOnly,
          onTap: onTap,
          controller: controller,
          cursorColor: AppColors.primary,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: keyboardType ?? TextInputType.text,
          maxLines: maxLines,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400, // Regular
            ),
          ),
          onChanged: onChanged,
          validator: validator,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            errorText: errorText,
            suffixText: suffixText,
            suffixIcon: suffixIcon,
            suffixStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: AppColors.hintText,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400, // Regular
              ),
            ),
            hintText: hintText?.tr ?? '',
            filled: true,
            fillColor: Colors.white,
            hintStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.grey,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 0.5,
              ), // Thinner
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.hintText,
                width: 0.5,
              ), // Thinner
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 0.8,
              ), // Thinner
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordInputField extends StatefulWidget {
  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? errorText;

  const PasswordInputField({
    super.key,
    this.label = "Password",
    this.hintText,
    this.controller,
    this.validator,
    this.onChanged,
    this.errorText,
  });

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextStyle(
              text: widget.label,
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500, // Medium (was w300)
            ),
            widget.validator == null
                ? const SizedBox.shrink()
                : AppTextStyle(
                    text: "*",
                    fontSize: 15.sp,
                    color: Colors.red.shade800,
                  ),
          ],
        ),
        TextFormField(
          controller: widget.controller,
          cursorColor: AppColors.primary,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.visiblePassword,
          obscureText: _obscure,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400, // Regular
            ),
          ),
          onChanged: widget.onChanged,
          validator: widget.validator,
          decoration: InputDecoration(
            errorText: widget.errorText,
            suffixIcon: IconButton(
              onPressed: () => setState(() => _obscure = !_obscure),
              icon: Icon(
                _obscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: AppColors.hintText,
                size: 20.sp,
              ),
            ),
            hintText: widget.hintText?.tr ?? 'Enter password',
            filled: true,
            fillColor: Colors.white,
            hintStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.grey,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 0.5,
              ), // Thinner
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.hintText,
                width: 0.5,
              ), // Thinner
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 0.8,
              ), // Thinner
            ),
          ),
        ),
      ],
    );
  }
}
