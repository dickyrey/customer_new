import 'package:address_core/domain/entities/address.dart';
import 'package:address_feature/bloc/address_delete_actor/address_delete_actor_bloc.dart';
import 'package:address_feature/bloc/address_setdefault_actor/address_setdefault_actor_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_arguments/address_argument.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_widget/alert_dialog/alert_dialog.dart';

class AddressOverviewCard extends StatelessWidget {
  const AddressOverviewCard({
    required this.data,
    required this.isPrimary,
    super.key,
  });

  final Address data;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    String addressType(String v) {
      switch (v) {
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

    return Card(
      margin: const EdgeInsets.only(bottom: SPACE_SMALL),
      color: isPrimary ? theme.primaryColor : theme.cardColor,
      child: InkWell(
        onTap: () {
          showModalBottomSheet<dynamic>(
            context: context,
            backgroundColor: theme.cardColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(RADIUS),
                topRight: Radius.circular(RADIUS),
              ),
            ),
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(MARGIN),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 100,
                      height: 5,
                      color: theme.dividerColor,
                    ),
                    const SizedBox(height: SPACE_LARGE),
                    ListTile(
                      onTap: () {
                        showConfirmationDialog(
                          context,
                          title: lang.set_as_primary_address,
                          primaryButtonLabel: lang.yes,
                          onPrimaryButtonTap: () {
                            context.read<AddressSetdefaultActorBloc>().add(
                                  AddressSetdefaultActorEvent.setDefault(
                                    data.id,
                                  ),
                                );
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                        );
                      },
                      leading: Icon(
                        FeatherIcons.star,
                        color: theme.textTheme.titleLarge?.color,
                      ),
                      title: Text(
                        lang.set_primary_address,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.popAndPushNamed(
                          context,
                          Routes.addressForm,
                          arguments: AddressArgument(
                            isEdit: true,
                            id: data.id,
                            name: data.name,
                            phone: data.phone,
                            address: data.address,
                            type: data.type,
                            street: data.street.street,
                          ),
                        );
                      },
                      leading: Icon(
                        FeatherIcons.edit3,
                        color: theme.textTheme.titleLarge?.color,
                      ),
                      title: Text(
                        lang.change_address,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        showConfirmationDialog(
                          context,
                          title: lang.are_you_sure_delete_address,
                          primaryButtonLabel: lang.delete,
                          onPrimaryButtonTap: () {
                            context
                                .read<AddressDeleteActorBloc>()
                                .add(AddressDeleteActorEvent.delete(data.id));
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                        );
                      },
                      leading: Icon(
                        FeatherIcons.trash,
                        color: theme.colorScheme.error,
                      ),
                      title: Text(
                        lang.delete,
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SPACE_SMALL,
            vertical: SPACE_TINY,
          ),
          child: Row(
            children: [
              const SizedBox(width: SPACE_MEDIUM),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${data.name} (+${data.phone})',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: isPrimary ? Colors.white : null,
                      ),
                    ),
                    const SizedBox(height: SPACE_TINY),
                    Text(
                      '${data.street.street} ${data.address}',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: isPrimary ? Colors.white : null,
                      ),
                    ),
                    const SizedBox(height: SPACE_SMALL),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(RADIUS),
                        color: isPrimary ? Colors.white : theme.primaryColor,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: SPACE_TINY,
                        vertical: SPACE_TINY - 3,
                      ),
                      child: Text(
                        addressType(data.type),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: isPrimary ? null : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                FeatherIcons.moreVertical,
                size: 25,
                color: isPrimary
                    ? Colors.white
                    : theme.textTheme.titleLarge?.color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
