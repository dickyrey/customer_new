import 'package:authentication_feature/bloc/auth_watcher/auth_watcher_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/enums.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_utilities/snackbar/snackbar.dart';
import 'package:signup_feature/bloc/signup_form/signup_form_bloc.dart';
import 'package:signup_feature/pages/signup/widgets/signup_body_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<GoogleMapController?> _controller =
      ValueNotifier<GoogleMapController?>(null);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<SignupFormBloc>().add(const SignupFormEvent.fetchStreet());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return MultiBlocListener(
      listeners: [
        BlocListener<AuthWatcherBloc, AuthWatcherState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              notAuthenticated: (value) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.splash,
                  (route) => false,
                );
              },
            );
          },
        ),
        BlocListener<SignupFormBloc, SignupFormState>(
          listener: (context, state) {
            if (state.state == RequestState.error) {
              if (state.message == UPDATE_REQUIRED) {
                final snack = showSnackbar(
                  context,
                  type: SnackbarType.error,
                  labelText: lang.update_app_now_for_best_experience,
                  labelButton: lang.close,
                  onTap: () {},
                );
                ScaffoldMessenger.of(context).showSnackBar(snack);
              } else if (state.message == UNAUTHENTICTED) {
                final snack = showSnackbar(
                  context,
                  type: SnackbarType.error,
                  labelText: lang.session_expired_please_login_to_continue,
                  labelButton: lang.close,
                  onTap: () {},
                );
                ScaffoldMessenger.of(context).showSnackBar(snack);
              }
            } else if (state.state == RequestState.loaded) {
              context
                  .read<AuthWatcherBloc>()
                  .add(const AuthWatcherEvent.check());
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.dashboard,
                (route) => false,
              );
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.surface,
          title: Text(
            lang.registration,
            style: theme.textTheme.headlineMedium,
          ),
        ),
        body: SignupBody(
          controller: _controller,
          formKey: _formKey,
        ),
      ),
    );
  }
}
