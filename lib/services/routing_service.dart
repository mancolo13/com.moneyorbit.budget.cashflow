import 'dart:developer' as developer;
import 'package:url_launcher/url_launcher.dart';

class RoutingService {
  static const String defaultRegistrationUrl = 'https://applinkgo.com/srf2PnRD';

  static Future<bool> openRegistrationUrl([String? url]) async {
    final target = url ?? defaultRegistrationUrl;
    try {
      final uri = Uri.parse(target);
      if (await canLaunchUrl(uri)) {
        return await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
      return false;
    } catch (e) {
      developer.log('Error opening external registration URL: $e', name: 'RoutingService');
      return false;
    }
  }

  static Future<bool> openPartnerLink([String? url]) async {
    return openRegistrationUrl(url);
  }
}
