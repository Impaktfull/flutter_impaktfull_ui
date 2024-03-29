import 'package:impaktfull_ui/impaktfull_ui.dart';

class SeparatedColumnScreen extends StatelessWidget {
  const SeparatedColumnScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - SeparatedColumn',
        onBackTapped: () => Navigator.of(context).pop(),
        child: const ImpaktfullListView(
          spacing: 8,
          children: [
            ImpaktfullSeparatedColumn(
              children: [
                Text('Item 1'),
                Text('Item 2'),
                Text('Item 3'),
                Text('Item 4'),
                Text('Item 5'),
              ],
            ),
            ImpaktfullSeparatedColumn(
              type: ImpaktfullSeparatorType.card,
              children: [
                Text('Item 1'),
                Text('Item 2'),
                Text('Item 3'),
                Text('Item 4'),
                Text('Item 5'),
              ],
            ),
            ImpaktfullSeparatedColumn(
              title: 'Some title',
              type: ImpaktfullSeparatorType.canvas,
              children: [
                Text('Item 1'),
                Text('Item 2'),
                Text('Item 3'),
                Text('Item 4'),
                Text('Item 5'),
              ],
            ),
            ImpaktfullSeparatedColumn(
              title: 'Some title',
              type: ImpaktfullSeparatorType.card,
              children: [
                Text('Item 1'),
                Text('Item 2'),
                Text('Item 3'),
                Text('Item 4'),
                Text('Item 5'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
