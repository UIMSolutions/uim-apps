module uim.apps.commands.plugins.assets.copy;

@safe:
import uim.apps;

class DPluginAssetsCopyCommand {
  this() { initialize; }
}
auto PluginAssetsCopyCommand() { return new DPluginAssetsCopyCommand; }

version(test_uim_apps) { unitest {
  assert(PluginAssetsCopyCommand);
}}