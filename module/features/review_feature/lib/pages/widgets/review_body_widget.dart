import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:review_feature/bloc/review_form/review_form_bloc.dart';
import 'package:review_feature/bloc/review_transaction_watcher/review_transaction_watcher_bloc.dart';
import 'package:shared_common/constants.dart';
import 'package:shared_libraries/cached_network_image/cached_network_image.dart';
import 'package:shared_libraries/flutter_bloc/flutter_bloc.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_libraries/flutter_rating_stars/flutter_rating_stars.dart';
import 'package:shared_libraries/intl/intl.dart';
import 'package:shared_utilities/capitalize_each_word_format/capitalize_each_word_format_util.dart';
import 'package:shared_utilities/toast/toast_util.dart';
import 'package:shared_widget/elevated_button/elevated_button_widget.dart';
import 'package:shared_widget/text_form_field/text_form_field_widget.dart';

class ReviewBodyWidget extends StatelessWidget {
  const ReviewBodyWidget({
    required this.args,
    super.key,
  });

  final int args;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return BlocBuilder<ReviewTransactionWatcherBloc,
        ReviewTransactionWatcherState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () {
            return const Center(child: CircularProgressIndicator());
          },
          loaded: (state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: theme.cardColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: MARGIN,
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
                        const SizedBox(width: SPACE_SMALL),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.transaction.sales.name,
                                style: theme.textTheme.titleLarge,
                              ),
                              // const SizedBox(height: SPACE_TINY - 3),
                              // Text(
                              //   'Sales',
                              //   style: theme.textTheme.bodyMedium,
                              // ),
                            ],
                          ),
                        ),
                        const SizedBox(width: SPACE_SMALL),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        const SizedBox(width: SPACE_TINY),
                        Text(
                          state.transaction.sales.rating.toString(),
                          style: theme.textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: SPACE_SMALL),
                  Container(
                    color: theme.cardColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: MARGIN,
                      vertical: SPACE_SMALL,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                lang.order_id,
                                style: theme.textTheme.titleLarge,
                              ),
                            ),
                            Text(
                              state.transaction.id.toString(),
                              style: theme.textTheme.bodyLarge,
                            ),
                            IconButton(
                              onPressed: () {
                                Clipboard.setData(
                                  ClipboardData(
                                    text: state.transaction.id.toString(),
                                  ),
                                );
                                showToast(
                                  msg: lang.successfully_copied,
                                );
                              },
                              icon: const Icon(FeatherIcons.copy),
                              iconSize: 20,
                              visualDensity: VisualDensity.compact,
                              color: theme.primaryColor,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                lang.date,
                                style: theme.textTheme.titleLarge,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMEd('id-ID').format(
                                state.transaction.createdAt,
                              ),
                              style: theme.textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: SPACE_SMALL),
                  BlocBuilder<ReviewFormBloc, ReviewFormState>(
                    builder: (context, reviewState) {
                      return Container(
                        color: theme.cardColor,
                        padding: const EdgeInsets.symmetric(
                          horizontal: MARGIN,
                          vertical: SPACE_SMALL,
                        ),
                        child: Column(
                          children: [
                            Text(
                              capitalizeEachWordFormat(lang.review_title),
                              style: theme.textTheme.titleLarge,
                            ),
                            const SizedBox(height: SPACE_MEDIUM),
                            Text(
                              lang.review_subtitle,
                              style: theme.textTheme.bodyMedium,
                            ),
                            const SizedBox(height: SPACE_LARGE),
                            RatingStars(
                              value: reviewState.value,
                              onValueChanged: (v) {
                                context
                                    .read<ReviewFormBloc>()
                                    .add(ReviewFormEvent.starsOnChanged(v));
                              },
                              starBuilder: (index, color) => Icon(
                                Icons.star,
                                color: color,
                                size: 35,
                              ),
                              starSize: 35,
                              maxValueVisibility: false,
                              valueLabelVisibility: false,
                            ),
                            const SizedBox(height: SPACE_LARGE),
                            TextFormFieldWidget(
                              hintText: lang.provide_your_review,
                              maxLines: null,
                              maxLength: 500,
                              textCapitalization: TextCapitalization.sentences,
                              onChanged: (v) {
                                context
                                    .read<ReviewFormBloc>()
                                    .add(ReviewFormEvent.reviewOnChanged(v));
                              },
                            ),
                            const SizedBox(height: SPACE_LARGE),
                            ElevatedButtonWidget(
                              onTap: () {
                                context
                                    .read<ReviewFormBloc>()
                                    .add(ReviewFormEvent.send(args));
                              },
                              label: lang.done,
                              isLoading: reviewState.isSubmit,
                            ),
                          ],
                        ),
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
