import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reseller_submission_feature/bloc/submission_form/submission_form_bloc.dart';
import 'package:reseller_submission_feature/pages/submission_form/widgets/submission_address_card_widget.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_widget/alert_dialog/alert_dialog.dart';
import 'package:shared_widget/elevated_button/elevated_button_widget.dart';
import 'package:shared_widget/empty_body/empty_body_widget.dart';
import 'package:shared_widget/outlined_button/outlined_button_widget.dart';
import 'package:shared_widget/text_form_field/text_form_field_widget.dart';

class SubmissionFormBodyWidget extends StatelessWidget {
  const SubmissionFormBodyWidget({
    required this.formKey,
    super.key,
  });
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocBuilder<SubmissionFormBloc, SubmissionFormState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(MARGIN),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lang.select_address,
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: SPACE_SMALL),
                if (state.selectedAddress != null)
                  SubmissionAddressCardWidget(
                    data: state.selectedAddress!,
                    onTap: () {
                      _showAddressDialog(context, theme, state);
                    },
                  )
                else
                  OutlinedButtonWidget(
                    onTap: () {
                      _showAddressDialog(context, theme, state);
                    },
                    label: lang.select_address,
                  ),
                const SizedBox(height: SPACE_MEDIUM),
                Text(
                  lang.store_name,
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: SPACE_SMALL),
                TextFormFieldWidget(
                  hintText: lang.store_name,
                  textCapitalization: TextCapitalization.words,
                  onChanged: (v) {
                    context
                        .read<SubmissionFormBloc>()
                        .add(SubmissionFormEvent.onChanged(v));
                  },
                ),
                const SizedBox(height: SPACE_LARGE),
                ElevatedButtonWidget(
                  onTap: () {
                    if (state.selectedAddress == null) {
                    } else {
                      if (formKey.currentState!.validate()) {
                        showConfirmationDialog(
                          context,
                          title: lang.are_you_sure_everything_correct,
                          primaryButtonLabel: lang.confirm,
                          onPrimaryButtonTap: () {
                            Navigator.pop(context);
                            context
                                .read<SubmissionFormBloc>()
                                .add(const SubmissionFormEvent.send());
                          },
                        );
                      }
                    }
                  },
                  label: lang.send,
                  isLoading: state.isSubmit,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _showAddressDialog(
    BuildContext context,
    ThemeData theme,
    SubmissionFormState state,
  ) {
    return showModalBottomSheet<dynamic>(
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
              Expanded(
                child: state.addressList.isNotEmpty
                    ? ListView.builder(
                        itemCount: state.addressList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final data = state.addressList[index];
                          return SubmissionAddressCardWidget(
                            data: data,
                            onTap: () {
                              context.read<SubmissionFormBloc>().add(
                                    SubmissionFormEvent.selectAddress(
                                      data,
                                    ),
                                  );
                              Navigator.pop(context);
                            },
                          );
                        },
                      )
                    : const EmptyBodyWidget(
                        type: EmptyBodyType.address,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
