import 'dart:convert';
import 'dart:io';

import 'package:nlg_cli/base_templates/base.dart';
import 'package:nlg_cli/print_util.dart';

Directory _workingDirectory = Directory.current;

class Vite extends BaseTemplate {
  Vite(String name, Map<String, dynamic> template) : super(name, template);

  Future<void> createVanillaProject() async {
    await _runProcess("vanilla-ts");

    await createFiles();
    await overrideFiles();
    await deleteFiles();

    await _finish();
  }

  Future<void> _finish() async {
    printInfo("Running npm install...");

    ProcessResult result = await Process.run(
      "npm",
      ['install'],
      workingDirectory: projectDir,
      runInShell: true,
    );

    if (result.exitCode > 0) {
      printError("There was an error during finishing faze");
      return;
    }
  }

  Future<void> _runProcess(String viteTemplate) async {
    ProcessResult result = await Process.run(
      "npm",
      ["create", "vite@latest", projectName, "--", "--template", viteTemplate],
      workingDirectory: _workingDirectory.path,
      runInShell: true,
      stderrEncoding: Encoding.getByName("utf-8"),
    );

    if (result.exitCode > 0) {
      printError(
          "Process finished with unexpected exit code ${result.exitCode}, Error: ${result.stderr}");
      return;
    }
  }
}
