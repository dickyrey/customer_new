import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_arguments/address_argument.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_libraries/google_maps_flutter/google_maps_flutter.dart';
import 'package:signup_feature/pages/signup_google_map/widgets/signup_google_map_body_widget.dart';

class SignupGoogleMap extends StatefulWidget {
  const SignupGoogleMap({
    required this.args,
    super.key,
  });
  final AddressArgument args;

  @override
  State<SignupGoogleMap> createState() => _SignupGoogleMapState();
}

class _SignupGoogleMapState extends State<SignupGoogleMap> {
  final ValueNotifier<GoogleMapController?> _controller =
      ValueNotifier<GoogleMapController?>(null);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lang = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(FeatherIcons.arrowLeft),
          color: theme.iconTheme.color,
        ),
        title: Text(
          lang.select_accurate_location,
          style: theme.textTheme.headlineMedium,
        ),
      ),
      body: SignupGoogleMapBodyWidget(
        controller: _controller,
        args: widget.args,
      ),
    );
  }
}
