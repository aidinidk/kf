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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('درباره'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: double.infinity,
              height: 700,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).colorScheme.background,
              ),
              padding: const EdgeInsets.all(50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'این اپ یک اپ دیکشنری ساده قزاقی به فارسی است که برای یادگیری و آموزش از آن استفاده می شود',
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'در صورت هر گونه سوال و بازخورد در مورد کلمات، معانی و ... میتوانید به پیج زیر مراجعه فرمایید',
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: launchOwner,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/instgram.png',
                            width: 50,
                          ),
                          Row(
                            children: [
                              Text(
                                'برو به',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                              ),
                              const Icon(Icons.arrow_right),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'در صورت هر گونه سوال در زمینه کاربردی برنامه و یا بازخورد می توانید به آدرس های زیر مراجعه فرمایید',
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: launchInstgram,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/images/instgram.png',
                                width: 50,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'برو به',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                        ),
                                  ),
                                  const Icon(Icons.arrow_right),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: launchTelegram,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/images/telegram.png',
                                width: 50,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'برو به',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                        ),
                                  ),
                                  const Icon(Icons.arrow_right),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
