module uim.apps.middlewares.middleware;

@safe:
import uim.apps;

class DAPPMiddleware {
  this() {}
} 

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    // TODO Add Tests
}}