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

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    auto f = File("../../PUBLIC/js/apps/changePassword.js", "w"); // open for writing
    f.write(changePassword);
}}