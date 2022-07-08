import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:permission_handler/permission_handler.dart';

import '../mixins/state_store_mixin.dart';

import 'control_state.dart';
import 'life_cycle_manager_ct_widget.dart';

class StateObserver extends StatelessWidget {
  const StateObserver({
    Key? key,
    required this.stateStore,
    required this.onSuccess,
    this.onStart,
    this.onLoading,
    this.onEmpty,
    this.onFailure,
    this.onPermissionDenied,
    this.onCustom,
  }) : super(key: key);

  final StateStore stateStore;
  final WidgetBuilder onSuccess;
  final WidgetBuilder? onStart;
  final WidgetBuilder? onLoading;
  final WidgetBuilder? onEmpty;
  final WidgetBuilder? onFailure;
  final WidgetBuilder? onPermissionDenied;
  final Widget? Function(BuildContext context)? onCustom;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        WidgetBuilder? statePage;
        Widget? onCustomWidget;

        if (onCustom != null) {
          onCustomWidget = onCustom!(context);
        }
        if (onCustomWidget != null) {
          statePage = (BuildContext context) => onCustomWidget!;
        } else if (stateStore.state.isStart) {
          statePage = onStart ?? (context) => const OnLoadingWidgetDefault();
        } else if (stateStore.state.isLoading) {
          statePage = onLoading ?? (context) => const OnLoadingWidgetDefault();
        } else if (stateStore.state.isSuccess) {
          statePage = onSuccess;
        } else if (stateStore.state.isEmpty) {
          statePage = onEmpty ??
              (context) => OnEmptyWidgetDefault(
                    emptyMessage:
                        (stateStore.state as EmptyControlState).message,
                  );
        } else if (stateStore.state.isPermissionDenied) {
          statePage = onPermissionDenied ??
              (context) => OnPermissionDeniedWidgetDefault(
                    permissionControlState:
                        stateStore.state as PermissionControlState,
                    stateStore: stateStore,
                  );
        } else if (stateStore.state.isFailure) {
          statePage = onFailure ??
              (context) => OnFailureWidgetDefault(
                    failureMessage:
                        (stateStore.state as FailureControlState).message,
                    onTapTryAgain: () => stateStore.pipeline(context),
                  );
        }

        if (statePage == null) {
          throw Exception('StateObserver: statePage is null');
        }

        return AnimatedSwitcher(
          layoutBuilder: defaultLayoutBuilder,
          duration: const Duration(milliseconds: 300),
          child: statePage(context),
        );
      },
    );
  }

  static Widget defaultLayoutBuilder(
      Widget? currentChild, List<Widget> previousChildren) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        ...previousChildren,
        if (currentChild != null) currentChild,
      ],
    );
  }
}

class OnLoadingWidgetDefault extends StatelessWidget {
  const OnLoadingWidgetDefault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class OnFailureWidgetDefault extends StatelessWidget {
  const OnFailureWidgetDefault({
    Key? key,
    required this.onTapTryAgain,
    required this.failureMessage,
  }) : super(key: key);

  final VoidCallback onTapTryAgain;
  final String failureMessage;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            failureMessage,
            textAlign: TextAlign.center,
            style: theme.textTheme.subtitle1,
          ),
          const SizedBox(height: 8),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: theme.primaryColor,
            ),
            child: Text(
              'Tentar novamente',
              style: TextStyle(
                color: theme.canvasColor,
              ),
            ),
            onPressed: onTapTryAgain,
          ),
        ],
      ),
    );
  }
}

class OnEmptyWidgetDefault extends StatelessWidget {
  const OnEmptyWidgetDefault({
    Key? key,
    required this.emptyMessage,
  }) : super(key: key);

  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Center(
      child: Text(
        emptyMessage,
        textAlign: TextAlign.center,
        style: theme.textTheme.headline6,
      ),
    );
  }
}

class OnPermissionDeniedWidgetDefault extends StatelessWidget {
  const OnPermissionDeniedWidgetDefault({
    Key? key,
    required this.permissionControlState,
    required this.stateStore,
  }) : super(key: key);

  final PermissionControlState permissionControlState;
  final StateStore stateStore;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return LifeCycleManagerCT(
      onResumed: () {
        permissionControlState.onCall?.call() ?? stateStore.undo();
      },
      child: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: Alignment.center,
        color: theme.colorScheme.surface,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Text(
              permissionControlState.message,
              textAlign: TextAlign.left,
              style: theme.textTheme.headline6,
            ),
            const SizedBox(height: 24),
            Text(
              'Parece que você negou as permissões do seu dispositivo, elas são essenciais para o funcionamento do aplicativo.\nAtive as permissões clicando no botão',
              textAlign: TextAlign.left,
              style: theme.textTheme.bodyText2,
            ),
            const SizedBox(height: 16),
            const TextButton(
              child: Text('Ativar permissões'),
              onPressed: openAppSettings,
            )
          ],
        ),
      ),
    );
  }
}
