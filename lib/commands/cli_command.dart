typedef ExecuteFunction = Future<void> Function(List<String> params);

abstract class CLICommand {
  final String name;
  final String description;
  final ExecuteFunction execute;

  const CLICommand(this.name, this.description, this.execute);
}
