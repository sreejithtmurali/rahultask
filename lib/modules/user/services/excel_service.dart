import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';

class ExcelService {
  Future<void> uploadAndParseExcel(PlatformFile file) async {
    var bytes = file.bytes;
    var excel = Excel.decodeBytes(bytes!);

    for (var table in excel.tables.keys) {
      print(table); //sheet Name
      print(excel.tables[table]!.maxColumns);
      print(excel.tables[table]!.maxRows);
      for (var row in excel.tables[table]!.rows) {
        print('$row');
      }
    }
  }
}
