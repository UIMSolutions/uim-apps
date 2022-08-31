module uim.apps.commands.command;

@safe:
import uim.apps;

class DBaseCommand {
  this() { initialize; }

  void initialize() {}
}
auto BaseCommand() { return new DBaseCommand; }

version(test_uim_apps) { unittest {
  assert(BaseCommand);
}}