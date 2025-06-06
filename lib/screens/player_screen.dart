import 'package:flutter/material.dart';
import 'package:mezgebe_sbhat_java/components/player/app_slider.dart';
import 'package:mezgebe_sbhat_java/components/player/duration_text.dart';
import 'package:mezgebe_sbhat_java/components/player/pdf_card.dart';
import 'package:mezgebe_sbhat_java/components/player/header_text.dart';
import 'package:mezgebe_sbhat_java/components/player/next_previous_button.dart';
import 'package:mezgebe_sbhat_java/components/player/play_pause_download_progress.dart';
import 'package:mezgebe_sbhat_java/components/player/repeat_button.dart';
import 'package:mezgebe_sbhat_java/providers/theme_provider.dart';
import 'package:mezgebe_sbhat_java/screens/bottom_nav_state.dart';
import 'package:provider/provider.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme themeProvider =
        Provider.of<ThemeProvider>(context).themeData.colorScheme;

    final bottomNavState = Provider.of<BottomNavState>(context, listen: false);

    final double screenHeight = MediaQuery.of(context).size.height;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        bottomNavState.navigateToScreen1();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: Row(
              children: [
                Expanded(
                  child: HeaderText(),
                ),
              ],
            ),
          ),
          backgroundColor: themeProvider.surface,
          leading: IconButton(
            onPressed: () {
              bottomNavState.currentIndex = 0;
            },
            icon: Icon(
              Icons.arrow_back,
              color: themeProvider.onPrimary,
              size: 30.0,
            ),
          ),
        ),
        backgroundColor: themeProvider.surface,
        body: Container(
          constraints: BoxConstraints(
            maxWidth: screenHeight,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PdfCard(
                height: screenHeight * .6,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Container(
                  height: screenHeight * .15,
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: 500.0,
                        ),
                        child: const Row(
                          children: [
                            DurationText(isLeft: true),
                            Expanded(
                              // flex: 1,
                              child: AppSlider(),
                            ),
                            DurationText(isLeft: false),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        constraints: const BoxConstraints(
                          maxWidth: 500.0,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RepeatButton(repeatOnce: false),
                            NextPreviousButton(next: false),
                            PlayPauseDownloadProgress(),
                            NextPreviousButton(next: true),
                            RepeatButton(repeatOnce: true),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
