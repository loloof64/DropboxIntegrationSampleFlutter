import 'dart:io';

import 'package:dropbox_integration_sample_flutter/screens/content.dart';
import 'package:dropbox_integration_sample_flutter/stores/account.dart';
import 'package:flutter/material.dart';
import 'package:oauth2_client/oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';

import 'package:dropbox_integration_sample_flutter/config/dropbox_config.dart';

final account = Account();

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  void connectToDropbox(BuildContext context) async {
    final isWindowsOrLinux = Platform.isLinux || Platform.isWindows;
    const clientId = dropboxAppKey;
    final uriScheme = isWindowsOrLinux
        ? dropboxRedirectSchemeDesktop
        : dropboxRedirectSchemeMobile;
    final callbackUri =
        isWindowsOrLinux ? dropboxRedirectUriDesktop : dropboxRedirectUriMobile;

    final client = OAuth2Client(
      authorizeUrl: 'https://www.dropbox.com/oauth2/authorize',
      tokenUrl: 'https://api.dropboxapi.com/oauth2/token',
      customUriScheme: uriScheme,
      redirectUri: callbackUri,
    );

    final helper = OAuth2Helper(
      client,
      grantType: OAuth2Helper.authorizationCode,
      clientId: clientId,
      scopes: dropboxScopes,
    );
    account.setOauthHelper(helper);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return const ContentPageWidget();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "You have been connected to Dropbox",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropbox Integration'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => connectToDropbox(context),
          child: const Text('Connect to Dropbox'),
        ),
      ),
    );
  }
}
