module uim.apps.scripts.lostpassword;

@safe:
import uim.apps;

auto lostPassword() {
  return     
    jsFunc("lostPassword", ["formId"], 
      // Init values
      "let myForm = document.getElementById(formId);"~
      "messages.innerHTML = '';"
    );
}

unittest {
  version(uim_apps) {
  auto f = File("../../PUBLIC/js/apps/lostpassword.js", "w"); // open for writing
  f.write(lostPassword);
}}