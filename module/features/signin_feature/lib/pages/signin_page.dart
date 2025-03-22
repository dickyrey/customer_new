import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/enums.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_utilities/snackbar/snackbar.dart';
import 'package:signin_feature/bloc/signin_form/signin_form_bloc.dart';
import 'package:signin_feature/pages/widgets/signin_body_widget.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;

    return BlocListener<SigninFormBloc, SigninFormState>(
      listener: (context, state) {
        if (state.state == RequestState.error) {
          if (state.message == AuthenticationException.otpCooldown) {
            final snack = showSnackbar(
              context,
              type: SnackbarType.info,
              labelText: lang
                  //
                  // ignore: lines_longer_than_80_chars
                  .you_have_requested_an_otp_code_before_wait_about_1_minute_to_get_the_otp_code,
              labelButton: lang.close,
              onTap: () {},
            );
            ScaffoldMessenger.of(context).showSnackBar(snack);
          } else if (state.message == UPDATE_REQUIRED) {
            final snack = showSnackbar(
              context,
              type: SnackbarType.error,
              labelText: lang.update_app_now_for_best_experience,
              labelButton: lang.close,
              onTap: () {},
            );
            ScaffoldMessenger.of(context).showSnackBar(snack);
          } else {
            final snack = showSnackbar(
              context,
              type: SnackbarType.error,
              labelText: state.message,
              labelButton: lang.close,
              onTap: () {},
            );
            ScaffoldMessenger.of(context).showSnackBar(snack);
          }
        } else if (state.state == RequestState.loaded) {
          Navigator.pushNamed(
            context,
            Routes.otp,
            arguments: state.formattedPhoneNumber,
          );
        }
      },
      child: const Scaffold(
        body: SigninBody(),
      ),
    );
  }
}
