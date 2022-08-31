module uim.apps.commands.plugins.unload;

@safe:
import uim.apps;

class DPluginUnloadCommand {
  this() { initialize; }
}
auto PluginUnloadCommand() { return new DPluginUnloadCommand; }

version(test_uim_apps) { unitest {
  assert(PluginUnloadCommand);
}}