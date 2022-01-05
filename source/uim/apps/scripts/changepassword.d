module uim.apps.scripts.changepassword;

@safe:
import uim.apps;

auto changePassword() {
  return 
    jsFunc("changePassword", ["formId"], 
      // Init values
      "let myForm = document.getElementById(formId);"~
      "messages.innerHTML = '';"
    );
}

unittest {
  version(test_uim_apps) {
    auto f = File("../../PUBLIC/js/apps/changePassword.js", "w"); // open for writing
    f.write(changePassword);
}}