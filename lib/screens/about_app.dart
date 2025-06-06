import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mezgebe_sbhat_java/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});
  @override
  Widget build(BuildContext context) {
    final ColorScheme themeProvider =
        Provider.of<ThemeProvider>(context).themeData.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ስለ መዝገበ ስብሐት',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: themeProvider.primary,
          ),
        ),
        centerTitle: true,
        backgroundColor: themeProvider.surface,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: themeProvider.primary,
        ),
      ),
      body: Material(
        color: themeProvider.surface,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: ListView(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                  topRight: Radius.circular(250),
                ),
                child: Container(
                  color: themeProvider.primary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60.0, vertical: 30.0),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              Provider.of<ThemeProvider>(context).isDark
                                  ? 'assets/images/splash_dark.png'
                                  : 'assets/images/splash_light.png',
                            ),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        child: Stack(children: [
                          Container(
                            height: 250,
                          ),
                        ])),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      const FaIcon(FontAwesomeIcons.church).icon,
                      size: 50,
                      color: themeProvider.primary,
                    ),
                    const SizedBox(width: 30),
                    Flexible(
                      child: Text(
                        'ይህ አፕሊኬሽን የተዘጋጀው የኢትዮጵያ ኦርቶዶክስ ተዋሕዶ ቤተ ክርስቲያንን ዜማ ለመማር ለሚፈልጉ ተማሪዎች ነው። በውስጡም አራት ክፍሎች አሉት። \n፩. ቅዳሴ   ፪. ምስባክ   \n፫. ኪዳን   ፬. ሰዓታት',
                        softWrap: true,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: themeProvider.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Divider(
                thickness: 3.0,
                height: 20.0,
                color: themeProvider.primary,
                indent: 40.0,
                endIndent: 40.0,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.cross,
                          size: 35,
                          color: themeProvider.primary,
                        ),
                        const SizedBox(width: 15),
                        Flexible(
                          child: Text(
                            'ምስጋና',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: themeProvider.primary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Icon(
                          FontAwesomeIcons.cross,
                          size: 35,
                          color: themeProvider.primary,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "ለእግዚአብሔር",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: themeProvider.primary,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Divider(
                thickness: 3.0,
                height: 20.0,
                color: themeProvider.primary,
                indent: 40.0,
                endIndent: 40.0,
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        const FaIcon(FontAwesomeIcons.bookmark).icon,
                        size: 35,
                        color: themeProvider.primary,
                      ),
                      const SizedBox(width: 30),
                      Flexible(
                        child: Text(
                          'መታሰቢያነቱ',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: themeProvider.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Icon(
                        const FaIcon(FontAwesomeIcons.bookmark).icon,
                        size: 35,
                        color: themeProvider.primary,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      // , =
                      "ለመምህር ቀለሙ እንዳለው ፣ እንዲሁም ለኢትዮጵያ ኦርቶዶክስ ተዋሕዶ ቤተ ክርስቲያን አገልጋይ ካህናት በሙሉ ::",
                      // ye yu yi ya ye y yo = የዩአይያየዮ
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: themeProvider.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
