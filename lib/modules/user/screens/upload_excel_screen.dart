import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../services/excel_service.dart';

class UploadExcelScreen extends StatelessWidget {
  final ExcelService _excelService = ExcelService();

  void _pickFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      await _excelService.uploadAndParseExcel(file);
      // Navigate to weather report screen after processing the file
      Navigator.pushNamed(context, '/weatherReport');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Excel'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            _pickFile(context);
          },
          child: Text('Pick Excel File'),
        ),
      ),
    );
  }
}
