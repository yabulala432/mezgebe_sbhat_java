import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mezgebe_sbhat_java/components/drawer/drawer_button.dart';
import 'package:mezgebe_sbhat_java/providers/theme_provider.dart';
import 'package:mezgebe_sbhat_java/screens/about_us.dart';
import 'package:mezgebe_sbhat_java/screens/home_screen.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key, required this.title});

  final String title;

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const AboutUs(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Provider.of<ThemeProvider>(context)
                .themeData
                .colorScheme
                .onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor:
            Provider.of<ThemeProvider>(context).themeData.colorScheme.primary,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: Provider.of<ThemeProvider>(context)
                  .themeData
                  .colorScheme
                  .onPrimary,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        width: 250,
        backgroundColor:
            Provider.of<ThemeProvider>(context).themeData.colorScheme.surface,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 250,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Provider.of<ThemeProvider>(context)
                      .themeData
                      .colorScheme
                      .primary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Image(
                          image: AssetImage(
                            Provider.of<ThemeProvider>(context).isDark
                                ? 'assets/images/splash_dark.png'
                                : 'assets/images/splash_light.png',
                          ),
                          height: 150,
                        ),
                        Text(
                          "መዝገበ ስብሐት",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Provider.of<ThemeProvider>(context)
                                .themeData
                                .colorScheme
                                .surface,
                            letterSpacing: 2,
                          ),
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggleTheme();
                      },
                      icon: Icon(
                        Provider.of<ThemeProvider>(context).isDark
                            ? Icons.light_mode
                            : Icons.dark_mode,
                        color: Provider.of<ThemeProvider>(context)
                            .themeData
                            .colorScheme
                            .onPrimary,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                children: [
                  AppDrawerButton(
                    title: 'መዝገበ ስብሐት',
                    isSelected: _selectedIndex == 0,
                    leadingIcon: Icons.home,
                    onItemTapped: () {
                      _onItemTapped(0);
                      Navigator.pop(context);
                    },
                  ),
                  AppDrawerButton(
                    title: 'ስለ እኛ',
                    isSelected: _selectedIndex == 1,
                    leadingIcon: Icons.info,
                    onItemTapped: () {
                      _onItemTapped(1);
                      Navigator.pop(context);
                    },
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
