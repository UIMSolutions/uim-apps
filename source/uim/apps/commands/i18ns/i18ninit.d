module uim.apps.commands.i18ns.init;

@safe:
import uim.apps;

class DI18nInitCommand {
  this() { initialize; }

  void initialize() {
    // 
  }
}
auto I18nInitCommand() { return new DI18nInitCommand; }

version(test_uim_apps) { unittest {
  assert(I18nInitCommand);
}}