module uim.apps.collections.collection;

@safe:
import uim.apps;

class DCollection {
  this() { initialize; }

  void initialize() {
    // 
  }
}
auto Collection() { return new DCollection; }

version(test_uim_apps) { unittest {
  assert(Collection);
}}