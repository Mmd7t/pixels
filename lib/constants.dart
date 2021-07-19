import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Constants {
  static const List tracksNames = [
    'CS & Comms Track',
    'Power Track',
    'Mechanical Track'
  ];

  static const List tracksDiscription = [
    'CS & Comms Track\nComputer Science & Communications Track',
    'Power Track\nPower Engineering Track',
    'Mechanical Track\nMechanical Engineering Track',
  ];

  static const String facebookUrl =
      'https://graph.facebook.com/PixelsEgyptOrg?fields=about,posts{created_time,full_picture,message,message_tags,attachments{media_type,url,description,subattachments,media,title,type}}&access_token=EAAKlONAxwuABAIh0zqYBoiZCowuZCPK3rwjoy3n4P5kG9DWq7RovwXVP3ZBf9YtDdVrOO0mtUiUm1fy2ZCmycOtayJ75SLBP0mZBJQ2nVmbM3uKtbaNnLHnwNFutSgXgZBKmbRfZCcPnLESF0LdGwh9AhfHC3JVt03tmLYttaQgnQZDZD';

  static const String csTrackUrl =
      'https://script.google.com/macros/s/AKfycbylNc7htZoK5dAJN46e-yxfJD7YnYYmvo2xAdglcQv-YnDtGCH-TG-OGeC4Gx9twLHE/exec';
  static const String powerTrackUrl =
      'https://script.google.com/macros/s/AKfycbznQl9P4dNE98pUrbdcrdNZrMM0cC2Lzyc-jUaeGjE0Igeg6bg3U_ojpQ/exec';
  static const String mechanicalTrackUrl =
      'https://script.google.com/macros/s/AKfycbzwGx8IndHddTgIH5p3eDb1lDvwCKmFRS4ZNxMB3UfqgYDSsfaCmwPV/exec';

  static const List titles = ['We Learn', 'We Make', 'We Share'];
  static const List contents = [
    'Providing you the best courses\nLearning from posts everyday\nDevelop in electronics, mechanics, programming, electricity and energy',
    'Providing workshops\nMaking projects at every course\nJoining committees to make by your own',
    'Sharing the knowledge\nSharing new technology at courses\nSpreading our missions to all community',
  ];

  static Future<void> launchUniversalLink(String url) async {
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

  static final color2 = Colors.pink[800];
}
