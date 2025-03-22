import 'package:checkout_feature/bloc/checkout_form/checkout_form_bloc.dart';
import 'package:checkout_feature/pages/widgets/checkout_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_arguments/checkout_argument.dart';
import 'package:shared_common/enums.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_utilities/snackbar/snackbar.dart';
import 'package:shared_utilities/toast/toast_util.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({required this.args, super.key});
  final CheckoutArgument args;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<CheckoutFormBloc>()
          .add(const CheckoutFormEvent.getPaymentList());
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocListener<CheckoutFormBloc, CheckoutFormState>(
      listener: (context, state) {
        if (state.state == RequestState.error) {
          if (state.message == TransactionException.outOfStock) {
            final snack = showSnackbar(
              context,
              type: SnackbarType.info,
              labelText: lang.ordered_stock_out_of_stock,
              labelButton: lang.close,
              onTap: () {},
            );
            ScaffoldMessenger.of(context).showSnackBar(snack);
          } else if (state.message == TransactionException.notFound) {
            final snack = showSnackbar(
              context,
              type: SnackbarType.info,
              labelText: lang.payment_method_not_selected_yet,
              labelButton: lang.close,
              onTap: () {},
            );
            ScaffoldMessenger.of(context).showSnackBar(snack);
          } else if (state.message ==
              TransactionException.outsideOperationHour) {
            final snack = showSnackbar(
              context,
              type: SnackbarType.info,
              labelText: lang.depot_closed_order_again_8am,
              labelButton: lang.close,
              onTap: () {},
            );
            ScaffoldMessenger.of(context).showSnackBar(snack);
          } else if (state.message == UNAUTHENTICTED) {
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
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.payment,
            (route) => false,
            arguments: state.transactionDetail,
          );
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
            lang.checkout,
            style: theme.textTheme.headlineMedium,
          ),
        ),
        body: CheckoutBodyWidget(
          args: widget.args,
        ),
      ),
    );
  }
}
