module uim.apps.collections.collection;

@safe:
import uim.apps;

class DCollection {
  this() { initialize; }
}
auto Collection() { return new DCollection; }

version(test_uim_apps) { unitest {
  assert(Collection);
}}