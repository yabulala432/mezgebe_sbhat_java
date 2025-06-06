import 'package:mezgebe_sbhat_java/models/pdf.dart';
import 'package:mezgebe_sbhat_java/models/song.dart';

abstract class PlayListParent {
  Uri get baseUri;
  List<Song> get playList;
  String get folderName;
  Pdf get pdf;
}
