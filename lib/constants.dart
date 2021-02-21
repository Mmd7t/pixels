import 'package:url_launcher/url_launcher.dart';

const List tracksNames = ['CS Track', 'Power Track', 'Mechanical Track'];

const List tracksDiscription = [
  'CS Track\nComputer Science Track',
  'Power Track\nPower Engineering Track',
  'Mechanical Track\nMechanical Engineering Track',
];

const String facebookUrl =
    'https://graph.facebook.com/PixelsEgyptOrg?fields=about,posts{created_time,full_picture,message,message_tags,attachments{media_type,url,description,subattachments,media,title,type}}&access_token=EAAKlONAxwuABAEWpOMVwyTCcJVy8QUxwmrkCFpFedlI0suvZB6OjJ3gvTszgiZBfsp99NZCZAug7uakZBI4qlQHLcPYgTrjquPJU8pfpVMryzLPiJb8KlC952G35jxn7JW3W5qnyNO83WP7P3ZAvgLfZAjuMUL3lCyFIR6gLymG9QZDZD#';

const String csTrackUrl =
    'https://script.google.com/macros/s/AKfycbw6SsPYaeaBsW7tPioaaEbidRtwGFEIGuf9UgIpVRgj-Q2gUMGn0xEP/exec';
const String powerTrackUrl =
    'https://script.google.com/macros/s/AKfycbznQl9P4dNE98pUrbdcrdNZrMM0cC2Lzyc-jUaeGjE0Igeg6bg3U_ojpQ/exec';
const String mechanicalTrackUrl =
    'https://script.google.com/macros/s/AKfycbzwGx8IndHddTgIH5p3eDb1lDvwCKmFRS4ZNxMB3UfqgYDSsfaCmwPV/exec';

Future<void> launchUniversalLink(String url) async {
  if (await canLaunch(url)) {
    final bool nativeAppLaunchSucceeded = await launch(
      url,
      forceSafariVC: false,
      universalLinksOnly: true,
    );
    if (!nativeAppLaunchSucceeded) {
      await launch(url, forceSafariVC: true);
    }
  }
}
