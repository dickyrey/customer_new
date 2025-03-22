import 'package:address_feature/bloc/address_watcher/address_watcher_bloc.dart';
import 'package:address_feature/pages/address_overview/widgets/address_overview_card_widget.dart';
import 'package:authentication_feature/bloc/auth_watcher/auth_watcher_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_widget/empty_body/empty_body_widget.dart';

class AddressOverviewBodyWidget extends StatelessWidget {
  const AddressOverviewBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthWatcherBloc, AuthWatcherState>(
      builder: (context, authState) {
        return authState.maybeMap(
          orElse: () {
            return EmptyBodyWidget(
              type: EmptyBodyType.unauthenticated,
              onTap: () {
                context
                    .read<AuthWatcherBloc>()
                    .add(const AuthWatcherEvent.signOut());
              },
            );
          },
          authenticated: (authState) {
            return BlocBuilder<AddressWatcherBloc, AddressWatcherState>(
              builder: (context, state) {
                return state.maybeMap(
                  orElse: () {
                    return const EmptyBodyWidget(
                      type: EmptyBodyType.address,
                    );
                  },
                  loading: (_) {
                    return const Center(child: CircularProgressIndicator());
                  },
                  loaded: (state) {
                    if (state.addressList.isNotEmpty) {
                      return ListView.builder(
                        itemCount: state.addressList.length,
                        padding: const EdgeInsets.symmetric(
                          horizontal: MARGIN,
                        ),
                        itemBuilder: (context, index) {
                          final data = state.addressList[index];
                          return AddressOverviewCard(
                            isPrimary: authState.user.address.id == data.id,
                            data: data,
                          );
                        },
                      );
                    }
                    return const EmptyBodyWidget(
                      type: EmptyBodyType.address,
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
