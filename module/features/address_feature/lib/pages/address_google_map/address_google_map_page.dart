import 'package:address_feature/pages/address_google_map/widgets/address_google_map_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_arguments/address_argument.dart';
import 'package:shared_libraries/flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_libraries/google_maps_flutter/google_maps_flutter.dart';

class AddressGoogleMapPage extends StatefulWidget {
  const AddressGoogleMapPage({
    required this.args,
    super.key,
  });
  final AddressArgument args;

  @override
  State<AddressGoogleMapPage> createState() => _AddressGoogleMapPageState();
}

class _AddressGoogleMapPageState extends State<AddressGoogleMapPage> {
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
      body: AddressGoogleMapBodyWidget(
        controller: _controller,
        args: widget.args,
      ),
    );
  }
}
