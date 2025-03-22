import 'package:authentication_feature/bloc/auth_watcher/auth_watcher_bloc.dart';
import 'package:banner_feature/bloc/banner_watcher/banner_watcher_bloc.dart';
import 'package:bottom_navigator_feature/widgets/profile_dialog_widget.dart';
import 'package:dashboard_feature/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_iconly/flutter_iconly.dart';
import 'package:shared_utilities/toast/toast_util.dart';
import 'package:transaction_feature/pages/transaction_overview/transaction_overview_page.dart';

class BottomNavigatorFeature extends StatefulWidget {
  const BottomNavigatorFeature({required this.index, super.key});
  final int index;

  @override
  State<BottomNavigatorFeature> createState() => _BottomNavigatorFeatureState();
}

class _BottomNavigatorFeatureState extends State<BottomNavigatorFeature> {
  late PageController _controller;
  int _selectedIndex = 0;
  DateTime? _currentBackPressTime;
  bool _willPop = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: widget.index);
    _selectedIndex = widget.index;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        context.read<BannerWatcherBloc>().add(const BannerWatcherEvent.fetch());
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<Widget> _tabView = [
    const DashboardPage(),
    const TransactionOverviewPage(),
  ];

  Future<bool> _willPopCallback(
    BuildContext context, {
    required bool didPop,
  }) async {
    final now = DateTime.now();
    final lang = AppLocalizations.of(context)!;

    if (!didPop) {
      if (_selectedIndex == 0) {
        if (_currentBackPressTime == null ||
            now.difference(_currentBackPressTime!) >
                const Duration(seconds: 4)) {
          _currentBackPressTime = now;
          await showToast(msg: lang.press_again_to_exit);
          setState(() {
            _willPop = true;
          });
          return Future.value(false);
        }
      } else {
        await _controller.animateToPage(
          0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
        );
        return Future.value(false);
      }
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocListener<AuthWatcherBloc, AuthWatcherState>(
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
      child: PopScope(
        canPop: _willPop,
        onPopInvoked: (v) => _willPopCallback(context, didPop: v),
        child: Scaffold(
          body: PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (v) => setState(() {
              _selectedIndex = v;
            }),
            children: _tabView,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            iconSize: 20,
            selectedItemColor: theme.primaryColor,
            selectedIconTheme: theme.iconTheme.copyWith(
              color: theme.primaryColor,
            ),
            selectedLabelStyle: theme.textTheme.titleMedium?.copyWith(
              fontSize: 9,
              color: theme.textTheme.titleMedium?.color,
            ),
            unselectedLabelStyle: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 9,
              color: theme.textTheme.bodyMedium?.color,
            ),
            onTap: (v) {
              if (v == 2) {
                showModalBottomSheet<dynamic>(
                  context: context,
                  backgroundColor: theme.cardColor,
                  isScrollControlled: true,
                  constraints: const BoxConstraints(
                    maxHeight: 600,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(RADIUS),
                      topRight: Radius.circular(RADIUS),
                    ),
                  ),
                  builder: (context) {
                    return const ProfileDialogWidget();
                  },
                );
              } else {
                setState(() {
                  _selectedIndex = v;
                  _controller.animateToPage(
                    v,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  );
                });
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(IconlyLight.home),
                activeIcon: const Icon(IconlyBold.home),
                label: lang.dashboard,
              ),
              BottomNavigationBarItem(
                icon: const Icon(IconlyLight.paper),
                activeIcon: const Icon(IconlyBold.paper),
                label: lang.transaction,
              ),
              BottomNavigationBarItem(
                icon: const Icon(IconlyLight.moreSquare),
                activeIcon: const Icon(IconlyBold.moreSquare),
                label: lang.other,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
