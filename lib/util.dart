import "dart:io";

import "package:path/path.dart" as p;

String getExecPath() {
  return p.dirname(Platform.resolvedExecutable);
}
