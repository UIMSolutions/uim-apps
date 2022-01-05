module uim.apps.scripts.register;

@safe:
import uim.apps;

auto registerUser() {
  return 
    jsFunc("registerUser", ["formId"], 
      // Init values
      "let myForm = document.getElementById(formId);"~
      "messages.innerHTML = '';"
    );
}

unittest {
  version(test_uim_apps) {
    auto f = File("../../PUBLIC/js/apps/registeruser.js", "w"); // open for writing
    f.write(registerUser);
}}