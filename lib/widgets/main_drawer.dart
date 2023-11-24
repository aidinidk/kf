import 'package:flutter/material.dart';
import 'package:kf/screens/about_screen.dart';
import 'package:kf/screens/difficulty_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    void goToA1() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => const DifficultyScreen(difficulty: 'A1')));
    }

    void goToA2() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => const DifficultyScreen(difficulty: 'A2')));
    }

    void goToB1() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => const DifficultyScreen(difficulty: 'B1')));
    }

    void goToB2() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => const DifficultyScreen(difficulty: 'B2')));
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
              onTap: goToA1,
            ),
            ListTile(
              title: const Text('A2'),
              onTap: goToA2,
            ),
            ListTile(
              title: const Text('B1'),
              onTap: goToB1,
            ),
            ListTile(
              title: const Text('B2'),
              onTap: goToB2,
            ),
            const Spacer(),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
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
