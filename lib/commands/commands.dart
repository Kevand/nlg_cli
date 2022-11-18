// ignore_for_file: non_constant_identifier_names

import 'package:nlg_cli/commands/cli_command.dart';
import 'package:nlg_cli/nlg_cli.dart';
import 'package:nlg_cli/print_util.dart';

class _HelpCommand extends CLICommand {
  _HelpCommand()
      : super('help', 'Shows how to use the app', (params) async {
          printInfo("Avaliable commands:");
          for (var cmd in commandRegistry) {
            print("nlg ${cmd.name}: ${cmd.description}");
          }
        });
}

//File _templatesFile = File("${getExecPath()}/templates.json");

class _CreateCommand extends CLICommand {
  _CreateCommand()
      : super("create", "Create new project from template", (params) async {
          print("Using nlg_project module..");
        });
}

class _ToolsCommand extends CLICommand {
  _ToolsCommand()
      : super("tools", "Manage installs of developer tools", (params) async {
          print("Using nlg_tools module...");
        });
}

final CREATE_COMMAND = _CreateCommand();
final HELP_COMMAND = _HelpCommand();
final TOOLS_COMMAND = _ToolsCommand();
