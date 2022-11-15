import 'dart:convert';

import 'package:nlg_cli/nlg_cli.dart' as nlg_cli;
import "dart:io";

import 'package:nlg_cli/print_util.dart';
import 'package:nlg_cli/util.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    printInfo("Syntax: nlg <command> <arguments>");
    return;
  }

  final String command = arguments[0];

  switch (command) {
    case "create":
      {
        final String templateName = arguments[1];
        final String projectName = arguments[2];

        nlg_cli.createProject(templateName, projectName);
        break;
      }
    case "templates":
      {
        File templatesFile = File("${getExecPath()}/templates.json");

        Map<String, dynamic> asJson =
            jsonDecode(templatesFile.readAsStringSync());

        for (int i = 0; i < asJson.length; i++) {
          print("$i. ${asJson.keys.elementAt(i)}");
        }

        break;
      }
  }
}
