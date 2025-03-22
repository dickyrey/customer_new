import 'package:banner_feature/bloc/banner_detail_watcher/banner_detail_watcher_bloc.dart';
import 'package:banner_feature/pages/banner_detail/widgets/banner_detail_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';

class BannerDetailPage extends StatefulWidget {
  const BannerDetailPage({
    required this.args,
    super.key,
  });
  final int args;

  @override
  State<BannerDetailPage> createState() => _BannerDetailPageState();
}

class _BannerDetailPageState extends State<BannerDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BannerDetailWatcherBloc>().add(
            BannerDetailWatcherEvent.fetch(
              widget.args,
            ),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            FeatherIcons.arrowLeft,
            color: theme.iconTheme.color,
          ),
        ),
      ),
      body: const BannerDetailBodyWidget(),
    );
  }
}
