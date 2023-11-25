import 'package:flutter/material.dart';
import 'package:kf/screens/about_screen.dart';
import 'package:kf/screens/difficulty_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    void goTo(des) {
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => DifficultyScreen(difficulty: des)));
    }

    return Drawer(
      child: Expanded(
        child: Column(
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.subdirectory_arrow_left,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Text(
                    "Classes",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('A1'),
              onTap: () {
                goTo('A1');
              },
            ),
            ListTile(
              title: const Text('A2'),
              onTap: () {
                goTo('A2');
              },
            ),
            ListTile(
              title: const Text('B1'),
              onTap: () {
                goTo('B1');
              },
            ),
            ListTile(
              title: const Text('B2'),
              onTap: () {
                goTo('B2');
              },
            ),
            const Spacer(),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const AboutScreen()));
                  },
                  icon: const Icon(Icons.info),
                  label: const Text('About'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
