import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/constants/image_constants.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/url_launcher/url_launcher.dart';
import 'package:shared_widget/elevated_button/elevated_button_widget.dart';
import 'package:shared_widget/text_form_field/text_form_field_widget.dart';
import 'package:signin_feature/bloc/signin_form/signin_form_bloc.dart';

class SigninBody extends StatelessWidget {
  const SigninBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;
    final formKey = GlobalKey<FormState>();

    return BlocBuilder<SigninFormBloc, SigninFormState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: MARGIN,
            vertical: SPACE_LARGE,
          ),
          child: SafeArea(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  const SizedBox(height: SPACE_LARGE),
                  Image.asset(
                    AssetImages.logo,
                    width: 150,
                  ),
                  const SizedBox(height: SPACE_VERY_LARGE),
                  Text(
                    lang.signin_title,
                    style: theme.textTheme.headlineLarge,
                  ),
                  const SizedBox(height: SPACE_MEDIUM),
                  Text(
                    lang.signin_subtitle,
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: SPACE_VERY_LARGE),
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
                          .read<SigninFormBloc>()
                          .add(SigninFormEvent.phoneNumber(v));
                    },
                  ),
                  const SizedBox(height: SPACE_LARGE),
                  ElevatedButtonWidget(
                    label: lang.login,
                    isLoading: state.isSubmit,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context
                            .read<SigninFormBloc>()
                            .add(const SigninFormEvent.signIn());
                      }
                    },
                  ),
                  const SizedBox(height: SPACE_LARGE),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${lang.i_have_read_and_agree} ',
                          style: theme.textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: lang.privacy_policy,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              if (!await launchUrl(
                                Uri.parse(PRIVACY_POLICY),
                                mode: LaunchMode.externalApplication,
                              )) {
                                throw Exception('Could not launch ');
                              }
                            },
                        ),
                        TextSpan(
                          text: ' ${lang.and} ',
                          style: theme.textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: lang.terms_and_condition,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.primaryColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              if (!await launchUrl(
                                Uri.parse(TERM_AND_CONDITION),
                                mode: LaunchMode.externalApplication,
                              )) {
                                throw Exception('Could not launch ');
                              }
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
