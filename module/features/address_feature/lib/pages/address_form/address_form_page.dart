import 'package:address_feature/bloc/address_form/address_form_bloc.dart';
import 'package:address_feature/bloc/address_watcher/address_watcher_bloc.dart';
import 'package:address_feature/pages/address_form/widgets/address_form_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_arguments/address_argument.dart';
import 'package:shared_common/enums.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_libraries/google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_utilities/toast/toast_util.dart';

class AddressFormPage extends StatefulWidget {
  const AddressFormPage({
    required this.args,
    super.key,
  });

  final AddressArgument args;

  @override
  State<AddressFormPage> createState() => _AddressFormPageState();
}

class _AddressFormPageState extends State<AddressFormPage> {
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<GoogleMapController?> _controller =
      ValueNotifier<GoogleMapController?>(null);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.args.isEdit) {
        context
            .read<AddressFormBloc>()
            .add(AddressFormEvent.fetchAddress(widget.args));
      } else {
        context
            .read<AddressFormBloc>()
            .add(const AddressFormEvent.fetchStreet(''));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocListener<AddressFormBloc, AddressFormState>(
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
          context
              .read<AddressWatcherBloc>()
              .add(const AddressWatcherEvent.fetch());
          showToast(msg: lang.address_updated);
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.cardColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(FeatherIcons.arrowLeft),
          ),
          title: Text(
            widget.args.isEdit ? lang.change_address : lang.add_address,
            style: theme.textTheme.headlineMedium,
          ),
        ),
        body: AddressFormBodyWidget(
          formKey: _formKey,
          controller: _controller,
          args: widget.args,
        ),
      ),
    );
  }
}
