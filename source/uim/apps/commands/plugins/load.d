module uim.apps.commands.plugins.load;

@safe:
import uim.apps;

class DPluginAssetsRemoveCommand {
  this() { initialize; }
}
auto PluginAssetsRemoveCommand() { return new DPluginAssetsRemoveCommand; }

version(test_uim_apps) { unitest {
  assert(PluginAssetsRemoveCommand);
}}