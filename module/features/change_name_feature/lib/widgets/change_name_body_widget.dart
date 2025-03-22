import 'package:change_name_feature/bloc/change_name_form/change_name_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sales_core/domain/entities/sales.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_utilities/capitalize_each_word_format/capitalize_each_word_format_util.dart';
import 'package:shared_widget/dropdown_button_form_field/dropdown_button_form_field_widget.dart';
import 'package:shared_widget/elevated_button/elevated_button_widget.dart';
import 'package:shared_widget/outlined_button/outlined_button_widget.dart';
import 'package:shared_widget/text_form_field/text_form_field_widget.dart';
import 'package:user_core/domain/entities/user.dart';

class ChangeNameBodyWidget extends StatelessWidget {
  const ChangeNameBodyWidget({
    required this.formKey,
    required this.args,
    super.key,
  });
  final GlobalKey<FormState> formKey;
  final User args;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocBuilder<ChangeNameFormBloc, ChangeNameFormState>(
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
                  capitalizeEachWordFormat(lang.change_full_name_title),
                  style: theme.textTheme.headlineLarge,
                ),
                const SizedBox(height: SPACE_SMALL),
                Text(
                  lang.change_full_name_subtitle,
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: SPACE_MEDIUM),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    lang.full_name,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: SPACE_SMALL),
                TextFormFieldWidget(
                  initialValue: args.name,
                  hintText: lang.full_name,
                  onChanged: (v) {
                    context
                        .read<ChangeNameFormBloc>()
                        .add(ChangeNameFormEvent.fullName(v));
                  },
                ),
                const SizedBox(height: SPACE_MEDIUM),
                Text(
                  capitalizeEachWordFormat(lang.change_sales_title),
                  style: theme.textTheme.headlineLarge,
                ),
                const SizedBox(height: SPACE_SMALL),
                Text(
                  lang.change_sales_subtitle,
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: SPACE_MEDIUM),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    lang.select_sales,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: SPACE_SMALL),
                DropdownButtonFormFieldWidget<Sales>(
                  value: state.selectedSales,
                  hintText: lang.select_street,
                  itemList: state.salesList.map<DropdownMenuItem<Sales>>(
                    (e) {
                      return DropdownMenuItem<Sales>(
                        value: e,
                        child: Text(
                          e.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium,
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    context
                        .read<ChangeNameFormBloc>()
                        .add(ChangeNameFormEvent.selectSales(value!));
                  },
                ),
                const SizedBox(height: SPACE_MEDIUM),
                ElevatedButtonWidget(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      context
                          .read<ChangeNameFormBloc>()
                          .add(const ChangeNameFormEvent.save());
                    }
                  },
                  label: lang.save,
                  isLoading: state.isSubmit,
                ),
                const SizedBox(height: SPACE_MEDIUM),
                const Divider(thickness: 2),
                const SizedBox(height: SPACE_MEDIUM),
                OutlinedButtonWidget(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.changeNumber);
                  },
                  label: lang.change_number,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
