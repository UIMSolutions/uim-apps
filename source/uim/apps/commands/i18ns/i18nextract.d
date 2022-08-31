module uim.apps.commands.i18ns.extract;

@safe:
import uim.apps;

class DI18nExtractCommand {
  this() { initialize; }
}
auto I18nExtractCommand() { return new DI18nExtractCommand; }

version(test_uim_apps) { unitest {
  assert(I18nExtractCommand);
}}