import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/constants/icon_constants.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/cached_network_image/cached_network_image.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_libraries/flutter_svg/flutter_svg.dart';
import 'package:shared_libraries/url_launcher/url_launcher.dart';
import 'package:shared_utilities/capitalize_each_word_format/capitalize_each_word_format_util.dart';
import 'package:shared_utilities/currency_format/currency_format_util.dart';
import 'package:shared_utilities/toast/toast_util.dart';
import 'package:shared_widget/alert_dialog/alert_dialog.dart';
import 'package:shared_widget/elevated_button/elevated_button_widget.dart';
import 'package:shared_widget/empty_body/empty_body_widget.dart';
import 'package:transaction_feature/bloc/transaction_cancel_actor/transaction_cancel_actor_bloc.dart';
import 'package:transaction_feature/bloc/transaction_confirm_actor/transaction_confirm_actor_bloc.dart';
import 'package:transaction_feature/bloc/transaction_detail_watcher/transaction_detail_watcher_bloc.dart';

class TransactionDetailBodyWidget extends StatelessWidget {
  const TransactionDetailBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    String statusLabel(String v) {
      switch (v) {
        case 'pending':
          return lang.transaction_status_pending;
        case 'waiting':
          return lang.transaction_status_waiting;
        case 'delivery':
          return lang.transaction_status_delivery;
        case 'success':
          return lang.transaction_status_success;
        case 'failed':
          return lang.transaction_status_failed;

        default:
          return lang.transaction_status_failed;
      }
    }

