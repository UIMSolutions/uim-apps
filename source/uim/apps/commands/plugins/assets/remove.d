module uim.apps.commands.plugins.assets.remove;

@safe:
import uim.apps;

class DPluginAssetsRemoveCommand {
  this() { initialize; }

    void initialize() {
    // 
  }
}
auto PluginAssetsRemoveCommand() { return new DPluginAssetsRemoveCommand; }

version(test_uim_apps) { unittest {
  assert(PluginAssetsRemoveCommand);
}}