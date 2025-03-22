import 'package:flutter/material.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_libraries/pinput/pinput.dart';

class OTPTextboxWidget extends StatelessWidget {
  const OTPTextboxWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.onCompleted,
  });

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Pinput(
      controller: controller,
      onChanged: onChanged,
      onCompleted: onCompleted,
      defaultPinTheme: PinTheme(
        textStyle: theme.textTheme.labelLarge,
        constraints: const BoxConstraints(
          maxHeight: 50,
          maxWidth: 50,
          minWidth: 50,
          minHeight: 50,
        ),
        decoration: BoxDecoration(
          color: theme.dividerColor,
          borderRadius: BorderRadius.circular(RADIUS),
        ),
        height: 50,
        width: 50,
        margin: const EdgeInsets.symmetric(
          horizontal: SPACE_TINY,
          vertical: SPACE_TINY,
        ),
      ),
    );
  }
}
