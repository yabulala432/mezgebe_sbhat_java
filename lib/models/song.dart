class Song {
  final String title;
  final String audioUrl;

  // optional param is the page number for the pdf
  // final String? fileExtension;
  final int? pageNumber;

  Song({
    required this.title,
    required this.audioUrl,
    // this.fileExtension = 'mp3',
    this.pageNumber,
  });
}
