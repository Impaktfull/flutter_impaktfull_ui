import 'package:impaktfull_ui/impaktfull_ui.dart';

class SwitchListItemScreen extends StatefulWidget {
  const SwitchListItemScreen({
    super.key,
  });

  @override
  State<SwitchListItemScreen> createState() => _SwitchListItemScreenState();
}

class _SwitchListItemScreenState extends State<SwitchListItemScreen> {
  var _value = true;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - Switch List Item',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          spacing: 8,
          children: [
            ImpaktfullSwitchListItem(
              title: 'Working switch',
              value: _value,
              onChanged: (value) {
                setState(() => _value = value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
