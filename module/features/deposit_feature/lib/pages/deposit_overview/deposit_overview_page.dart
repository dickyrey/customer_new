import 'package:deposit_feature/bloc/deposit_watcher/deposit_watcher_bloc.dart';
import 'package:deposit_feature/pages/deposit_overview/widgets/deposit_overview_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/exception_message.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_utilities/toast/toast_util.dart';

class DepositOverviewPage extends StatefulWidget {
  const DepositOverviewPage({super.key});

  @override
  State<DepositOverviewPage> createState() => _DepositOverviewPageState();
}

class _DepositOverviewPageState extends State<DepositOverviewPage> {
  late ScrollController _controller;
  bool _hasReachedMax = false;
  int _selectedFilter = 0;

  List<String> _orderFilterList(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return [
      lang.all,
      lang.deposit_status_pending,
      lang.deposit_status_success,
      lang.deposit_status_failed,
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
            context.read<DepositWatcherBloc>().add(
                  DepositWatcherEvent.next(_selectedFilter),
                );
          });
        }
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<DepositWatcherBloc>()
          .add(DepositWatcherEvent.fetch(_selectedFilter));
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocListener<DepositWatcherBloc, DepositWatcherState>(
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
        appBar: AppBar(
          backgroundColor: theme.cardColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(FeatherIcons.arrowLeft),
          ),
          title: Text(
            lang.deposit_history,
            style: theme.textTheme.headlineMedium,
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Row(
            children: [
              const Icon(
                FeatherIcons.plus,
                color: Colors.white,
              ),
              const SizedBox(width: SPACE_SMALL),
              Text(
                lang.add_deposit,
                style:
                    theme.textTheme.titleLarge?.copyWith(color: Colors.white),
              ),
            ],
          ),
          backgroundColor: theme.primaryColor,
          onPressed: () {
            Navigator.pushNamed(
              context,
              Routes.depositTopUp,
            );
          },
        ),
        body: Column(
          children: [
            ColoredBox(
              color: theme.cardColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                              context.read<DepositWatcherBloc>().add(
                                    DepositWatcherEvent.fetch(
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
              child: DepositOverviewBodyWidget(
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
