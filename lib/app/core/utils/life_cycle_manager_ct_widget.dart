import 'package:flutter/material.dart';

class LifeCycleManagerCT extends StatefulWidget {
  final Widget child;
  final VoidCallback? onResumed;
  final VoidCallback? onInactive;
  final VoidCallback? onPaused;
  final VoidCallback? onDetached;
  final ValueChanged<AppLifecycleState>? onChanged;

  const LifeCycleManagerCT({
    required this.child,
    Key? key,
    this.onChanged,
    this.onResumed,
    this.onInactive,
    this.onPaused,
    this.onDetached,
  }) : super(key: key);

  @override
  _LifeCycleManagerWayState createState() => _LifeCycleManagerWayState();
}

class _LifeCycleManagerWayState extends State<LifeCycleManagerCT>
    with
        // ignore: prefer_mixin
        WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    widget.onChanged?.call(state);
    switch (state) {
      case AppLifecycleState.resumed:
        widget.onResumed?.call();
        break;
      case AppLifecycleState.inactive:
        widget.onInactive?.call();
        break;
      case AppLifecycleState.paused:
        widget.onPaused?.call();
        break;
      case AppLifecycleState.detached:
        widget.onDetached?.call();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
