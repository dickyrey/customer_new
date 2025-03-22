import 'package:checkout_feature/bloc/checkout_form/checkout_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_arguments/checkout_argument.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/constants/icon_constants.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_libraries/flutter_svg/flutter_svg.dart';
import 'package:shared_utilities/currency_format/currency_format_util.dart';
import 'package:shared_utilities/toast/toast_util.dart';
import 'package:shared_widget/elevated_button/elevated_button_widget.dart';
import 'package:shared_widget/outlined_button/outlined_button_widget.dart';
import 'package:shared_widget/shimmer/shimmer_widget.dart';
import 'package:transaction_core/domain/entities/transaction_payment.dart';

class CheckoutBodyWidget extends StatelessWidget {
  const CheckoutBodyWidget({
    required this.args,
    super.key,
  });
  final CheckoutArgument args;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    String statusLabel(String data) {
      final status = data;
      switch (status) {
        case 'home':
          return lang.home;
        case 'office':
          return lang.office;
        case 'outlet':
          return lang.outlet;
        case 'etc':
          return lang.etc;
        default:
          return lang.etc;
      }
    }

    return BlocBuilder<CheckoutFormBloc, CheckoutFormState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: theme.cardColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN,
                  vertical: SPACE_SMALL,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lang.shipping_destination,
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: SPACE_SMALL),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(RADIUS),
                        color: theme.primaryColor.withOpacity(.1),
                      ),
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: SPACE_SMALL,
                          vertical: SPACE_TINY,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              FeatherIcons.mapPin,
                              size: 24,
                              color: theme.primaryColor,
                            ),
                            const SizedBox(width: SPACE_SMALL),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    statusLabel(args.user.address.type),
                                    style: theme.textTheme.headlineSmall,
                                  ),
                                  const SizedBox(height: SPACE_TINY - 3),
                                  Text(
                                    args.user.address.street.street,
                                    style: theme.textTheme.titleLarge,
                                  ),
                                  const SizedBox(height: SPACE_TINY - 3),
                                  Text(
                                    ' ${args.user.address.address}',
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // const SizedBox(height: SPACE_MEDIUM),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pushNamed(
                    //       context,
                    //       Routes.address,
                    //       arguments: args.user,
                    //     );
                    //   },
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       CircleAvatar(
                    //         radius: 10,
                    //         backgroundColor: theme.primaryColor,
                    //         child: const Icon(
                    //           FeatherIcons.plus,
                    //           color: Colors.white,
                    //           size: 15,
                    //         ),
                    //       ),
                    //       const SizedBox(width: SPACE_MEDIUM),
                    //       Text(
                    //         lang.change_address,
                    //         style: theme.textTheme.titleLarge,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              const SizedBox(height: SPACE_MEDIUM),
              Container(
                color: theme.cardColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN,
                  vertical: SPACE_MEDIUM,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lang.purchase_detail,
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: SPACE_SMALL),
                    Row(
                      children: [
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: SvgPicture.asset(AssetIcons.gallon),
                        ),
                        const SizedBox(width: SPACE_MEDIUM),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${lang.amount} :',
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  Text(
                                    '${args.qty} ${lang.galon}',
                                    style: theme.textTheme.headlineSmall,
                                  ),
                                ],
                              ),
                              const SizedBox(height: SPACE_SMALL),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${lang.total} :',
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  Text(
                                    currencyFormat(args.total),
                                    style: theme.textTheme.headlineSmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: SPACE_MEDIUM),
              Container(
                color: theme.cardColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN,
                  vertical: SPACE_MEDIUM,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        // ignore: lines_longer_than_80_chars
                        '${lang.available_points} ${currencyFormat(args.user.point, symbol: '')} ${lang.points}',
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          FeatherIcons.helpCircle,
                          color: theme.textTheme.bodyLarge?.color,
                          size: 14,
                        ),
                        const SizedBox(width: SPACE_SMALL),
                        Text(
                          '[-${currencyFormat(
                            args.user.point,
                            symbol: '',
                          )}]',
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(width: SPACE_SMALL),
                        Switch(
                          value: state.isPointActive,
                          onChanged: (v) {
                            if (args.user.point == 0) {
                              showToast(msg: 'Anda belum mempunyai poin!');
                            } else {
                              context
                                  .read<CheckoutFormBloc>()
                                  .add(const CheckoutFormEvent.point());
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: SPACE_MEDIUM),
              Container(
                color: theme.cardColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN,
                  vertical: SPACE_MEDIUM,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lang.payment_method,
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: SPACE_SMALL),
                    if (state.isPaymentListLoading)
                      const ShimmerWidget(
                        child: ShimmerContainerWidget(
                          width: double.infinity,
                          height: 50,
                        ),
                      )
                    else if (state.isPaymentListError)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            lang.error_retrieving_data_try_again,
                            style: theme.textTheme.titleLarge,
                          ),
                          const SizedBox(height: SPACE_SMALL),
                          OutlinedButtonWidget(
                            onTap: () {
                              context.read<CheckoutFormBloc>().add(
                                    const CheckoutFormEvent.getPaymentList(),
                                  );
                            },
                            label: lang.try_again,
                          ),
                        ],
                      )
                    else
                      Column(
                        children: state.paymentList.asMap().entries.map(
                          (e) {
                            return RadioListTile<TransactionPayment>(
                              title: e.value.type == 'internal'
                                  ? RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: state.paymentList[e.key].name,
                                            style: theme.textTheme.titleMedium,
                                          ),
                                          TextSpan(
                                            text:
                                                // ignore: lines_longer_than_80_chars
                                                ' (${lang.balance} ${currencyFormat(args.user.cash)})',
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                        ],
                                      ),
                                    )
                                  : Text(
                                      state.paymentList[e.key].name,
                                      style: theme.textTheme.titleMedium,
                                    ),
                              value: state.paymentList[e.key],
                              groupValue: state.selectedPayment,
                              onChanged: (v) {
                                context
                                    .read<CheckoutFormBloc>()
                                    .add(CheckoutFormEvent.selectPayment(v!));
                              },
                              contentPadding: EdgeInsets.zero,
                              activeColor: theme.primaryColor,
                              visualDensity: VisualDensity.compact,
                            );
                          },
                        ).toList(),
                      ),
                  ],
                ),
              ),
              ElevatedButtonWidget(
                label: lang.order_now,
                margin: const EdgeInsets.all(MARGIN),
                isLoading: state.isSubmit,
                onTap: () {
                  if (state.selectedPayment != null) {
                    if (state.selectedPayment?.type == 'internal' &&
                        args.user.cash < args.total) {
                      showToast(msg: lang.insufficient_balance_for_transaction);
                    } else {
                      context.read<CheckoutFormBloc>().add(
                            CheckoutFormEvent.send(
                              addressId: args.user.address.id,
                              qty: args.qty,
                            ),
                          );
                    }
                  } else {
                    showToast(msg: lang.payment_method_not_selected_yet);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
