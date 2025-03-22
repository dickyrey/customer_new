import 'package:change_number_feature/bloc/change_number_form/change_number_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/timer_count_down/timer_count_down.dart';
import 'package:shared_libraries/timer_count_down/timer_count_down_controller.dart';
import 'package:shared_utilities/capitalize_each_word_format/capitalize_each_word_format_util.dart';
import 'package:shared_widget/elevated_button/elevated_button_widget.dart';
import 'package:shared_widget/otp_textbox/otp_textbox_widget.dart';
import 'package:shared_widget/text_form_field/text_form_field_widget.dart';

class ChangeNumberBodyWidget extends StatelessWidget {
  const ChangeNumberBodyWidget({
    required this.countController,
    required this.pinController,
    required this.focusNode,
    super.key,
  });
  final CountdownController countController;
  final TextEditingController pinController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    const timer = 59;
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();

    return BlocBuilder<ChangeNumberFormBloc, ChangeNumberFormState>(
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
                  capitalizeEachWordFormat(lang.change_phone_number),
                  style: theme.textTheme.headlineLarge,
                ),
                const SizedBox(height: SPACE_SMALL),
                Text(
                  lang.make_sure_phone_number_active_whatsapp,
                  style: theme.textTheme.bodyLarge,
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
                  focusNode: focusNode,
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
                        .read<ChangeNumberFormBloc>()
                        .add(ChangeNumberFormEvent.number(v));
                  },
                ),
                const SizedBox(height: SPACE_MEDIUM),
                Visibility(
                  visible: !state.isOTPEnable,
                  child: ElevatedButtonWidget(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context
                            .read<ChangeNumberFormBloc>()
                            .add(const ChangeNumberFormEvent.requestOtp());
                        FocusScope.of(context).unfocus();
                      }
                    },
                    label: lang.request_otp_code,
                    isLoading: state.isSubmit,
                  ),
                ),
                const SizedBox(height: SPACE_MEDIUM),
                Visibility(
                  visible: state.isOTPEnable,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          capitalizeEachWordFormat(lang.enter_otp_code),
                          style: theme.textTheme.headlineLarge,
                        ),
                        const SizedBox(height: SPACE_SMALL),
                        OTPTextboxWidget(
                          controller: pinController,
                          onChanged: (v) {
                            context
                                .read<ChangeNumberFormBloc>()
                                .add(ChangeNumberFormEvent.otp(v));
                          },
                          onCompleted: (value) {
                            context
                                .read<ChangeNumberFormBloc>()
                                .add(const ChangeNumberFormEvent.send());
                          },
                        ),
                        const SizedBox(height: SPACE_MEDIUM),
                        if (state.isTimeoutDone)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                lang.didnt_you_received_any_code,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyLarge,
                              ),
                              const SizedBox(height: SPACE_TINY),
                              InkWell(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<ChangeNumberFormBloc>().add(
                                          ChangeNumberFormEvent.startTimer(
                                            countController,
                                          ),
                                        );
                                    context.read<ChangeNumberFormBloc>().add(
                                          const ChangeNumberFormEvent
                                              .requestOtp(),
                                        );
                                  }
                                },
                                child: Text(
                                  lang.resend_a_new_code,
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    color: theme.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          )
                        else
                          Countdown(
                            seconds: timer,
                            controller: countController,
                            build: (_, timer) {
                              return Text(
                                // ignore: lines_longer_than_80_chars
                                '${lang.please_wait_in} ${timer.toInt()} ${lang.seconds_for_resend_otp_code}',
                                style: theme.textTheme.bodyMedium,
                              );
                            },
                            onFinished: () {
                              context.read<ChangeNumberFormBloc>().add(
                                    const ChangeNumberFormEvent.onTimerFinish(),
                                  );
                            },
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: SPACE_MEDIUM),
              ],
            ),
          ),
        );
      },
    );
  }
}
