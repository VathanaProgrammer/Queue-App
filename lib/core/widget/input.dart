import 'package:flutter/material.dart';
import '../constant/colors.dart';

class AppInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  /// UI-only state from outside (validation layer decides this)
  final bool isError;
  final bool isSuccess;

  final String? errorText;

  const AppInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.isError = false,
    this.isSuccess = false,
    this.errorText,
  });

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  final FocusNode _focusNode = FocusNode();
  bool _obscure = false;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;

    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Color _borderColor() {
    if (widget.isError) return Colors.red;
    if (widget.isSuccess) return Colors.green;

    if (_focusNode.hasFocus) {
      return AppColors.primary;
    }

    return AppColors.textCaption.withOpacity(0.3);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      obscureText: _obscure,

      decoration: InputDecoration(
        hintText: widget.hintText,
        errorText: widget.isError ? widget.errorText : null,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),

        // NORMAL STATE
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: _borderColor(),
          ),
        ),

        // FOCUSED (NO ERROR)
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: widget.isError
                ? Colors.red
                : AppColors.primary,
            width: 2,
          ),
        ),

        // ERROR (NOT FOCUSED)
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),

        // ERROR + FOCUSED (🔥 THIS WAS MISSING)
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),

        suffixIcon: widget.obscureText
            ? IconButton(
          icon: Icon(
            _obscure
                ? Icons.visibility_off
                : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _obscure = !_obscure;
            });
          },
        )
            : null,
      ),
    );
  }
}