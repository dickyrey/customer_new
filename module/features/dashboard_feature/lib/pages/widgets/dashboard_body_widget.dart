import 'package:authentication_feature/bloc/auth_watcher/auth_watcher_bloc.dart';
import 'package:banner_feature/bloc/banner_watcher/banner_watcher_bloc.dart';
import 'package:dashboard_feature/bloc/order_counter_form/order_counter_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_arguments/checkout_argument.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/constants/icon_constants.dart';
import 'package:shared_common/enums.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/cached_network_image/cached_network_image.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_libraries/flutter_svg/flutter_svg.dart';
import 'package:shared_libraries/flutter_swiper_view/flutter_swiper_view.dart';
import 'package:shared_libraries/url_launcher/url_launcher.dart';
import 'package:shared_utilities/currency_format/currency_format_util.dart';
import 'package:shared_utilities/toast/toast_util.dart';
import 'package:shared_widget/elevated_button/elevated_button_widget.dart';
import 'package:shared_widget/shimmer/shimmer_widget.dart';

class DashboardBodyWidget extends StatelessWidget {
  const DashboardBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            MARGIN,
            SPACE_VERY_LARGE,
            MARGIN,
            SPACE_MEDIUM,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: BlocBuilder<AuthWatcherBloc, AuthWatcherState>(
                      builder: (context, state) {
                        return state.maybeMap(
                          orElse: () {
                            return const ShimmerWidget(
                              child: ShimmerContainerWidget(),
                            );
                          },
                          authenticated: (state) {
                            return Row(
                              children: [
                                Text(
                                  '${lang.hello}, ${state.user.name}!',
                                  style: theme.textTheme.headlineMedium,
                                ),
                                const SizedBox(width: SPACE_MEDIUM),
                                Visibility(
                                  visible: state.user.isReseller,
                                  child: const Icon(
                                    FeatherIcons.checkCircle,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: SPACE_MEDIUM),
                  CircleAvatar(
                    backgroundColor: theme.cardColor,
                    radius: 25,
                    child: IconButton(
                      color: theme.textTheme.titleLarge?.color,
                      icon: const Icon(FeatherIcons.bell),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.notification,
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: SPACE_MEDIUM),
              BlocBuilder<AuthWatcherBloc, AuthWatcherState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () {
                      return const ShimmerWidget(
                        child: Row(
                          children: [
                            Expanded(child: ShimmerContainerWidget(height: 50)),
                            SizedBox(width: SPACE_MEDIUM),
                            Expanded(child: ShimmerContainerWidget(height: 50)),
                          ],
                        ),
                      );
                    },
                    authenticated: (state) {
                      return Row(
                        children: [
                          _PoinAndDepositCardWidget(
                            value: state.user.point,
                            isPoin: true,
                            onTap: () {},
                          ),
                          const SizedBox(width: SPACE_MEDIUM),
                          _PoinAndDepositCardWidget(
                            value: state.user.cash,
                            isPoin: false,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.deposit,
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: SPACE_MEDIUM),
              BlocBuilder<AuthWatcherBloc, AuthWatcherState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () {
                      return const ShimmerWidget(
                        child: ShimmerContainerWidget(
                          height: 55,
                          width: double.infinity,
                        ),
                      );
                    },
                    authenticated: (state) {
                      return InkWell(
                        borderRadius: BorderRadius.circular(RADIUS),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.address,
                            arguments: state.user,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: SPACE_MEDIUM,
                            vertical: SPACE_SMALL,
                          ),
                          decoration: BoxDecoration(
                            color: theme.primaryColor.withOpacity(
                              .2,
                            ),
                            borderRadius: BorderRadius.circular(RADIUS),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                FeatherIcons.mapPin,
                                color: theme.primaryColor,
                                size: 25,
                              ),
                              const SizedBox(width: SPACE_MEDIUM),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      lang.delivery_address,
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                    Text(
                                      state.user.address.id == 0
                                          ? lang.select_primary_address_now
                                          // ignore: lines_longer_than_80_chars
                                          : '${state.user.address.street.street} ${state.user.address.address}',
                                      style: theme.textTheme.titleMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: SPACE_MEDIUM),
                              Icon(
                                FeatherIcons.chevronRight,
                                color: theme.textTheme.titleLarge?.color,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<BannerWatcherBloc, BannerWatcherState>(
                  builder: (context, state) {
                    return state.maybeMap(
                      orElse: () {
                        return const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MARGIN,
                          ),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: ShimmerWidget(
                              child: ShimmerContainerWidget(),
                            ),
                          ),
                        );
                      },
                      loaded: (state) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: MARGIN,
                          ),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Swiper(
                              itemCount: state.bannerList.length,
                              autoplay: true,
                              pagination: const SwiperPagination(
                                alignment: Alignment.bottomCenter,
                                margin: EdgeInsets.only(bottom: SPACE_TINY),
                                builder: SwiperPagination.rect,
                              ),
                              itemBuilder: (context, index) {
                                final data = state.bannerList[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.bannerDetail,
                                      arguments: data.id,
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(RADIUS),
                                      image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: CachedNetworkImageProvider(
                                          data.image,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: SPACE_LARGE),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: MARGIN,
                    ),
                    child: Text(
                      lang.how_many_do_you_want_to_order_today,
                      style: theme.textTheme.headlineMedium,
                    ),
                  ),
                ),
                const SizedBox(height: SPACE_MEDIUM),
                BlocBuilder<OrderCounterFormBloc, OrderCounterFormState>(
                  builder: (context, state) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: MARGIN,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: SPACE_MEDIUM,
                        vertical: SPACE_SMALL,
                      ),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(RADIUS),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: SvgPicture.asset(AssetIcons.gallon),
                              ),
                              const SizedBox(width: SPACE_MEDIUM),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${lang.total} :',
                                          style: theme.textTheme.titleLarge,
                                        ),
                                        Text(
                                          currencyFormat(state.totalPrice),
                                          style: theme.textTheme.headlineMedium,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: SPACE_MEDIUM),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${lang.amount} :',
                                            style: theme.textTheme.titleLarge,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            context
                                                .read<OrderCounterFormBloc>()
                                                .add(
                                                  const OrderCounterFormEvent
                                                      .decreaseQty(),
                                                );
                                          },
                                          child: CircleAvatar(
                                            backgroundColor: theme.primaryColor,
                                            radius: 20,
                                            child: const Icon(
                                              FeatherIcons.minus,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: SPACE_MEDIUM),
                                        Text(
                                          state.qty.toString(),
                                          style: theme.textTheme.headlineMedium,
                                        ),
                                        const SizedBox(width: SPACE_MEDIUM),
                                        InkWell(
                                          onTap: () {
                                            context
                                                .read<OrderCounterFormBloc>()
                                                .add(
                                                  const OrderCounterFormEvent
                                                      .increaseQty(),
                                                );
                                          },
                                          child: CircleAvatar(
                                            backgroundColor: theme.primaryColor,
                                            radius: 20,
                                            child: const Icon(
                                              FeatherIcons.plus,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: SPACE_MEDIUM),
                          BlocBuilder<AuthWatcherBloc, AuthWatcherState>(
                            builder: (context, auth) {
                              return auth.maybeMap(
                                orElse: () {
                                  return ElevatedButtonWidget(
                                    onTap: () {},
                                    isLoading: true,
                                  );
                                },
                                authenticated: (auth) {
                                  return ElevatedButtonWidget(
                                    onTap: () {
                                      // final result = [
                                      //   {'id': 1, 'amount': state.qty},
                                      //   {'id': 2, 'amount': 0},
                                      // ];

                                      if (auth.user.address.id != 0) {
                                        Navigator.pushNamed(
                                          context,
                                          Routes.checkout,
                                          arguments: CheckoutArgument(
                                            qty: state.qty,
                                            total: state.totalPrice,
                                            user: auth.user,
                                          ),
                                        );
                                      } else {
                                        showToast(
                                          msg: lang.select_primary_address_now,
                                        );
                                      }
                                    },
                                    label: lang.order_now,
                                    isLoading:
                                        state.state == RequestState.loading,
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: SPACE_LARGE),
                Text(
                  lang.any_issues_or_questions,
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: SPACE_MEDIUM),
                ElevatedButtonWidget(
                  onTap: () => openWhatsApp(context),
                  // onTap: () async {
                  //   if (!await launchUrl(
                  //     Uri.parse(WHATSAPP_ADMIN),
                  //     mode: LaunchMode.externalApplication,
                  //   )) {
                  //     await showToast(
                  //       msg: lang.whatsapp_not_installed,
                  //     );
                  //     throw Exception('Could not launch');
                  //   }
                  //   // final whatsappUrl = Uri.parse(WHATSAPP_ADMIN);
                  //   // if (await canLaunchUrl(whatsappUrl)) {
                  //   //   await launchUrl(whatsappUrl);
                  //   // } else {
                  //   //   await showToast(
                  //   //     msg: lang.whatsapp_not_installed,
                  //   //   );
                  //   // }
                  // },

                  color: const Color(0xFF128c7e),
                  margin: const EdgeInsets.symmetric(
                    horizontal: MARGIN,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AssetIcons.waWhite,
                        height: 30,
                      ),
                      const SizedBox(width: SPACE_MEDIUM),
                      Text(
                        lang.contact_us,
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: SPACE_VERY_LARGE),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> openWhatsApp(BuildContext context) async {
    final url = Uri.parse(WHATSAPP_ADMIN);
    final lang = AppLocalizations.of(context)!;
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        await showToast(msg: lang.whatsapp_not_installed);
        throw Exception('Could not launch WhatsApp');
      }
    } catch (e) {
      await showToast(msg: lang.whatsapp_not_installed);
    }
  }
}

class _PoinAndDepositCardWidget extends StatelessWidget {
  const _PoinAndDepositCardWidget({
    required this.value,
    required this.isPoin,
    required this.onTap,
  });

  final int value;
  final bool isPoin;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: SPACE_SMALL,
          vertical: SPACE_SMALL - 5,
        ),
        decoration: BoxDecoration(
          color: isPoin ? theme.primaryColor : Colors.cyan,
          borderRadius: BorderRadius.circular(RADIUS),
        ),
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              SvgPicture.asset(
                isPoin ? AssetIcons.point : AssetIcons.deposit,
                width: 25,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: SPACE_MEDIUM),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isPoin ? 'Poin' : 'Deposit',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      currencyFormat(value, symbol: isPoin ? '' : 'Rp'),
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
