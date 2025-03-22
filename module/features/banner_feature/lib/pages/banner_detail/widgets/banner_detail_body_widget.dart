import 'package:banner_feature/bloc/banner_detail_watcher/banner_detail_watcher_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_libraries/cached_network_image/cached_network_image.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:shared_libraries/url_launcher/url_launcher.dart';
import 'package:shared_widget/elevated_button/elevated_button_widget.dart';
import 'package:shared_widget/empty_body/empty_body_widget.dart';

class BannerDetailBodyWidget extends StatelessWidget {
  const BannerDetailBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocBuilder<BannerDetailWatcherBloc, BannerDetailWatcherState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () {
            return const Center(child: CircularProgressIndicator());
          },
          failed: (_) {
            return const EmptyBodyWidget(
              type: EmptyBodyType.error,
            );
          },
          loaded: (state) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: MARGIN,
                vertical: SPACE_SMALL,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(RADIUS),
                      child: CachedNetworkImage(
                        imageUrl: state.banner.image,
                        fit: BoxFit.contain,
                        // errorWidget: (context, url, error) {
                        //   return Image.asset(AssetImages.refreshLogoImg);
                        // },
                      ),
                    ),
                    const SizedBox(height: SPACE_LARGE),
                    Text(
                      state.banner.title,
                      style: theme.textTheme.headlineMedium,
                    ),
                    const SizedBox(height: SPACE_MEDIUM),
                    HtmlWidget(
                      state.banner.content,
                      textStyle: theme.textTheme.titleLarge,
                    ),
                    const SizedBox(height: SPACE_MEDIUM),
                    Visibility(
                      visible: state.banner.url.isNotEmpty,
                      child: ElevatedButtonWidget(
                        onTap: () async {
                          if (!await launchUrl(
                            Uri.parse(state.banner.url),
                            mode: LaunchMode.externalApplication,
                          )) {
                            throw Exception('Could not launch ');
                          }
                        },
                        label: lang.see_more,
                      ),
                    ),
                    const SizedBox(height: MARGIN),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
