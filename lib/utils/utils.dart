import 'package:flutter/material.dart';
import 'package:qrreader/models/db_provider.dart';
import 'package:url_launcher/url_launcher.dart';

Future launchURL(ScanModel scan, BuildContext context) async {
  Uri _url = Uri.parse(scan.valor);
  if (scan.tipo == 'http') {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    } else {
      launchUrl(_url);
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}
