import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:medium_clone/main.dart';

/// A helper class for listening for dynamic links.
class DeeplinkHelper {
  final dynamicLinks = FirebaseDynamicLinks.instance;

  /// Adds a lister for dynamic links. Also checks for any pending dynamic links.
  Future<void> addDynamicLinkListener(Function(Uri deeplink) onLink) async {
    // we don't need to add listener for web, web already handles urls.
    if (kIsWeb) return;

    dynamicLinks.onLink(onSuccess: (PendingDynamicLinkData? dynamicLink) async {
      final Uri? deepLink = dynamicLink?.link;

      if (deepLink != null) {
        logger.i('New deeplink received.');
        logger.d(deepLink);
        onLink(deepLink);
      }
    }, onError: (OnLinkErrorException e) async {
      logger.e('onLinkError');
      logger.e(e.message);
    });
  }

  /// Function to retrieve app launch deeplink
  Future<Uri?> getAppLaunchDeeplink() async {
    final PendingDynamicLinkData? data = await dynamicLinks.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      logger.i('Pending deeplink received.');
      logger.d(deepLink);
      return deepLink;
    } else {
      return null;
    }
  }
}
