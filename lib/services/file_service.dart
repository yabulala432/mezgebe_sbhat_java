import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:retry/retry.dart';

class FileService extends ChangeNotifier {
  final Map<String, double> _downloadProgress = {};
  final int _maxDownloadProgressEntries = 20; // Define a threshold

  double getDownloadProgress({required String fileId}) =>
      _downloadProgress[fileId] ?? 0.0;

  void setDownloadProgress(String fileId, double value) {
    _downloadProgress[fileId] = value;
    notifyListeners();

    if (_downloadProgress.length >= _maxDownloadProgressEntries) {
      clearDownloadProgress();
    }
  }

  void clearDownloadProgress() {
    _downloadProgress.removeWhere((key, value) => value == 1.0);
    notifyListeners();
  }

  Future<bool> deleteFile({
    required String fileName,
    required String folderName,
  }) async {
    final appStorage = await getPath();

    File file = File('$appStorage/$folderName/$fileName');

    // print('${file.path} is the path to delete the file bro ');

    if (await doesFileExist(fileName: fileName, folderName: folderName)) {
      file.deleteSync();
      return true;
    }

    return false;
  }

  Future<File?> downloadFile({
    required String url,
    required String fileName,
    required String fileId,
    required String folderName,
  }) async {
    final typeOfFile = url.split('/').last.split('.').last;
    // print('file type is $typeOfFile');

    final filteredName = '${fileName.replaceAll(' ', '_')}.$typeOfFile';

    final appStorage = await getPath();
    final filePath = '$appStorage/$folderName';

    // Ensure the directory exists
    final directory = Directory(filePath);
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }

    final file = File('$filePath/$filteredName');

    // Check if the file already exists
    if (await doesFileExist(fileName: file.path, folderName: folderName)) {
      return file;
    }

    try {
      final dio = Dio();
      dio.options.connectTimeout = const Duration(seconds: 5);

      final response = await retry(
        () => dio.get(
          url,
          options: Options(
            responseType: ResponseType.bytes,
          ),
          onReceiveProgress: (count, total) {
            if (total != -1) {
              setDownloadProgress(fileId, count / total);
            }
          },
        ),
        maxAttempts: 5,
      );

      final raf = file.openSync(
        mode: FileMode.write,
      );
      raf.writeFromSync(response.data);
      await raf.close();

      return file;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> doesFileExist({
    required String fileName,
    required String folderName,
  }) async {
    String path = await getPath();
    bool value = File('$path/$folderName/$fileName').existsSync();
    // print('$path/$folderName/$fileName');
    // print('file exists: $value');
    return value;
  }

  Future<File?> getFile({
    required String fileName,
    required String folderName,
  }) async {
    final appStoragePath = await getPath();
    final file = File('$appStoragePath/$folderName/$fileName');
    return file;
  }

  Future<String> getPath() async {
    final appStorage = await getApplicationSupportDirectory();
    return appStorage.path;
  }
}
