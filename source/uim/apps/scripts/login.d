module uim.apps.scripts.login;

@safe:
import uim.apps;

auto login() {
  return 
    jsLet([
      "entityData": "[]"
      ])~
    jsElementById(["loginForm", "accountName", "messages"])~
    jsFunc("login", ["formId"], 
      // Init values
      "let myForm = document.getElementById(formId);"~
      "messages.innerHTML = '';"~
      // Validate Login Account
      jsIfElse("accountName.value.length===0", 
        //  Account missing
        jsLet("alerts","checkFields({'account':accountName})")~
        "messages.innerHTML=alerts;", 
        // Sending Form Data to server 
        jsConst("formData", "new FormData()")~
        "formData.append('accountName', accountName.value);"~
        jsFetch("'/api/v1/login'", ["method": "'POST'", "body": "formData"], [
          "response => response.json()",
          "result => "~jsBlock(
            jsLet("alerts", "readMessages(result.messages)")~
            jsIf("result.status=201", 
              "accountName.value='';"~
              jsLet([
                "url": "'/login2'",
                "loginId": "result.loginId"])~
              "redirectPost(messages, url, {'loginId': loginId});"
            )~
            "messages.innerHTML=alerts;"
          )
        ],
        "(error) => { console.error('Error:', error); }")
    ));
}

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    auto f = File("../../PUBLIC/js/apps/login.js", "w"); // open for writing
    f.write(login);
}}