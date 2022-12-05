import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:go_router/go_router.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../global.dart';
import '../page_state.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  SettingPageState createState() => SettingPageState();
}

class SettingPageState extends BasePageState<SettingPage> {
  @override
  String get title => "设置";

  @override
  bool get wantKeepAlive => true;

  @override
  Widget buildBody() {
    return SettingsList(
      sections: [
        SettingsSection(
          title: const Text('通用'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: const Icon(Icons.security),
              title: const Text('密码锁'),
              value: Global.unlockPWD == null || Global.unlockPWD!.isEmpty
                  ? const Text('未设置')
                  : const Text('已设置'),
              onPressed: (context) {
                final controller = InputController();
                screenLockCreate(
                  context: context,
                  inputController: controller,
                  onConfirmed: (val) async {
                    Global.unlockPWD = val;
                    final sp = await SharedPreferences.getInstance();
                    sp.setString(LocalStorageCategory.unlockPWD.name, val);
                    if (mounted) context.pop();
                  },
                  footer: TextButton(
                    onPressed: () {
                      // Release the confirmation state and return to the initial input state.
                      controller.unsetConfirmed();
                    },
                    child: const Text('Reset input'),
                  ),
                );
              },
            ),
            // SettingsTile.switchTile(
            //   onToggle: (value) {},
            //   initialValue: true,
            //   leading: Icon(Icons.format_paint),
            //   title: Text('Enable custom theme'),
            // ),
          ],
        ),
      ],
    );
  }
}
