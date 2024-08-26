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
                await widget.controller.updateThemeMode(value);
              },
              offset: Offset.fromDirection(1.0),
              tooltip: "",
              // initialValue: widget.controller.themeMode,
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: ThemeMode.system,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "System theme",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: ThemeMode.light,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Light theme",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: ThemeMode.dark,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
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
            // const Padding(
            //   padding: EdgeInsets.all(16.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Opacity(
            //         opacity: 0.5,
            //         child: Text(
            //           "Niaje v1.0.1",
            //           style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             fontSize: 12.0,
            //           ),
            //         ),
            //       ),
            //       Opacity(
            //         opacity: 0.5,
            //         child: Text(
            //           "Powered by Gemini API",
            //           style: TextStyle(
            //             fontWeight: FontWeight.w300,
            //             fontSize: 10.0,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
