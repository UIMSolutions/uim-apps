module uim.apps.scripts.app;

@safe:
import uim.apps;

auto app() {
  string result;

  result ~= jsElementById(["firstNavbar", "secondNavbar"]);
  result ~= getSessionStorage(["sessionId", "siteId", "alerts"]);    

  result ~= jsFunc("formDataAppend", ["formData", "data"],
    jsForIn("key", "data", 
      "formData.append(key, data[key]);"
    )
  );

  result ~= jsFunc("uploadOneFile", ["formData", "file", "data", "url"], 
    // auto formData = new FormData();
    // auto fileField = document.querySelector('input[type="file"]');
    "formDataAppend(formData, data);"~
    "formData.append('file', file.files[0]);"~
    "fetch(url, { method:'POST', body:formData })
    .then(response => response.json())
    .then(result => { console.log('Success:', result); })
    .catch(error => { console.error('Error:', error); });");

  result ~= jsFunc("uploadManyFiles", ["formData", "files", "data", "url"], 
    // auto formData = new FormData();
    // auto fileField = document.querySelector('input[type="file"]');
    "formDataAppend(formData, data);"~
    "formData.append('file', fileField.files[0]);"~
    jsFor("let i=0", "i<files.files.length", "i++",
      "formData.append('files', files.files[i]);")~
    "fetch(url, { method:'POST', body:formData })
    .then(response => response.json())
    .then(result => { console.log('Success:', result); })
    .catch(error => { console.error('Error:', error); });");

  result ~= 
    jsFunc("redirectPost", ["target", "url", "data"],
      jsLet("formData", "''")~
      jsForIn("field", "data", "formData += `"~UIMTextInput.name("${field}").value("${data[field]}").toString~"`;")~
      "target.innerHTML=`<form id=\"postForm\" action=\"${url}\" method=\"post\">${formData}</form>`;"~
      jsElementById(["postForm"])~
      "postForm.submit();");

  result ~= jsFunc("readMessages", ["messages"], 
    jsLet("results", "''")~
    jsFor("let i=0", "i<messages.length", "i++", jsBlock(
      jsLet("message", "messages[i]")~
      jsSwitch("message.status", [
        "'INFO'": "results +=alertInfo(message.title, message.description); break;",   
        "'WARN'": "results +=alertWarning(message.title, message.description); break;",
        "'ERROR'": "results +=alertError(message.title, message.description); break;"   
      ])))~
    "return results;");

  result ~= 
  // Get Cookie
  jsFunc("getCookie", ["key"], 
    jsLet("name", `key + "="`)~
    jsLet("decodedCookie", "decodeURIComponent(document.cookie)")~
    jsLet("items", "decodedCookie.split(';')")~
    jsFor("let i=0", "i<items.length", "i++", 
      jsLet("item", "items[i]")~
      `while (item.charAt(0) == ' ') { item = item.substring(1); }`~
      jsIf("item.indexOf(name) == 0", "return item.substring(name.length, item.length);"))~
    "return '';")~
  
  // Create UUID
  jsFunc("createUUID", [], 
    jsLet("dt", "new Date().getTime()")~
    jsLet("uuid", "'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        var r = (dt + Math.random()*16)%16 | 0;
        dt = Math.floor(dt/16);
        return (c=='x' ? r :(r&0x3|0x8)).toString(16);})")~
    "return uuid;")~


  // Create a alert info
  jsFunc("alertInfo", ["title", "description"], 
    jsReturn(
      BS5Alert(["alert-success", "alert-dismissible"], 
        H5Div(["d-flex"], 
          H5Div(tablerIcon("check", ["alert-icon"])),
          H5Div(
            H5H4(["alert-title me-2"], "${title}"),
            H5Div(["text-muted"], "${description}"))),
        H5A(["btn-close"], ["data-bs-dismiss":"alert", "aria-label":"close"])))   
  )~

  // Create a alert warning
  jsFunc("alertWarning", ["title", "description"], 
    jsReturn(
      BS5Alert(["alert-warning", "alert-dismissible"], 
        H5Div(["d-flex"], 
          H5Div(tablerIcon("alert-triangle", ["alert-icon"])),
          H5Div(
            H5H4(["alert-title me-2"], "${title}"),
            H5Div(["text-muted"], "${description}"))),
        H5A(["btn-close"], ["data-bs-dismiss":"alert", "aria-label":"close"])))   
  )~

  // Create a alert error
  jsFunc("alertError", ["title", "description"], 
    jsReturn(
      BS5Alert(["alert-danger", "alert-dismissible"], 
        H5Div(["d-flex"], 
          H5Div(tablerIcon("alert-circle", ["alert-icon"])),
          H5Div(
            H5H4(["alert-title me-2"], "${title}"),
            H5Div(["text-muted"], "${description}"))),
        H5A(["btn-close"], ["data-bs-dismiss":"alert", "aria-label":"close"])))   
  )~
      errorChecking();

  return result;
}    

auto errorChecking() {
  string result;

  result ~= 
    jsFunc("timestampToLocalDate", ["timestamp"], 
      "return new Date(Math.trunc(timestamp/10000)).toLocaleDateString('de-DE', { timeZone: 'UTC' });");

  // Show the right sort button in header
  result ~= 
    jsFunc("hideSortButtons", ["buttons"], 
      jsFor("let i=0", "i<buttons.length", "i++", "buttons[i].classList.add('d-none');"));

  return result~
jsFunc("showSortButtons", ["buttons"], 
  jsFor("let i=0", "i<buttons.length", "i++", "buttons[i].classList.remove('d-none');")
)~
jsFunc("toggleSortButton", ["sortDir", "sortNo", "sortUp", "sortDown"], 
  jsIf("sortDir>0", "sortNo.className='d-none';sortUp.className='';sortDown.className='d-none';")~
  jsIf("sortDir===0", "sortNo.className='';sortUp.className='d-none';sortDown.className='d-none';")~
  jsIf("sortDir<0", "sortNo.className='d-none';sortUp.className='d-none';sortDown.className='';")
)~
// Sort entites in list
jsFunc("sortEntities", ["entities", "col", "dir"], 
  jsIfElse("dir===0", 
    "return entities;",
    "return entities.sort("~
    jsFunc(["a", "b"], 
      jsIf("dir===1", 
        jsIf("a[col]<b[col]", "return -1;")~
        jsIf("a[col]>b[col]", "return 1;")~
        "return 0;")~
      jsIf("dir===-1", 
        jsIf("a[col]<b[col]", "return 1;")~
        jsIf("a[col]>b[col]", "return -1;")~
        "return 0;"))~");"))~
// checkFields
jsFunc("checkFields", ["fields"], 
    jsLet("results", "''")~
    jsForIn("field", "fields", 
      "fields[field].classList.remove('is-valid');"~
      "fields[field].classList.remove('is-invalid');"~
      jsSwitch("field", [
        "'account'": "results+=checkAccount(fields[field]);break;",
        "'password'": "results+=checkPassword(fields[field]);break;",
        "'name'": "results+=checkName(fields[field]);break;",
        "'display'": "results+=checkDisplay(fields[field]);break;"
      ], "results+='';break;") 
    )~
    "return results;")~

    jsFunc("checkAccount", ["source"], 
      jsIf("source.value.length===0", 
        "source.classList.add('is-invalid');"~
        "return alertError('Kennung', 'Eingabefeld Kennung darf nicht leer sein.');")~
      "return '';")~
    jsFunc("checkPassword", ["source"], 
      jsIf("source.value.length===0", 
        "source.classList.add('is-invalid');"~
        "return alertError('Passwort', 'Eingabefeld Passwort darf nicht leer sein.');")~
      "return '';")~
    jsFunc("checkEntityName", ["source"], 
      jsIf("source.value.length===0", 
        "source.classList.add('is-invalid');"~
        "return alertError('Name fehlt', 'Eingabefeld Name darf nicht leer sein.');")~
      "return '';")~
    jsFunc("checkEntityDisplay", ["source"], 
      jsIf("source.value.length===0", 
        "source.classList.add('is-invalid');"~
        "return alertError('Titel fehlt', 'Eingabefeld Titel darf nicht leer sein.');")~
      "return '';");
}

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    auto f = File("../../PUBLIC/js/apps/app.js", "w"); // open for writing
    f.write(app);
}}