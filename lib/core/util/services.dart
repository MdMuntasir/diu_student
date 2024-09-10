import 'dart:io';
import 'dart:ui';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

import '../constants&variables/constants.dart';
import '../resources/information_repository.dart';

class Services{

  Future<void> DownloadFile(
      void onDownloadCompleted(String path),
      {
    required final String url,
    required final String filename,
    String path = "/storage/emulated/0/Download/routine.pdf",
    final VoidCallback? onDownloadError,
  }
  ) async{



    path = "/storage/emulated/0/Download/$filename.pdf";
    File file = File(path);
    int counter = 1;
    while(file.existsSync()){
      path = "/storage/emulated/0/Download/$filename-$counter.pdf";
      file = File(path);
      counter++;
    }
    Response res = await get(Uri.parse(url));


    await file.writeAsBytes(res.bodyBytes);



    if(res.statusCode==200 && file.existsSync()) {
      onDownloadCompleted(path);
    }

    else{
      onDownloadError != null? onDownloadError() : onDownloadError;
    }
  }
}