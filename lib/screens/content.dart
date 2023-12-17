import 'package:dropbox_integration_sample_flutter/stores/account.dart';
import 'package:flutter/material.dart';

final account = Account();

class ContentPageWidget extends StatefulWidget {
  const ContentPageWidget({super.key});

  @override
  State<ContentPageWidget> createState() => _ContentPageWidgetState();
}

class _ContentPageWidgetState extends State<ContentPageWidget> {
  void _disconnect() async {
    await account.disconnect();
    if (!mounted) return;
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "You have been disconnected from Dropbox",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Content page"),
        actions: [
          IconButton(
            onPressed: _disconnect,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Placeholder(),
        ],
      ),
    );
  }
}
