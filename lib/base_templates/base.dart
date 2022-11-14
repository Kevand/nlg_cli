import 'dart:io';
import 'package:nlg_cli/print_util.dart';
import 'package:path/path.dart' as path;

class BaseTemplate{
  final String projectName;
  final Map<String, dynamic> _template;

  BaseTemplate(this.projectName, this._template);

  String get projectDir {
    final String workingDirectory = Directory.current.path;
    return path.join(workingDirectory, projectName);
  }

  Future<void> createFiles() async {
    //get list of files
    final fileList = _template["create"] as List<dynamic>;

    for(Map<String, String> f in fileList){
      final fileName = f["name"] as String;
      final content = f["name"] as String;

      File actualFile = File(path.join(projectDir, fileName));

      if(await actualFile.exists()){
        printWarning("There is a file called $fileName, skipping");
        continue;
      }

      printInfo("Creating $fileName");

      await actualFile.writeAsString(content);
    }
  }

  Future<void> overrideFiles() async {
    //get list of files
    final fileList = _template["override"] as List<dynamic>;

    for(Map<String, String> f in fileList){
      final fileName = f["name"] as String;
      final content = f["name"] as String;

      File actualFile = File(path.join(projectDir, fileName));

      if(!(await actualFile.exists())){
        printWarning("There is no file called $fileName, skipping");
        continue;
      }

      printInfo("Overriding $fileName");

      await actualFile.writeAsString(content);
    }
  }

  Future<void> deleteFiles() async {
    //get list of files
    final fileList = _template["delete"] as List<dynamic>;


    for(String fileName in fileList){
      File actualFile = File(path.join(projectDir, fileName));

      if(!(await actualFile.exists())){
        printWarning("There is no file called $fileName, skipping");
        continue;
      }

      printInfo("Deleting $fileName");

      await actualFile.delete();
    }
  }

}