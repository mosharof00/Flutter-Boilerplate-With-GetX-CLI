import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/extensions/text_style_extension.dart';
import '../core/theme/app_colors.dart';
import 'app_text.dart';

InputDecoration _buildInputDecoration({
  required BuildContext context,
  String? hintText,
  String? errorText,
  String? suffixText,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    errorText: errorText,
    suffixText: suffixText,
    suffixIcon: suffixIcon,
    suffixStyle: Theme.of(
      context,
    ).textTheme.bodyMedium?.copyWith(color: AppColors.hintText),
    hintText: hintText?.tr ?? '',
    filled: true,
    fillColor: Colors.white,
    hintStyle: Theme.of(
      context,
    ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.black, width: 0.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.hintText, width: 0.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.primary, width: 0.8),
    ),
  );
}

class InputFieldWithLabel extends StatelessWidget {
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

  final String label;
  final Color? labelColor;
  final String? hintText;
  final TextInputType? keyboardType;
  final int maxLines;
  final String? suffixText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? errorText;
  final bool? obscureText;
  final Widget? suffixIcon;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              label,
              style: context.titleSmall.copyWith(
                color: labelColor ?? Colors.black,
              ),
            ),
            if (validator != null)
              AppText(
                '*',
                style: context.titleSmall.copyWith(color: Colors.red.shade800),
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
          style: Theme.of(context).textTheme.bodyMedium,
          onChanged: onChanged,
          validator: validator,
          obscureText: obscureText ?? false,
          decoration: _buildInputDecoration(
            context: context,
            hintText: hintText,
            errorText: errorText,
            suffixText: suffixText,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({
    super.key,
    this.label = 'Password',
    this.hintText,
    this.controller,
    this.validator,
    this.onChanged,
    this.errorText,
  });

  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? errorText;

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
            AppText(
              widget.label,
              style: context.titleSmall.copyWith(color: Colors.black),
            ),
            if (widget.validator != null)
              AppText(
                '*',
                style: context.titleSmall.copyWith(color: Colors.red.shade800),
              ),
          ],
        ),
        TextFormField(
          controller: widget.controller,
          cursorColor: AppColors.primary,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.visiblePassword,
          obscureText: _obscure,
          style: Theme.of(context).textTheme.bodyMedium,
          onChanged: widget.onChanged,
          validator: widget.validator,
          decoration: _buildInputDecoration(
            context: context,
            hintText: widget.hintText ?? 'Enter password',
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
          ),
        ),
      ],
    );
  }
}
