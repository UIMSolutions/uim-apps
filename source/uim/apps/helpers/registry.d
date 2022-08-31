module uim.apps.helpers.registry;

@safe:
import uim.apps;

class DHelperRegistry {
  this() { initialize; }
}
auto HelperRegistry() { return new DHelperRegistry; }

version(test_uim_apps) { unitest {
  assert(HelperRegistry);
}}