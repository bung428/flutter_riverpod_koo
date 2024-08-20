import 'package:flutter/widgets.dart';

class KeyboardUnFocus extends StatelessWidget {
  final Widget child;

  const KeyboardUnFocus({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        unFocus(context);
      },
      child: child,
    );
  }

  static void unFocus(BuildContext context) {
    final focusScopeNode = FocusScope.of(context);
    if (!focusScopeNode.hasPrimaryFocus && focusScopeNode.hasFocus) {
      focusScopeNode.unfocus();
    }
  }
}
