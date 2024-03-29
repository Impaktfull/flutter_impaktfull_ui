import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui_example/src/screen/components/listview/listview_childeren_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/listview/listview_empty_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/listview/listview_item_builder_screen.dart';
import 'package:impaktfull_ui_example/src/screen/components/listview/listview_item_seperated_builder_screen.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullThemeLocalizer(
      builder: (context, theme) => ImpaktfullScreen(
        title: 'Components - ListView',
        onBackTapped: () => Navigator.of(context).pop(),
        child: ImpaktfullListView(
          spacing: 8,
          children: [
            ImpaktfullButton.primary(
              label: 'Children',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ListViewChildrenScreen())),
            ),
            ImpaktfullButton.primary(
              label: 'Item Builder',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ListViewItemBuilderScreen())),
            ),
            ImpaktfullButton.primary(
              label: 'Item Separated Builder',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      const ListViewItemSeparatedBuilderScreen())),
            ),
            ImpaktfullButton.primary(
              label: 'Empty',
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ListViewEmptyScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
