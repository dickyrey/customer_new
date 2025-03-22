import 'package:dashboard_feature/bloc/order_counter_form/order_counter_form_bloc.dart';
import 'package:dashboard_feature/pages/widgets/dashboard_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/onesignal_flutter/onesignal_flutter.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<OrderCounterFormBloc>()
          .add(const OrderCounterFormEvent.getStock());
    });
    requestNotificationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DashboardBodyWidget(),
    );
  }

  Future<void> requestNotificationPermission() async {
    await OneSignal.Notifications.requestPermission(true);
  }
}
