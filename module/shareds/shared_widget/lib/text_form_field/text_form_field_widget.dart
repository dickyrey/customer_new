import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_libraries/form_field_validator/form_field_validator.dart';

enum TextFieldType { text, phone }

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    this.initialValue,
    this.controller,
    this.textFieldType = TextFieldType.text,
    this.hintText,
    this.helperText,
    this.onChanged,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.maxLines = 1,
    this.helperMaxLines,
    this.focusNode,
    this.textAlign = TextAlign.left,
    this.inputFormatters,
    this.enabled = true,
    this.textInputAction,
    this.textInputType,
    this.minLength = 1,
    this.textCapitalization = TextCapitalization.none,
    this.errorText,
  });

  final String? initialValue;
  final TextEditingController? controller;
  final TextFieldType textFieldType;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final int? maxLines;
  final int? helperMaxLines;
  final int? maxLength;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final TextCapitalization textCapitalization;
  final int minLength;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    TextInputType keyboardType(TextFieldType textFieldType) {
      switch (textFieldType) {
        // case TextFieldType.email:
        //   return TextInputType.emailAddress;
        case TextFieldType.text:
          return TextInputType.text;
        case TextFieldType.phone:
          return TextInputType.phone;
      }
    }

    MultiValidator validatorOption(
      TextFieldType textFieldType, {
      String? errorText,
    }) {
      switch (textFieldType) {
        // case TextFieldType.email:
        //   return MultiValidator([
        //     RequiredValidator(
        //       errorText: lang.enter_your_email_address,
        //     ),
        //     EmailValidator(
        //       errorText: lang.invalid_email_address_format,
        //     ),
        //   ]);
        case TextFieldType.text:
          return MultiValidator([
            RequiredValidator(
              errorText: errorText ?? lang.cannot_be_empty,
            ),
            MinLengthValidator(
              minLength,
              errorText: errorText ?? lang.text_too_short,
            ),
          ]);
        case TextFieldType.phone:
          return MultiValidator([
            RequiredValidator(
              errorText: errorText ?? lang.enter_your_phone_number,
            ),
            MinLengthValidator(
              7,
              errorText: errorText ?? lang.invalid_phone_number_format,
            ),
          ]);
      }
    }

    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      focusNode: focusNode,
      enabled: enabled,
      onChanged: onChanged,
      textAlign: textAlign ?? TextAlign.left,
      obscureText: obscureText ?? false,
      style: theme.textTheme.titleMedium,
      inputFormatters: inputFormatters ?? [],
      keyboardType: textInputType ?? keyboardType(textFieldType),
      validator: validatorOption(textFieldType, errorText: errorText).call,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: theme.textTheme.bodyMedium,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        helperMaxLines: helperMaxLines,
        helperText: helperText,
        helperStyle: theme.textTheme.bodySmall,
        filled: true,
        fillColor: theme.cardColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: SPACE_SMALL,
          vertical: maxLines == 1 ? 0 : SPACE_TINY,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RADIUS),
          borderSide: BorderSide(color: theme.hintColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RADIUS),
          borderSide: BorderSide(color: theme.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RADIUS),
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RADIUS),
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RADIUS),
          borderSide: BorderSide(color: theme.disabledColor),
        ),
      ),
    );
  }
}
