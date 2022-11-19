/*
This module dosent work like a properitary project managing solution
It just helps you managing your current stuff
*/
class NLGProject {
  //Veryfing installaion of specific tools such as npm, dart or dotnet
  Future<void> verifyTools() async {}

  //Creating project based on template
  Future<void> create(String templateName) async {}

  //Lists all projects
  Future<void> list() async {}

  //Got to project saved in cache
  Future<void> goto(String projectName) async {}

  //Reloads cache
  Future<void> reload() async {}
}
