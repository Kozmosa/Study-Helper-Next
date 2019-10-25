import 'package:study_helper_next/_globalVars.dart';
import 'package:study_helper_next/core/io.dart' as YangIO;

GlobalVars _global = new GlobalVars();

class RecordTool{
  RecordTool(){}
  static void GetRecords(String studentID, String chapterID, Function callback) {
    var url = '${_global.bmobServer}/RecordQuery?studentID=$studentID&chapterID=$chapterID&mode=exact';
    YangIO.Network.getJSON(url, (data) {
      callback(data['records']);
    });
  }
}