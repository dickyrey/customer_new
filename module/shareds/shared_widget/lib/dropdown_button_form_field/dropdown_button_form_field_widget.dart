import 'package:flutter/material.dart';
import 'package:shared_common/constants.dart';

class DropdownButtonFormFieldWidget<T> extends StatelessWidget {
  const DropdownButtonFormFieldWidget({
    required this.hintText,
    super.key,
    this.value,
    this.itemList,
    this.onChanged,
  });

  final T? value;
  final List<DropdownMenuItem<T>>? itemList;
  final ValueChanged<T?>? onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DropdownButtonFormField<T>(
      value: value,
      borderRadius: BorderRadius.circular(RADIUS),
      dropdownColor: theme.cardColor,
      isExpanded: true,
      alignment: Alignment.centerLeft,
      style: theme.textTheme.titleMedium,
      hint: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          hintText,
          style: theme.textTheme.bodyMedium,
        ),
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: theme.cardColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: SPACE_SMALL,
          vertical: SPACE_TINY - 5,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Rounded border
          borderSide: BorderSide(
            color: theme.hintColor,
            width: .5,
          ), // Border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Rounded border
          borderSide: BorderSide(
            color: theme.primaryColor,
            width: .5,
          ), // Border color
        ),
      ),
      items: itemList,
      onChanged: onChanged,
    );
  }
}
