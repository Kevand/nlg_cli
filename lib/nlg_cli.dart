import 'package:nlg_cli/commands/cli_command.dart';
import 'package:nlg_cli/commands/commands.dart';
import "package:nlg_cli/print_util.dart";

Set<CLICommand> commandRegistry = {};

void registerCommands() async {
  commandRegistry.add(HELP_COMMAND);
  commandRegistry.add(CREATE_COMMAND);
  commandRegistry.add(TOOLS_COMMAND);
}

Future<void> resolveCommand(List<String> arguments) async {
  final String name = arguments[0];
  try {
    final cmd = commandRegistry.singleWhere((element) => element.name == name);
    cmd.execute(arguments);
  } catch (err) {
    if (err is StateError) {
      printError("Unknown command: $name");
    } else {
      printError("Unknown error");
    }
  }
}
