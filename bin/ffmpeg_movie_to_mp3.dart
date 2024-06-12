import 'dart:io';

void main(List<String> args) {
  var dir = Directory('./');
  var files = dir.listSync();
  var moviefiles = [];
  for (var file in files) {
    var fileExtension = file.path.split('.').last;
    var fileName = file.path.substring(0, file.path.length - 4);
    if (fileExtension == 'avi' || fileExtension == 'mkv') {
      moviefiles.add('ffmpeg -i \'${file.path}\' -map 0:a:0 -b:a 192k \'$fileName.mp3\'');
    }
  }
  var newFile = File('ffmpeg-movie-to-mp3.ps1');
  newFile.writeAsStringSync(moviefiles.join('\n'));
  newFile.createSync();
}
