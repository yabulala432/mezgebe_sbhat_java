import 'dart:async';
// import 'dart:io';

import 'package:just_audio/just_audio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mezgebe_sbhat_java/models/menu_list_parent.dart';
import 'package:mezgebe_sbhat_java/services/file_service.dart';

class PlayListProvider extends ChangeNotifier {
  bool _isDisposed = false;
  Completer<void>? _ongoingTask;

  PlayListParent playListParent;
  final FileService fileService;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _isDisposed = true;
    _audioPlayer.dispose();
    _ongoingTask?.complete();
    super.dispose();
  }

  PlayListProvider({
    required this.playListParent,
    required this.fileService,
  }) {
    listenToPlayerEvents();
  }

  int _currentIndex = 0;
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;
  bool _isDownloading = false;
  bool _downloadError = false;
  bool _loopAudio = false;
  bool _playNext = false;

  // Getters
  int get currentIndex => _currentIndex;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;
  bool get isPlaying => _audioPlayer.playing;
  bool get isPaused =>
      !_audioPlayer.playing &&
      _audioPlayer.playerState.processingState != ProcessingState.idle;
  bool get isStopped =>
      _audioPlayer.playerState.processingState == ProcessingState.idle;
  bool get isDownloading => _isDownloading;
  bool get downloadError => _downloadError;
  bool get loopAudio => _loopAudio;
  bool get playNext => _playNext;
  String get currentDurationString => formatDuration(_currentDuration);
  String get totalDurationString => formatDuration(_totalDuration);

  void listenToPlayerEvents() {
    if (_isDisposed) return;

    _audioPlayer.durationStream.listen((duration) {
      _totalDuration = duration ?? Duration.zero;
      notifyListeners();
    });

    _audioPlayer.positionStream.listen((position) {
      _currentDuration = position;
      notifyListeners();
    });

    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        if (_loopAudio) {
          _audioPlayer.seek(Duration.zero);
          _audioPlayer.play();
        } else if (_playNext) {
          next();
        } else {
          stop();
        }
      }
      notifyListeners();
    });
  }

  Future<void> play() async {
    if (_isDisposed) return;

    try {
      final fileName =
          '${playListParent.playList[_currentIndex].title}.${playListParent.playList[_currentIndex].audioUrl.split('.').last}';
      // print(fileName);
      final audioUrl = playListParent.playList[_currentIndex].audioUrl;

      // Try to play from local file first
      if (await fileService.doesFileExist(
        fileName: fileName,
        folderName: playListParent.folderName,
      )) {
        final file = await fileService.getFile(
          fileName: fileName,
          folderName: playListParent.folderName,
        );
        // print(file);
        if (file == null) {
          throw Exception('File not found');
        }
        await _audioPlayer.setFilePath(file.path);
        await _audioPlayer.play();
      } else {
        // Download and play from network
        _isDownloading = true;
        _downloadError = false;
        notifyListeners();

        try {
          final file = await fileService.downloadFile(
            url: audioUrl,
            fileName: fileName,
            fileId: audioUrl,
            folderName: playListParent.folderName,
          );

          if (file != null) {
            _isDownloading = false;
            await _audioPlayer.setFilePath(file.path);
            await _audioPlayer.play();
          }
        } catch (e) {
          _isDownloading = false;
          _downloadError = true;
          rethrow;
        } finally {
          _isDownloading = false;
        }
      }
    } finally {
      notifyListeners();
    }
  }

  Future<void> pause() async {
    if (_isDisposed) return;
    await _audioPlayer.pause();
  }

  Future<void> resume() async {
    if (_isDisposed) return;
    if (isStopped) {
      await play();
    } else {
      await _audioPlayer.play();
    }
  }

  Future<void> playPause() async {
    if (_isDisposed) return;
    if (isPlaying) {
      await pause();
    } else {
      await resume();
    }
  }

  Future<void> seek(Duration duration) async {
    if (_isDisposed) return;
    await _audioPlayer.seek(duration);
  }

  void setCurrentIndex(int index) {
    if (_isDisposed) return;
    _currentIndex = index.clamp(0, playListParent.playList.length - 1);
    notifyListeners();
  }

  Future<void> next() async {
    _currentDuration = Duration.zero;
    setCurrentIndex(_currentIndex + 1);
    await stop();
    await play();
  }

  Future<void> previous() async {
    _currentDuration = Duration.zero;
    setCurrentIndex(_currentIndex - 1);
    await stop();
    await play();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    _currentDuration = Duration.zero;
    notifyListeners();
  }

  Future<void> fastForward() async {
    await seek(_currentDuration + const Duration(seconds: 5));
  }

  Future<void> rewind() async {
    await seek(_currentDuration - const Duration(seconds: 5));
  }

  void toggleLoop() {
    _loopAudio = !_loopAudio;
    if (_loopAudio) _playNext = false;
    _audioPlayer.setLoopMode(_loopAudio ? LoopMode.one : LoopMode.off);
    notifyListeners();
  }

  void togglePlayNext() {
    _playNext = !_playNext;
    if (_playNext) _loopAudio = false;
    notifyListeners();
  }

  void playIndex(int index) {
    setCurrentIndex(index);
    play();
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
