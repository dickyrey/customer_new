import 'package:address_core/domain/entities/street.dart';
import 'package:address_feature/bloc/address_form/address_form_bloc.dart';
import 'package:address_feature/pages/address_form/widgets/address_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_arguments/address_argument.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_libraries/google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_utilities/capitalize_each_word_format/capitalize_each_word_format_util.dart';
import 'package:shared_utilities/toast/toast_util.dart';
import 'package:shared_widget/dropdown_button_form_field/dropdown_button_form_field_widget.dart';
import 'package:shared_widget/elevated_button/elevated_button_widget.dart';
import 'package:shared_widget/outlined_button/outlined_button_widget.dart';
import 'package:shared_widget/text_form_field/text_form_field_widget.dart';

class AddressFormBodyWidget extends StatelessWidget {
  const AddressFormBodyWidget({
    required this.formKey,
    required this.controller,
    required this.args,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final ValueNotifier<GoogleMapController?> controller;
  final AddressArgument args;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocBuilder<AddressFormBloc, AddressFormState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: MARGIN,
            vertical: SPACE_MEDIUM,
          ),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  capitalizeEachWordFormat(
                    args.isEdit ? lang.change_address : lang.add_address,
                  ),
                  style: theme.textTheme.headlineLarge,
                ),
                const SizedBox(height: SPACE_SMALL),
                Text(
                  lang.change_address_subtitle,
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: SPACE_MEDIUM),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    lang.recipient_name,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: SPACE_SMALL),
                TextFormFieldWidget(
                  hintText: lang.recipient_name,
                  initialValue: args.name,
                  textInputType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  onChanged: (v) {
                    context
                        .read<AddressFormBloc>()
                        .add(AddressFormEvent.name(v));
                  },
                ),
                const SizedBox(height: SPACE_MEDIUM),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    lang.whatsapp_number,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: SPACE_SMALL),
                TextFormFieldWidget(
                  initialValue: args.phone,
                  hintText: lang.whatsapp_number,
                  textFieldType: TextFieldType.phone,
                  textInputType: TextInputType.phone,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      MARGIN,
                      SPACE_SMALL + 4,
                      0,
                      SPACE_SMALL + 4,
                    ),
                    child: Text(
                      '+62',
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  onChanged: (v) {
                    context
                        .read<AddressFormBloc>()
                        .add(AddressFormEvent.phone(v));
                  },
                ),
                const SizedBox(height: SPACE_MEDIUM),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    lang.select_street,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: SPACE_SMALL),
                DropdownButtonFormFieldWidget<Street>(
                  value: state.selectedStreet,
                  hintText: lang.select_street,
                  itemList: state.streetList.map<DropdownMenuItem<Street>>(
                    (e) {
                      return DropdownMenuItem<Street>(
                        value: e,
                        child: Text(
                          e.id == 0 ? lang.select_street : e.street,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium,
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    context
                        .read<AddressFormBloc>()
                        .add(AddressFormEvent.selectStreet(value!));
                  },
                ),
                const SizedBox(height: SPACE_MEDIUM),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    lang.additional_address,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: SPACE_SMALL),
                Text(
                  lang.please_fill_in_the_alley_name_and_house_shop_number,
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(height: SPACE_TINY),
                TextFormFieldWidget(
                  hintText: lang.alley_name_and_house_number,
                  initialValue: args.address,
                  textInputType: TextInputType.text,
                  onChanged: (v) {
                    context
                        .read<AddressFormBloc>()
                        .add(AddressFormEvent.address(v));
                  },
                ),
                const SizedBox(height: SPACE_MEDIUM),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    lang.select_accurate_location,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: SPACE_SMALL),
                OutlinedButtonWidget(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.addressGoogleMap,
                      arguments: args,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (state.selectedLatLng != null)
                        const Icon(FeatherIcons.check)
                      else
                        const Icon(FeatherIcons.edit),
                      const SizedBox(width: SPACE_SMALL),
                      Text(
                        lang.change_accurate_location,
                        style: theme.textTheme.labelMedium
                            ?.copyWith(color: theme.primaryColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: SPACE_MEDIUM),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    lang.save_as,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: SPACE_SMALL),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ListView.builder(
                    itemCount: state.addressTypeList.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final data = state.addressTypeList[index];
                      return AddressChip(data: data);
                    },
                  ),
                ),
                const SizedBox(height: SPACE_VERY_LARGE),
                ElevatedButtonWidget(
                  label: lang.save,
                  isLoading: state.isSubmit,
                  onTap: () {
                    if (state.selectedStreet == null ||
                        state.selectedStreet!.id == 0) {
                      showToast(msg: lang.road_not_selected_yet);
                    } else if (state.selectedAddressType == '') {
                      showToast(msg: lang.address_type_not_selected_yet);
                    } else if (state.selectedLatLng == null) {
                      showToast(msg: lang.accurate_location_not_updated_yet);
                    } else {
                      if (formKey.currentState!.validate()) {
                        if (args.isEdit) {
                          context
                              .read<AddressFormBloc>()
                              .add(AddressFormEvent.update(args.id));
                        } else {
                          context
                              .read<AddressFormBloc>()
                              .add(const AddressFormEvent.create());
                        }
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
