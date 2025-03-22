import 'package:address_core/domain/entities/street.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_arguments/address_argument.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_libraries/google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_utilities/toast/toast_util.dart';
import 'package:shared_widget/dropdown_button_form_field/dropdown_button_form_field_widget.dart';
import 'package:shared_widget/elevated_button/elevated_button_widget.dart';
import 'package:shared_widget/outlined_button/outlined_button_widget.dart';
import 'package:shared_widget/text_form_field/text_form_field_widget.dart';
import 'package:signup_feature/bloc/signup_form/signup_form_bloc.dart';
import 'package:signup_feature/pages/signup/widgets/address_chip_widget.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({
    required this.formKey,
    required this.controller,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  // GoogleMapController controller;

  final ValueNotifier<GoogleMapController?> controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocBuilder<SignupFormBloc, SignupFormState>(
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
                  lang.enter_your_name_and_address_first,
                  style: theme.textTheme.headlineLarge,
                ),
                const SizedBox(height: SPACE_VERY_LARGE),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    lang.full_name,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: SPACE_SMALL),
                TextFormFieldWidget(
                  hintText: lang.full_name,
                  textInputType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  onChanged: (v) {
                    context.read<SignupFormBloc>().add(SignupFormEvent.name(v));
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
                        .read<SignupFormBloc>()
                        .add(SignupFormEvent.phone(v));
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
                          e.street,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium,
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    context
                        .read<SignupFormBloc>()
                        .add(SignupFormEvent.selectStreet(value!));
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
                  textInputType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  onChanged: (v) {
                    context
                        .read<SignupFormBloc>()
                        .add(SignupFormEvent.address(v));
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
                      Routes.signUpGoogleMap,
                      arguments: AddressArgument.empty(),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                    if (state.selectedStreet == null) {
                      showToast(msg: 'Belum memilih jalan!');
                    } else if (state.selectedAddressType == '') {
                      showToast(msg: 'Belum memilih type alamat!');
                    } else if (state.selectedLatLng == null) {
                      showToast(msg: 'Belum ubah lokasi akurat');
                    } else {
                      if (formKey.currentState!.validate()) {
                        context
                            .read<SignupFormBloc>()
                            .add(const SignupFormEvent.send());
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
