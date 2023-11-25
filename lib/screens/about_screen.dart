import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void launchOwner() async {
      if (!await launchUrl(Uri.parse("https://www.instagram.com/kaz_iran/"),
          mode: LaunchMode.externalApplication)) {
        throw 'Could not launch ';
      }
    }

    void launchInstgram() async {
      if (!await launchUrl(Uri.parse("https://www.instagram.com/idinkz/"),
          mode: LaunchMode.externalApplication)) {
        throw 'Could not launch ';
      }
    }

    void launchTelegram() async {
      if (!await launchUrl(Uri.parse("https://www.t.me/idinkz/"),
          mode: LaunchMode.externalApplication)) {
        throw 'Could not launch ';
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).colorScheme.background,
            ),
            padding: const EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('This app was made for :'),
                InkWell(
                  onTap: launchOwner,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/instgram.png',
                        width: 50,
                      ),
                      const SizedBox(width: 10),
                      const Text('Go to'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'My socials : ',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: launchInstgram,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/instgram.png',
                              width: 50,
                            ),
                            const SizedBox(width: 10),
                            const Text('Go to'),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: launchTelegram,
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/telegram.png',
                              width: 50,
                            ),
                            const SizedBox(width: 10),
                            const Text('Go to'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
