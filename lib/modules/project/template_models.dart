class TemplateModel {
  final String name;
  String description;
  String? base;
  FileActionsModel? files;
  DirectoryActionsModel? directories;
  ProcessModel? initProcess, finishProcess;

  TemplateModel(this.name, this.description);

  TemplateModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        description = json['desc'] as String {
    base = json['base'] as String;
    files = FileActionsModel.fromJson(json['files']);
    directories = DirectoryActionsModel.fromJson(json['dirs']);
    initProcess = ProcessModel.fromJson(json['init']);
    finishProcess = ProcessModel.fromJson(json['finish']);
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
  List<T> create;
  List<T> override;
  List<String> delete;

  IOActionsModel(this.create, this.override, this.delete);

  IOActionsModel.fromJson(Map<String, dynamic> json)
      : create = json['create'] as List<T>,
        override = json['override'] as List<T>,
        delete = json['delete'] as List<String>;
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
      : name = json['name'] as String,
        content = json['content'] as String;
}
