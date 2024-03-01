import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/loading/impaktfull_loading.dart';
import 'package:impaktfull_ui/src/components/touch_feedback/impaktfull_touch_feedback.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme.dart';
import 'package:impaktfull_ui/src/theme/impaktfull_theme_localizer.dart';

enum _ButtonType {
  primary,
  secondary,
  accent,
}

class ImpaktfullButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final AsyncCallback? onAsyncTap;
  final _ButtonType _type;

  const ImpaktfullButton.primary({
    required this.label,
    this.onTap,
    this.onAsyncTap,
    super.key,
  }) : _type = _ButtonType.primary;

  const ImpaktfullButton.secondary({
    required this.label,
    this.onTap,
    this.onAsyncTap,
    super.key,
  }) : _type = _ButtonType.secondary;

  const ImpaktfullButton.accent({
    required this.label,
    this.onTap,
    this.onAsyncTap,
    super.key,
  }) : _type = _ButtonType.accent;

  @override
  State<ImpaktfullButton> createState() => _ImpaktfullButtonState();
}

class _ImpaktfullButtonState extends State<ImpaktfullButton> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final hasOnTap = widget.onTap != null || widget.onAsyncTap != null;
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => Opacity(
        opacity: hasOnTap ? 1 : 0.3,
        child: IgnorePointer(
          ignoring: !hasOnTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Visibility.maintain(
                visible: !_isLoading,
                child: ImpaktfullTouchFeedback(
                  onTap: hasOnTap ? _onTap : null,
                  color: _getBackground(theme),
                  shadow: [
                    if (theme.shadows.button != null) theme.shadows.button!,
                  ],
                  borderRadius:
                      BorderRadius.circular(theme.dimens.generalBorderRadius),
                  child: Container(
                    constraints: const BoxConstraints(
                      minWidth: 48,
                      minHeight: 48,
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 16,
                    ),
                    child: Text(
                      widget.label,
                      style: _getTextStyle(theme).title,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              if (_isLoading) ...[
                const ImpaktfullLoadingIndicator(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color _getBackground(ImpaktfullTheme theme) {
    switch (widget._type) {
      case _ButtonType.primary:
        return theme.colors.primary;
      case _ButtonType.secondary:
        return Colors.transparent;
      case _ButtonType.accent:
        return theme.colors.accent1;
    }
  }

  ImpaktfullTextStyleTheme _getTextStyle(ImpaktfullTheme theme) {
    switch (widget._type) {
      case _ButtonType.primary:
        return theme.textStyles.onPrimary;
      case _ButtonType.secondary:
        return theme.textStyles.onCanvasPrimary;
      case _ButtonType.accent:
        return theme.textStyles.onAccent1;
    }
  }

  Future<void> _onTap() async {
    if (widget.onTap != null) {
      widget.onTap!();
      return;
    }
    setState(() => _isLoading = true);
    try {
      await widget.onAsyncTap!();
    } catch (error) {
      debugPrint(error.toString());
    }
    if (!mounted) return;
    setState(() => _isLoading = false);
  }
}
