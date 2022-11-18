import 'package:nlg_cli/nlg_cli.dart' as nlg_cli;

import 'package:nlg_cli/print_util.dart';

typedef VoidFunction = void Function();

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    printInfo(
        "Syntax: nlg <command> <arguments>. Type nlg help for list of commands");
    return;
  }

  nlg_cli.registerCommands();
  nlg_cli.resolveCommand(arguments);
}
