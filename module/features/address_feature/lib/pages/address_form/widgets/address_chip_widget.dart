import 'package:address_feature/bloc/address_form/address_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';

class AddressChip extends StatelessWidget {
  const AddressChip({
    required this.data,
    super.key,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    String statusLabel() {
      final status = data;
      switch (status) {
        case 'home':
          return lang.home;
        case 'office':
          return lang.office;
        case 'outlet':
          return lang.outlet;
        case 'etc':
          return lang.etc;
        default:
          return lang.etc;
      }
    }

    return BlocBuilder<AddressFormBloc, AddressFormState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: SPACE_MEDIUM),
          child: InkWell(
            onTap: () {
              context
                  .read<AddressFormBloc>()
                  .add(AddressFormEvent.selectedAddressType(data));
            },
            borderRadius: BorderRadius.circular(RADIUS),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: SPACE_SMALL,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: state.selectedAddressType == data
                      ? theme.primaryColor
                      : theme.hintColor,
                ),
                borderRadius: BorderRadius.circular(RADIUS),
                color: state.selectedAddressType == data
                    ? theme.primaryColor
                    : theme.cardColor,
              ),
              alignment: Alignment.center,
              child: Text(
                statusLabel(),
                style: theme.textTheme.titleLarge?.copyWith(
                  color:
                      state.selectedAddressType == data ? Colors.white : null,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
