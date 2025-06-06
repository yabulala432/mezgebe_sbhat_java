import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mezgebe_sbhat_java/providers/theme_provider.dart';
import 'package:mezgebe_sbhat_java/services/file_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListItem extends StatefulWidget {
  final String title;
  // final String? fileExtension;
  final String url;
  final String folderName;
  final bool disabled;
  final void Function() onPressed;

  const ListItem({
    super.key,
    required this.title,
    required this.folderName,
    required this.url,
    required this.onPressed,
    this.disabled = false,
    // this.fileExtension = 'mp3',
  });

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool isDownloading = false;
  @override
  Widget build(BuildContext context) {
    final ColorScheme themeProvider =
        Provider.of<ThemeProvider>(context).themeData.colorScheme;
    Future<bool> deleteFile(String title) async {
      return Provider.of<FileService>(context, listen: false).deleteFile(
        fileName: '${widget.title.replaceAll(' ', '_')}.mp3',
        folderName: widget.folderName,
      );
    }

    void popDialogue() {
      Navigator.pop(context);
    }

    return Slidable(
      key: ValueKey(widget.url),
      endActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: themeProvider.surface,
                title: Text(
                  style: TextStyle(
                    color: themeProvider.onPrimary,
                  ),
                  'መሰረዝን ያረጋግጡ',
                ),
                content: Text(
                  style: TextStyle(
                    color: themeProvider.onPrimary,
                  ),
                  'እርግጠኛ ኖት "${widget.title}"ን መሰረዝ ይፈልጋሉ"?',
                ),
                actions: [
                  TextButton(
                    onPressed: () => popDialogue(),
                    child: Text(
                      style: TextStyle(
                        color: themeProvider.onPrimary,
                      ),
                      'ተው',
                      // cancel in amharic = ሰርዝ
                      // leave it as it is in amharic =
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final response = await deleteFile(widget.title);
                      if (!mounted) return;
                      if (response) {
                        setState(() {
                          fileExists = false;
                        });
                      }
                      popDialogue();
                    },
                    child: Text(
                      style: TextStyle(
                        color: themeProvider.primary,
                      ),
                      'አጥፋ',
                      // tewew in amharic = te = ተ, wew = ው
                    ),
                  ),
                ],
              ),
            ),
            label: 'አጥፋ',
            backgroundColor: themeProvider.error,
            foregroundColor: themeProvider.onPrimary,
            icon: Icon(
              const FaIcon(FontAwesomeIcons.trash).icon,
              color: themeProvider.onPrimary,
            ).icon,
          )
        ],
      ),
      child: InkWell(
        onTap: () async {
          if (widget.disabled || isDownloading) {
            return;
          } else if (!await doesFileExist()) {
            downloadFile();
          } else {
            widget.onPressed();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundColor: themeProvider.surface,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Provider.of<ThemeProvider>(context)
                          .themeData
                          .colorScheme
                          .primary,
                      width: 2.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(28)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      const FaIcon(FontAwesomeIcons.bookBible).icon,
                      size: 30,
                      color: themeProvider.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: themeProvider.primary,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: isDownloading
                    ? Consumer<FileService>(
                        builder: (context, FileService fileService, child) {
                        return CircularProgressIndicator(
                          value: fileService.getDownloadProgress(
                            fileId: widget.url,
                          ),
                          color: themeProvider.primary,
                          backgroundColor: Colors.white,
                        );
                      })
                    : fileExists
                        ? Icon(
                            const FaIcon(FontAwesomeIcons.play).icon,
                            size: 30,
                            color: themeProvider.primary,
                          )
                        : Icon(
                            const FaIcon(
                              FontAwesomeIcons.download,
                            ).icon,
                            size: 30,
                            color: themeProvider.primary,
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool fileExists = false;

  @override
  void initState() {
    super.initState();
    doesFileExist();
  }

  void downloadFile() async {
    if (!mounted) return;
    setState(() {
      isDownloading = true;
    });
    await Provider.of<FileService>(context, listen: false)
        .downloadFile(
      url: widget.url,
      fileName: widget.title,
      fileId: widget.url,
      folderName: widget.folderName,
    )
        .then((value) {
      if (value != null && mounted) {
        setState(() {
          fileExists = true;
          isDownloading = false;
        });
      } else if (mounted) {
        setState(() {
          fileExists = false;
        });
      }
    }).catchError((error) {
      if (mounted) {
        setState(() {
          isDownloading = false;
        });
      }
    });
  }

  Future<bool> doesFileExist() async {
    bool value =
        await Provider.of<FileService>(context, listen: false).doesFileExist(
      fileName:
          '${widget.title.replaceAll(' ', '_')}.${widget.url.split('.').last}',
      folderName: widget.folderName,
    );
    if (value) {
      if (!mounted) return false;
      setState(() {
        fileExists = true;
      });
    }
    return value;
  }
}
