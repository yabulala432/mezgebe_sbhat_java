import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:getwidget/getwidget.dart';
import 'package:mezgebe_sbhat_java/components/about/app_tile.dart';
import 'package:mezgebe_sbhat_java/components/about/pill_button.dart';
import 'package:mezgebe_sbhat_java/components/home/background_color.dart';
import 'package:mezgebe_sbhat_java/providers/theme_provider.dart';
import 'package:mezgebe_sbhat_java/screens/about_app.dart';
import 'package:mezgebe_sbhat_java/screens/about_developer.dart';
import 'package:provider/provider.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme themeProvider =
        Provider.of<ThemeProvider>(context).themeData.colorScheme;
    return BackgroundColor(
      color: themeProvider.surface,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: themeProvider.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 200,
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Image(
                      image: AssetImage(
                        Provider.of<ThemeProvider>(context).isDark
                            ? 'assets/images/splash_dark.png'
                            : 'assets/images/splash_light.png',
                      ),
                      width: 150,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "መዝገበ ስብሐት",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: themeProvider.inversePrimary,
                          ),
                        ),
                        Text(
                          "Version 1.0.0 \nበቃለ ስብሐት መተግበሪያ\n አነሳሽነት የተሠራ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: themeProvider.inversePrimary,
                          ),
                          // softWrap: true,
                          // maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Developers',
                style: TextStyle(
                  color: themeProvider.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const AppTile(
              image: AssetImage('assets/images/yeabsira.jpg'),
              name: 'የአብሥራ ዮናስ',
              title: 'የሶፍትዌር መሐንዲስ',
              description: 'የሙሉ መተግበሪያው ገንቢ',
              telegramHandle: 'fkureyohanns',
              website: 'https://portfolio-yeabsira.netlify.app/',
              email: 'yabulala432@gmail.com',
            ),
            const SizedBox(
              height: 15,
            ),
            const AppTile(
              image: AssetImage('assets/images/yihunImage.jpg'),
              name: "ዲ/ን ይሁን ሽኩሪ",
              title: "የሶፍትዌር መሐንዲስ",
              description: "የመተግበሪያው አባል ገንቢ",
              telegramHandle: 'sholet1234',
              website: 'https://Mine-121.vercel.app',
              email: '',
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Collaborators',
                style: TextStyle(
                  color: themeProvider.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const AppTile(
              image: AssetImage('assets/images/solomonImage.jpg'),
              name: "ሶሎሞን በላይ",
              title: "የሶፍትዌር መሐንዲስ",
              description: "የማሻሻያ ሃሳቦች",
              telegramHandle: 'Solo_mo_on',
              website: '',
              email: '',
            ),
            const SizedBox(
              height: 15,
            ),
            const AppTile(
              image: AssetImage('assets/images/tempYihune.jpg'),
              name: "ይሁኔ ዘውዴ",
              title: "የሶፍትዌር መሐንዲስ",
              description: "የማሻሻያ ሃሳቦች",
              telegramHandle: 'Atie_Mb21',
              website: '',
              email: '',
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PillButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const AboutApp(),
                        ),
                      );
                    },
                    text: ("ስለ መተግበሪያው"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  PillButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const AboutDeveloper(),
                        ),
                      );
                    },
                    text: "ስለ መተግበሪያ ገንቢው",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
