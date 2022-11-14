import 'dart:io';

void printError(String message) {
  stdout.write("[\x1b[31mERROR\x1b[97m] $message \n");
}

void printInfo(String message) {
    stdout.write("[\x1b[94mINFO\x1b[97m] $message \n");
}

void printWarning(String message) {
  stdout.write("[\x1b[33mWARN\x1b[97m] $message \n");

}