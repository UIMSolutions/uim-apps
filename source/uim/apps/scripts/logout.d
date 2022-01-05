module uim.apps.scripts.logout;

@safe:
import uim.apps;

auto logout() {
  return "
    sessionStorage.clear(); 
  ";
}

unittest {  
  version(test_uim_apps) {
    auto f = File("../../PUBLIC/js/apps/logout.js", "w"); // open for writing
    f.write(logout);
}}