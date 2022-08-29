module uim.apps.scripts.login2;

@safe:
import uim.apps;

auto login2() {
  return 
    jsLet([
      "entityData": "[]"
      ])~
    getSessionStorage(["loginId"])~    
    jsElementById(["loginForm", "loginPW", "messages"])~
    jsFunc("login", ["formId", "nextUrl = '/index'"], 
      // Init values
      "let myForm = document.getElementById(formId);"~
      "messages.innerHTML = '';"~
      // Validate Password
      jsIfElse("loginPW.value.length===0", 
        //  Account missing
        jsLet("alerts","checkFields({'password':loginPW})")~
        "messages.innerHTML=alerts;", 
        // Sending Form Data to server 
        jsConst("formData", "new FormData(loginForm)")~
        "formData.append('loginId', getCookie('loginId'));"~
        jsFetch("'/api/v1/login2'", ["method": "'POST'", "body": "formData"], [
          "response => response.json()",
          "result => "~jsBlock(
            jsLet("alerts", "readMessages(result.messages)")~
            jsIf("result.status=201", 
              "loginPW.value='';"~
              jsLet("sessionId", "result.sessionId")~
              setSessionStorage(["alerts", "sessionId"])~    
              "redirectPost(messages, nextUrl, {'sessionId':sessionId});")~
            "messages.innerHTML=alerts;"
          )
        ],
        "(error) => { console.error('Error:', error); }")
    ));
}

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    auto f = File("../../PUBLIC/js/apps/login2.js", "w"); // open for writing
    f.write(login2);
}}