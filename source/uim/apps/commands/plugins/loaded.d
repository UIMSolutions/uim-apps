module uim.apps.commands.plugins.loaded;

@safe:
import uim.apps;

class DPluginLoadedCommand {
  this() { initialize; }
}
auto PluginLoadedCommand() { return new DPluginLoadedCommand; }

version(test_uim_apps) { unitest {
  assert(PluginLoadedCommand);
}}