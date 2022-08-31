module uim.apps.commands.i18ns.init;

@safe:
import uim.apps;

class DI18nInitCommand {
  this() { initialize; }
}
auto I18nInitCommand() { return new DI18nInitCommand; }

version(test_uim_apps) { unitest {
  assert(I18nInitCommand);
}}