import 'package:authentication_feature/bloc/auth_watcher/auth_watcher_bloc.dart';
import 'package:deposit_feature/bloc/deposit_top_up_form/deposit_top_up_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/constants/icon_constants.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_libraries/flutter_svg/flutter_svg.dart';
import 'package:shared_widget/alert_dialog/alert_dialog.dart';
import 'package:shared_widget/elevated_button/elevated_button_widget.dart';
import 'package:shared_widget/text_form_field/text_form_field_widget.dart';

class DepositTopupBodyWidget extends StatelessWidget {
  const DepositTopupBodyWidget({
    required this.depositeCtrl,
    required this.depositeList,
    super.key,
  });

  final TextEditingController depositeCtrl;
  final List<String> depositeList;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocBuilder<AuthWatcherBloc, AuthWatcherState>(
      builder: (context, auth) {
        return auth.maybeMap(
          orElse: () {
            return const Center(child: CircularProgressIndicator());
          },
          authenticated: (auth) {
            return BlocBuilder<DepositTopUpFormBloc, DepositTopUpFormState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(MARGIN),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: SPACE_SMALL,
                          vertical: SPACE_TINY,
                        ),
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(RADIUS),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: theme.primaryColor,
                              child: SvgPicture.asset(
                                AssetIcons.deposit,
                                width: 25,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            const SizedBox(width: SPACE_MEDIUM),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    auth.user.name,
                                    style: theme.textTheme.headlineSmall,
                                  ),
                                  Text(
                                    '${lang.deposit}: ${auth.user.cash}',
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: SPACE_LARGE),
                      Text(
                        lang.how_much_deposit_add,
                        style: theme.textTheme.headlineLarge,
                      ),
                      const SizedBox(height: SPACE_MEDIUM),
                      TextFormFieldWidget(
                        hintText: lang.deposit_amount,
                        controller: depositeCtrl,
                        textFieldType: TextFieldType.phone,
                        textInputType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Rp',
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                        suffixIcon: IconButton(
                          color: theme.textTheme.bodyLarge?.color,
                          icon: const Icon(FeatherIcons.x),
                          onPressed: depositeCtrl.clear,
                        ),
                        onChanged: (v) {
                          context
                              .read<DepositTopUpFormBloc>()
                              .add(DepositTopUpFormEvent.deposit(v));
                        },
                      ),
                      const SizedBox(height: SPACE_MEDIUM),
                      Wrap(
                        children: depositeList
                            .map(
                              (e) => Padding(
                                padding:
                                    const EdgeInsets.only(right: SPACE_TINY),
                                child: InkWell(
                                  onTap: () {
                                    final number =
                                        int.parse(e.replaceAll('.', ''));
                                    depositeCtrl.text = number.toString();
                                    context.read<DepositTopUpFormBloc>().add(
                                          DepositTopUpFormEvent.deposit(
                                            number.toString(),
                                          ),
                                        );
                                  },
                                  borderRadius: BorderRadius.circular(RADIUS),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: SPACE_SMALL,
                                      vertical: SPACE_TINY,
                                    ),
                                    decoration: BoxDecoration(
                                      color: theme.primaryColor
                                          .withValues(alpha: .1),
                                      borderRadius: BorderRadius.circular(
                                        RADIUS,
                                      ),
                                    ),
                                    child: Text(
                                      e,
                                      style: theme.textTheme.titleLarge,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: SPACE_LARGE),
                      ElevatedButtonWidget(
                        onTap: () {
                          showConfirmationDialog(
                            context,
                            title: lang.is_deposit_amount_correct,
                            primaryButtonLabel: lang.yes,
                            onPrimaryButtonTap: () {
                              context
                                  .read<DepositTopUpFormBloc>()
                                  .add(const DepositTopUpFormEvent.send());
                              Navigator.pop(context);
                            },
                          );
                        },
                        label: lang.confirm,
                        isLoading: state.isSubmit,
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
