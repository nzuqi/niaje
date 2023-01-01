import 'package:flutter/material.dart';
import 'package:niaje/util/common.dart';
import 'settings_controller.dart';

class SettingsView extends StatefulWidget {
  final SettingsController controller;
  static const routeName = '/settings';
  const SettingsView({Key? key, required this.controller}) : super(key: key);
  @override
  SettingsViewState createState() => SettingsViewState();
}

class SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PopupMenuButton(
              onSelected: (ThemeMode value) async {
                widget.controller.updateThemeMode(value);
              },
              offset: Offset.fromDirection(1.0),
              tooltip: "",
              // initialValue: widget.controller.themeMode,
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: ThemeMode.system,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        "System theme",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: ThemeMode.light,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        "Light theme",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: ThemeMode.dark,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        "Dark theme",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              child: ListTile(
                title: const Text(
                  "Theme",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  widget.controller.themeMode.name.toCapitalized(),
                  style: const TextStyle(),
                ),
                trailing: const Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                  child: Icon(
                    Icons.keyboard_arrow_right,
                  ),
                ),
              ),
            ),
            // SwitchListTile(
            //   title: const Text(
            //     "Xxx xxxx xx",
            //     style: TextStyle(
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            //   subtitle: const Text(
            //     "Enabled",
            //   ),
            //   value: true,
            //   onChanged: (bool value) {},
            // ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Opacity(
                    opacity: 0.5,
                    child: Text(
                      "Niaje v1.0.0",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.5,
                    child: Text(
                      "Powered by OpenAPI API",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
