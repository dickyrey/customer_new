import 'package:address_feature/bloc/address_delete_actor/address_delete_actor_bloc.dart';
import 'package:address_feature/bloc/address_setdefault_actor/address_setdefault_actor_bloc.dart';
import 'package:address_feature/bloc/address_watcher/address_watcher_bloc.dart';
import 'package:address_feature/pages/address_overview/widgets/address_overview_body_widget.dart';
import 'package:authentication_feature/bloc/auth_watcher/auth_watcher_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_arguments/address_argument.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_utilities/toast/toast_util.dart';

class AddressOverviewPage extends StatefulWidget {
  const AddressOverviewPage({super.key});

  @override
  State<AddressOverviewPage> createState() => _AddressOverviewPageState();
}

class _AddressOverviewPageState extends State<AddressOverviewPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AddressWatcherBloc>().add(const AddressWatcherEvent.fetch());
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return MultiBlocListener(
      listeners: [
        BlocListener<AddressDeleteActorBloc, AddressDeleteActorState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              failed: (state) {
                if (state.message == UNAUTHENTICTED) {
                  showToast(
                    msg: lang.session_expired_please_login_to_continue,
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.splash,
                    (route) => false,
                  );
                }
              },
              loaded: (value) {
                showToast(msg: lang.address_deleted);
                context
                    .read<AuthWatcherBloc>()
                    .add(const AuthWatcherEvent.check());
                context
                    .read<AddressWatcherBloc>()
                    .add(const AddressWatcherEvent.fetch());
              },
            );
          },
        ),
        BlocListener<AddressSetdefaultActorBloc, AddressSetdefaultActorState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              failed: (state) {
                if (state.message == UNAUTHENTICTED) {
                  showToast(
                    msg: lang.session_expired_please_login_to_continue,
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.splash,
                    (route) => false,
                  );
                }
              },
              loaded: (value) {
                showToast(msg: lang.default_address_changed);
                context
                    .read<AuthWatcherBloc>()
                    .add(const AuthWatcherEvent.check());
                context
                    .read<AddressWatcherBloc>()
                    .add(const AddressWatcherEvent.fetch());
              },
            );
          },
        ),
        BlocListener<AddressWatcherBloc, AddressWatcherState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              failed: (state) {
                if (state.message == UNAUTHENTICTED) {
                  showToast(
                    msg: lang.session_expired_please_login_to_continue,
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.splash,
                    (route) => false,
                  );
                }
              },
            );
          },
        ),
      ],
      child: BlocBuilder<AddressWatcherBloc, AddressWatcherState>(
        builder: (context, state) {
          return state.maybeMap(
            orElse: () {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: theme.cardColor,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(FeatherIcons.arrowLeft),
                  ),
                  title: Text(
                    lang.my_address,
                    style: theme.textTheme.headlineMedium,
                  ),
                ),
                body: const Center(child: CircularProgressIndicator()),
              );
            },
            loaded: (state) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: theme.cardColor,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(FeatherIcons.arrowLeft),
                  ),
                  title: Text(
                    lang.my_address,
                    style: theme.textTheme.headlineMedium,
                  ),
                ),
                body: const AddressOverviewBodyWidget(),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    if (state.addressList.length < 5) {
                      Navigator.pushNamed(
                        context,
                        Routes.addressForm,
                        arguments: AddressArgument.empty(),
                      );
                    } else {
                      showToast(msg: lang.maximum_addresses_reached);
                    }
                  },
                  backgroundColor: theme.primaryColor,
                  child: const Icon(
                    FeatherIcons.plus,
                    color: Colors.white,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
