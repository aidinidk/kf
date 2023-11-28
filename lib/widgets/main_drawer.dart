import 'package:flutter/material.dart';
import 'package:kf/screens/about_screen.dart';
import 'package:kf/theme/theme_manager.dart';
import 'package:kf/widgets/filter_difficulty.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer(
      {super.key, required this.themeManager, required this.notifyParent});
  final ThemeManager themeManager;
  final Function() notifyParent;
  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.surface,
                  Theme.of(context).colorScheme.surface.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  child: Row(
                    children: [
                      IconButton(
                        color: widget.themeManager.themeMode == ThemeMode.dark
                            ? Colors.yellow
                            : Colors.blue,
                        onPressed: () {
                          widget.themeManager.toggleTheme(
                              widget.themeManager.themeMode != ThemeMode.dark);
                          widget.notifyParent;
                        },
                        icon: Icon(
                            widget.themeManager.themeMode == ThemeMode.dark
                                ? Icons.sunny
                                : Icons.dark_mode),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 0,
                  child: Row(
                    children: [
                      Icon(
                        Icons.subdirectory_arrow_left,
                        size: 48,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Text(
                        "کلاس ها",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const FilterDifficulty(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const AboutScreen()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.surface),
                  ),
                  icon: Icon(Icons.info,
                      color: Theme.of(context).colorScheme.onBackground),
                  label: Text(
                    'درباره',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
