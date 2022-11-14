import "dart:convert";
import "dart:io";

import "package:nlg_cli/base_templates/vite.dart";
import "package:nlg_cli/print_util.dart";
import "package:nlg_cli/util.dart";

File templatesFile = File("${getExecPath()}/templates.json");

Future<void> createProject(String templateName, String projectName) async {
  if (!(await templatesFile.exists())) {
    printError("There is no template file");
  }

  final String fileContent = await templatesFile.readAsString();

  Map<String, dynamic> fileRoot;
  try {
    fileRoot = jsonDecode(fileContent);
  } catch (e) {
    printError("There was an error parsing templates file: $e");
    return;
  }

  if (!fileRoot.containsKey(templateName)) {
    printError("There is no template called $templateName");
    return;
  }

  Map<String, dynamic> selectedTemplate = fileRoot[templateName];

  printInfo("Creating project $projectName via $templateName");

  switch (selectedTemplate["base"]) {
    case "vite_vanilla":
      Vite v = Vite(projectName, selectedTemplate);
      await v.createVanillaProject();
      printInfo("Finished");
      break;
    default:
      printError("Unknown template base");
      break;
  }
}
