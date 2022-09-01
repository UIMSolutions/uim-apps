module uim.apps.helpers.registry;

@safe:
import uim.apps;

class DHelperRegistry {
  this() { initialize; }

    void initialize() {
    // 
  }
}
auto HelperRegistry() { return new DHelperRegistry; }

version(test_uim_apps) { unittest {
  assert(HelperRegistry);
}}