module uim.apps.commands.plugins.assets.symlink;

@safe:
import uim.apps;

class DPluginAssetsSymlinkCommand {
  this() { initialize; }

    void initialize() {
    // 
  }
}
auto PluginAssetsSymlinkCommand() { return new DPluginAssetsSymlinkCommand; }

version(test_uim_apps) { unittest {
  assert(PluginAssetsSymlinkCommand);
}}