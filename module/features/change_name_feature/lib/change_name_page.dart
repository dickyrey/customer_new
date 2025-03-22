import 'package:authentication_feature/bloc/auth_watcher/auth_watcher_bloc.dart';
import 'package:change_name_feature/bloc/change_name_form/change_name_form_bloc.dart';
import 'package:change_name_feature/widgets/change_name_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/enums.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_utilities/toast/toast_util.dart';
import 'package:user_core/domain/entities/user.dart';

class ChangeNamePage extends StatefulWidget {
  const ChangeNamePage({required this.args, super.key});
  final User args;

  @override
  State<ChangeNamePage> createState() => _ChangeNamePageState();
}

class _ChangeNamePageState extends State<ChangeNamePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<ChangeNameFormBloc>()
          .add(ChangeNameFormEvent.fetchSales(widget.args));
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocListener<ChangeNameFormBloc, ChangeNameFormState>(
      listener: (context, state) {
        if (state.state == RequestState.error) {
          if (state.message == UNAUTHENTICTED) {
            showToast(
              msg: lang.session_expired_please_login_to_continue,
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.splash,
              (route) => false,
            );
          } else {
            Navigator.pushNamed(
              context,
              Routes.failure,
              arguments: state.message,
            );
          }
        } else if (state.state == RequestState.loaded) {
          showToast(msg: lang.account_updated);
          context.read<AuthWatcherBloc>().add(const AuthWatcherEvent.check());
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.surface,
        ),
        body: ChangeNameBodyWidget(
          formKey: _formKey,
          args: widget.args,
        ),
      ),
    );
  }
}
