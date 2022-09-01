module uim.apps.helpers.helper;

@safe:
import uim.apps;

class DHelper {
  this() { initialize; }

    void initialize() {
    // 
  }
}
auto Helper() { return new DHelper; }

version(test_uim_apps) { unittest {
  assert(Helper);
}}