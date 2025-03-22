import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_utilities/toast/toast_util.dart';
import 'package:transaction_feature/bloc/transaction_watcher/transaction_watcher_bloc.dart';
import 'package:transaction_feature/pages/transaction_overview/widgets/transaction_overview_body_widget.dart';

class TransactionOverviewPage extends StatefulWidget {
  const TransactionOverviewPage({super.key});

  @override
  State<TransactionOverviewPage> createState() =>
      _TransactionOverviewPageState();
}

class _TransactionOverviewPageState extends State<TransactionOverviewPage> {
  late ScrollController _controller;
  bool _hasReachedMax = false;
  int _selectedFilter = 0;

  List<String> _orderFilterList(BuildContext context) {
    return [
      'Semua',
      'Dikirim',
      'Selesai',
    ];
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.pixels >= _controller.position.maxScrollExtent) {
        if (_hasReachedMax == false) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<TransactionWatcherBloc>().add(
                  TransactionWatcherEvent.next(_selectedFilter),
                );
          });
        }
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<TransactionWatcherBloc>()
          .add(TransactionWatcherEvent.fetch(_selectedFilter));
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocListener<TransactionWatcherBloc, TransactionWatcherState>(
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
          loaded: (state) {
            if (state.hasReachedMax) {
              setState(() {
                _hasReachedMax = state.hasReachedMax;
              });
            }
          },
        );
      },
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: SPACE_VERY_LARGE),
              color: theme.cardColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    lang.all_transaction,
                    style: theme.textTheme.headlineMedium,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(
                      MARGIN,
                      SPACE_MEDIUM,
                      MARGIN,
                      SPACE_MEDIUM,
                    ),
                    width: double.infinity,
                    height: 70,
                    child: ListView.builder(
                      itemCount: _orderFilterList(context).length,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final data = _orderFilterList(context)[index];

                        return Padding(
                          padding: const EdgeInsets.only(right: SPACE_MEDIUM),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedFilter = index;
                                _hasReachedMax = false;
                              });
                              context.read<TransactionWatcherBloc>().add(
                                    TransactionWatcherEvent.fetch(
                                      _selectedFilter,
                                    ),
                                  );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                horizontal: SPACE_SMALL,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: theme.primaryColor),
                                borderRadius: BorderRadius.circular(RADIUS),
                                color: _selectedFilter == index
                                    ? theme.primaryColor
                                    : theme.cardColor,
                              ),
                              child: Row(
                                children: [
                                  Visibility(
                                    visible: index == _selectedFilter,
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.only(right: SPACE_SMALL),
                                      child: Icon(
                                        FeatherIcons.grid,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data,
                                    style: theme.textTheme.titleLarge?.copyWith(
                                      color: index == _selectedFilter
                                          ? Colors.white
                                          : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TransactionOverviewBodyWidget(
                controller: _controller,
                hasReachedMax: _hasReachedMax,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
