module uim.apps.scripts.logout;

@safe:
import uim.apps;

auto logout() {
  return "
    sessionStorage.clear(); 
  ";
}

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    auto f = File("../../PUBLIC/js/apps/logout.js", "w"); // open for writing
    f.write(logout);
}}