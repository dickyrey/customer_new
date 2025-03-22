import 'package:authentication_feature/bloc/auth_watcher/auth_watcher_bloc.dart';
import 'package:authentication_feature/pages/widgets/splash_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_common/routes.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthWatcherBloc>().add(const AuthWatcherEvent.check());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthWatcherBloc, AuthWatcherState>(
        listener: (context, state) {
          state.maybeMap(
            orElse: () {},
            authenticated: (state) {
              if (state.user.name != '') {
                return goNextRoute(Routes.dashboard);
              } else {
                return goNextRoute(Routes.signUp);
              }
            },
            authInFailure: (_) {
              return goNextRoute(Routes.onBoarding);
            },
            notAuthenticated: (value) {
              return goNextRoute(Routes.onBoarding);
            },
          );
        },
        child: const SplashBody(),
      ),
    );
  }

  Future<void> goNextRoute(String path) async {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            path,
            (Route<dynamic> route) => false,
          );
        }
      },
    );
  }
}
