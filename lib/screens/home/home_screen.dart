import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stable/helpers.dart';
import 'package:stable/pages/first_page.dart';
import 'package:stable/pages/fourth_page.dart';
import 'package:stable/pages/second_page.dart';
import 'package:stable/pages/third_page.dart';
import 'package:stable/theme.dart';
import 'package:stable/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier('First');

  final pages = const [
    FirstPage(),
    SecondPage(),
    ThirdPage(),
    FourthPage()
  ];

  final pageTitles = [
    'First',
    'Second',
    'Third',
    'Fourth'
  ];

  void _onNavItemSelected(index) {
    title.value = pageTitles[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: ValueListenableBuilder(
          valueListenable: title,
          builder: (BuildContext context, String value, _) {
            return Text(
              value,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            );
          },
        ),
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.center,
          child: IconBackground(
            icon: Icons.search,
            onTap: () {
              print('TODO');
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Avatar.small(url: Helpers.randomPictureUrl()),
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: _BottomNavBar(
        onItemSelected: _onNavItemSelected,
      ),
    );
  }
}

class _BottomNavBar extends StatefulWidget {
  const _BottomNavBar({
    Key? key, required this.onItemSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<_BottomNavBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Card(
      color: (brightness == Brightness.light) ? Colors.transparent : null,
      elevation: 0,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavBarItem(
                index: 0,
                label: 'First',
                icon: CupertinoIcons.bolt_horizontal,
                isSelected: (selectedIndex == 0),
                onTap: handleItemSelected,
              ),
              _NavBarItem(
                index: 1,
                label: 'Second',
                icon: CupertinoIcons.arrowtriangle_right_square_fill,
                isSelected: (selectedIndex == 1),
                onTap: handleItemSelected,
              ),
              GlowingActionButton(color: AppColors.secondary, icon: CupertinoIcons.add, onPressed: () => print('TODO')),
              _NavBarItem(
                index: 2,
                label: 'Third',
                icon: CupertinoIcons.hourglass,
                isSelected: (selectedIndex == 2),
                onTap: handleItemSelected,
              ),
              _NavBarItem(
                index: 3,
                label: 'Fourth',
                icon: CupertinoIcons.calendar,
                isSelected: (selectedIndex == 3),
                onTap: handleItemSelected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  const _NavBarItem({Key? key, required this.label, required this.icon, required this.index, required this.onTap, this.isSelected = false}) : super(key: key);

  final int index;
  final String label;
  final IconData icon;
  final ValueChanged<int> onTap;
  final bool isSelected;

  final TextStyle defaultStyle = const TextStyle(
      fontSize: 12,
  );
  final TextStyle selectedStyle = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppColors.secondary
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? AppColors.secondary : null,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              label,
              style: isSelected ? selectedStyle : defaultStyle
            )
          ],
        ),
      ),
    );
  }
}
