import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(url) async {
  final Uri uri = Uri.parse(url);
  await launchUrl(uri);
  // if (!await launchUrl(uri)) {
  //   throw Exception('Could not launch $url');
  // }
}