    return BlocBuilder<TransactionDetailWatcherBloc,
        TransactionDetailWatcherState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () {
            return const Center(child: CircularProgressIndicator());
          },
          error: (state) {
            return const EmptyBodyWidget(
              type: EmptyBodyType.transaction,
            );
          },
          loaded: (state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(MARGIN),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lang.shipping_destination,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: SPACE_SMALL),
                  Card(
                    margin: EdgeInsets.zero,
                    elevation: 5,
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
                            color: theme.primaryColor,
                            size: 20,
                          ),
                          const SizedBox(width: SPACE_MEDIUM),
                          Expanded(
                            child: Text(
                              state.transaction.address,
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: SPACE_MEDIUM),
                  Text(
                    lang.purchase_detail,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: SPACE_SMALL),
                  Card(
                    margin: EdgeInsets.zero,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: SPACE_MEDIUM,
                        vertical: SPACE_SMALL,
                      ),
                      child: Column(
                        children: [
                          _ListTile(
                            title: '${lang.order_id} :',
                            trailing: '${state.transaction.id}',
                          ),
                          _ListTile(
                            title: '${lang.status} :',
                            trailing: statusLabel(state.transaction.status),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: SPACE_TINY - 3,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${lang.payment} :',
                                  style: theme.textTheme.titleLarge,
                                ),
                                const Spacer(),
                                SvgPicture.network(
                                  state.transaction.payment.image,
                                  height: 20,
                                ),
                                const SizedBox(width: SPACE_SMALL),
                                Text(
                                  state.transaction.payment.name,
                                  style: theme.textTheme.labelLarge,
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: state.transaction.review != '',
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: SPACE_TINY - 3,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${lang.review} :',
                                    style: theme.textTheme.titleLarge,
                                  ),
                                  const Spacer(),
                                  const SizedBox(width: SPACE_SMALL),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          state.transaction.review,
                                          style: theme.textTheme.labelLarge,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            showDialog<dynamic>(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  content: Text(
                                                    state.transaction.review,
                                                    textAlign: TextAlign.center,
                                                    style: theme
                                                        .textTheme.titleLarge,
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Text(
                                            lang.see_all,
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                              color: theme.primaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(thickness: 1.5),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: state.transaction.productList.map(
                              (e) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: SPACE_TINY,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 70,
                                        width: 70,
                                        child: SvgPicture.asset(
                                          AssetIcons.gallon,
                                        ),
                                      ),
                                      const SizedBox(width: SPACE_MEDIUM),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              capitalizeEachWordFormat(e.name),
                                              style:
                                                  theme.textTheme.headlineSmall,
                                            ),
                                            const Divider(thickness: 1.5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${lang.amount} :',
                                                  style: theme
                                                      .textTheme.bodyMedium,
                                                ),
                                                Text(
                                                  '${e.amount} ${lang.galon}',
                                                  style: theme
                                                      .textTheme.titleMedium,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: SPACE_TINY),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${lang.total} :',
                                                  style: theme
                                                      .textTheme.bodyMedium,
                                                ),
                                                Text(
                                                  currencyFormat(e.total),
                                                  style: theme
                                                      .textTheme.headlineSmall
                                                      ?.copyWith(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                          const SizedBox(height: SPACE_TINY),
                          _ListTile(
                            title: lang.subtotal,
                            currency: state.transaction.subTotal,
                          ),
                          _ListTile(
                            title: lang.unique_code,
                            currency: state.transaction.uniqueCode,
                          ),
                          const Divider(thickness: 1.5),
                          _ListTile(
                            title: lang.total_payment,
                            currency: state.transaction.total,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: SPACE_LARGE),
                  Visibility(
                    visible: state.transaction.sales.id != 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          lang.sales,
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: SPACE_SMALL),
                        Card(
                          margin: EdgeInsets.zero,
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: SPACE_MEDIUM,
                              vertical: SPACE_SMALL,
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: theme.hintColor,
                                  backgroundImage: CachedNetworkImageProvider(
                                    state.transaction.sales.image,
                                  ),
                                ),
                                const SizedBox(width: SPACE_MEDIUM),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              state.transaction.sales.name,
                                              style: theme.textTheme.titleLarge,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.star,
                                            color: Color(0xFFE69B00),
                                          ),
                                          Text(
                                            state.transaction.sales.rating
                                                .toString(),
                                            style: theme.textTheme.titleLarge,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: SPACE_TINY),
                                      Row(
                                        children: [
                                          Icon(
                                            FeatherIcons.phoneCall,
                                            size: 15,
                                            color: theme.primaryColor,
                                          ),
                                          const SizedBox(width: SPACE_SMALL),
                                          Text(
                                            state.transaction.sales.phone,
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: SPACE_MEDIUM),
                                InkWell(
                                  onTap: () async {
                                    final whatsappUrl = Uri.parse(
                                      'whatsapp://send?phone=+${state.transaction.sales.phone}',
                                    );
                                    if (await canLaunchUrl(whatsappUrl)) {
                                      await launchUrl(whatsappUrl);
                                    } else {
                                      await showToast(
                                        msg: lang.whatsapp_not_installed,
                                      );
                                    }
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: const Color(0xFF128c7e),
                                    child: SvgPicture.asset(
                                      AssetIcons.waWhite,
                                      width: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: SPACE_LARGE),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: state.transaction.status == 'pending',
                    child: ElevatedButtonWidget(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.payment,
                          arguments: state.transaction,
                        );
                      },
                      label: lang.pay_now,
                    ),
                  ),
                  Visibility(
                    visible: state.transaction.status == 'pending',
                    child: Padding(
                      padding: const EdgeInsets.only(top: SPACE_MEDIUM),
                      child: ElevatedButtonWidget(
                        onTap: () {
                          showConfirmationDialog(
                            context,
                            title: lang.are_you_sure_cancel_transaction,
                            primaryButtonLabel: lang.yes,
                            onPrimaryButtonTap: () {
                              context.read<TransactionCancelActorBloc>().add(
                                    TransactionCancelActorEvent.cancel(
                                      state.transaction.id,
                                    ),
                                  );
                              Navigator.pop(context);
                            },
                          );
                        },
                        label: lang.cancel_transaction,
                        color: theme.colorScheme.error,
                      ),
                    ),
                  ),
                  BlocBuilder<TransactionConfirmActorBloc,
                      TransactionConfirmActorState>(
                    builder: (context, confirmState) {
                      return confirmState.maybeMap(
                        orElse: () {
                          return Visibility(
                            visible: state.transaction.status == 'delivery',
                            child: ElevatedButtonWidget(
                              onTap: () {
                                showConfirmationDialog(
                                  context,
                                  title: lang.confirm_order_complete,
                                  primaryButtonLabel: lang.done,
                                  onPrimaryButtonTap: () {
                                    Navigator.pop(context);
                                    context
                                        .read<TransactionConfirmActorBloc>()
                                        .add(
                                          TransactionConfirmActorEvent.confirm(
                                            state.transaction.id,
                                          ),
                                        );
                                  },
                                );
                              },
                              label: lang.confirm_order,
                            ),
                          );
                        },
                        loading: (value) {
                          return Visibility(
                            visible: state.transaction.status == 'delivery',
                            child: ElevatedButtonWidget(
                              onTap: () {},
                              label: lang.confirm_order,
                              isLoading: true,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    required this.title,
    this.trailing = '',
    this.currency = 0,
  });

  final String title;
  final String trailing;
  final int currency;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: SPACE_TINY - 3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.titleLarge,
          ),
          Text(
            currency != 0 ? currencyFormat(currency) : trailing,
            style: theme.textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
