import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:otp_feature/bloc/otp_form_bloc/otp_form_bloc.dart';
import 'package:otp_feature/bloc/otp_resend_actor/otp_resend_actor_bloc.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/timer_count_down/timer_count_down.dart';
import 'package:shared_libraries/timer_count_down/timer_count_down_controller.dart';
import 'package:shared_utilities/capitalize_each_word_format/capitalize_each_word_format_util.dart';
import 'package:shared_widget/elevated_button/elevated_button_widget.dart';
import 'package:shared_widget/otp_textbox/otp_textbox_widget.dart';

class OtpBodyWidget extends StatelessWidget {
  const OtpBodyWidget({
    required this.pinController,
    required this.countController,
    required this.phoneNumber,
    super.key,
  });

  final CountdownController countController;
  final TextEditingController pinController;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    const timer = 59;
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocBuilder<OtpFormBloc, OtpFormState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(MARGIN),
          child: Column(
            children: [
              Text(
                capitalizeEachWordFormat(lang.otp_verification_title),
                style: theme.textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: SPACE_SMALL),
              Text(
                '${lang.otp_verification_subtitle} +$phoneNumber',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: SPACE_LARGE),
              OTPTextboxWidget(
                controller: pinController,
                onChanged: (v) {
                  context.read<OtpFormBloc>().add(OtpFormEvent.otpNumber(v));
                },
                onCompleted: (value) {
                  context.read<OtpFormBloc>().add(const OtpFormEvent.send());
                },
              ),
              const SizedBox(height: SPACE_MEDIUM),
              ElevatedButtonWidget(
                onTap: () {
                  if (pinController.text.length == 4) {
                    context.read<OtpFormBloc>().add(const OtpFormEvent.send());
                  }
                },
                isLoading: state.isSubmit,
                label: lang.send,
                labelLoading: lang.sending,
              ),
              const SizedBox(height: SPACE_LARGE),
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
                        context
                            .read<OtpFormBloc>()
                            .add(OtpFormEvent.startTimer(countController));
                        context.read<OtpResendActorBloc>().add(
                              OtpResendActorEvent.resend(state.phoneNumber),
                            );
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
                    context
                        .read<OtpFormBloc>()
                        .add(const OtpFormEvent.onTimerFinish());
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
