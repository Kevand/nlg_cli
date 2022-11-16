class TemplateModel {
  final String name;
  String? description;
  String? base;
  FileActionsModel? files;
  DirectoryActionsModel? directories;
  ProcessModel? initProcess, finishProcess;

  TemplateModel(this.name);

  TemplateModel.fromJson(Map<String, dynamic> json) : name = json['name'] {
    description = json['description'];
    base = json['base'];
    files = json['files'];
    directories = json['dirs'];
    initProcess = json['init'];
    finishProcess = json['finish'];
  }
}

class ProcessModel {
  final String name;
  List<String>? args;

  ProcessModel(this.name);

  ProcessModel.fromJson(Map<String, dynamic> json) : name = json['name'] {
    args = json['args'] as List<String>;
  }
}

class IOActionsModel<T> {
  List<T>? create;
  List<T>? override;
  List<String>? delete;

  IOActionsModel.fromJson(Map<String, dynamic> json) {
    create = json['create'];
    override = json['override'];
    delete = json['delete'];
  }
}

class FileActionsModel extends IOActionsModel<ContentFileModel> {
  FileActionsModel.fromJson(super.json) : super.fromJson();
}

class DirectoryActionsModel extends IOActionsModel<String> {
  DirectoryActionsModel.fromJson(super.json) : super.fromJson();
}

class ContentFileModel {
  final String name;
  final String content;

  ContentFileModel(this.name, this.content);

  ContentFileModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        content = json['content'];
}
