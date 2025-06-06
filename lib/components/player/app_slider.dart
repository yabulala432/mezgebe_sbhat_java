import 'package:flutter/material.dart';
import 'package:mezgebe_sbhat_java/providers/playlist_provider.dart';
import 'package:mezgebe_sbhat_java/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AppSlider extends StatelessWidget {
  const AppSlider({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final PlayListProvider playListProvider =
        Provider.of<PlayListProvider>(context, listen: false);
    return SizedBox(
      height: 30,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          thumbShape: SliderComponentShape.noThumb,
          trackHeight: 3.0,
          activeTrackColor:
              Provider.of<ThemeProvider>(context).themeData.colorScheme.primary,
          // hide the poping up pointer when sliding
          showValueIndicator: ShowValueIndicator.never,
        ),
        child: Slider(
          onChangeStart: (value) {
            if (playListProvider.isPaused || playListProvider.isPlaying) {
              try {
                playListProvider.pause();
              } finally {}
            }
          },
          onChanged: (double value) {
            if (playListProvider.isPaused || playListProvider.isPlaying) {
              final Duration duration = Duration(
                milliseconds: value.toInt(),
              );
              try {
                playListProvider.seek(duration);
              } finally {}
            }
          },
          onChangeEnd: (double value) {
            if (playListProvider.isPaused || playListProvider.isPlaying) {
              final Duration duration = Duration(
                milliseconds: value.toInt(),
              );
              try {
                playListProvider.seek(duration);
                playListProvider.resume();
              } finally {}
            }
          },
          max: playListProvider.totalDuration.inMilliseconds.toDouble(),
          // (context, listen: false) has to be not set for below line to work
          value: Provider.of<PlayListProvider>(context)
                      .currentDuration
                      .inMilliseconds
                      .toDouble() >
                  Provider.of<PlayListProvider>(context)
                      .totalDuration
                      .inMilliseconds
                      .toDouble()
              ? 0
              : Provider.of<PlayListProvider>(context)
                  .currentDuration
                  .inMilliseconds
                  .toDouble(),
          divisions: Provider.of<PlayListProvider>(context)
                      .totalDuration
                      .inMilliseconds
                      .toInt() !=
                  0
              ? Provider.of<PlayListProvider>(context)
                  .totalDuration
                  .inMilliseconds
                  .toInt()
              : 1,
        ),
      ),
    );
  }
}
