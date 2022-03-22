module uim.apps.javascripts;

@safe:
import uim.apps;

string setSessionStorage(string[] keys) {
  string result; 
  foreach(key; keys) result ~= "sessionStorage.setItem('"~key~"', "~key~");"; 
  return result;
}
string setSessionStorage(STRINGAA data) {
  string result; 
  foreach(key; data.byKey) result ~= "sessionStorage.setItem('"~key~"', '"~data[key]~"');"; 
  return result;
}

string getSessionStorage(string[] keys) {
  string result; 
  foreach(key; keys) result ~= getSessionStorage(key); 
  return result;
}
string getSessionStorage(string key) {
  return jsLet(key, "sessionStorage.getItem('"~key~"')"); 
}

auto jsFetchEntities() {
  return "async function fetchEntities() {
    try {"~
      jsLet("response", "await "~
        jsFetch("myApi", [
          "method": "'POST'", "sessionId":"sessionId",
          "headers": "{'Content-Type': 'application/json'}",
          "body": "JSON.stringify({\"sessionId\":sessionId})"
        ]))~
      jsLet("results", "await response.json()")~ 
      "return results.entities; } 
    catch(error) { console.log(error); }
  }";
}

auto jsListEntities() {
  return jsAsync("listEntities", [],
  "entities=await fetchEntities();"~
  jsFor("let i=0", "i<entities.length", "i++", 
    "entities[i].selected=false;")~
  jsLet("filteredEntities", "filterEntities(entities)")~
  jsLet("pagedEntries", "filteredEntities")~

  jsIf("entriesSize>0", 
    "pagedEntries=pageEntities(filteredEntities, entriesSize, pageNo);")~
  "renderEntities(pagedEntries);");
}

auto jsRenderEntities() {
  return jsFunc("renderEntities", ["entities"], 
  jsLet("html","''")~
  jsLet("allSelected","true")~
  jsForEach("entities", jsLambda("entity", 
    jsIf(jsAnd(["allSelected", "!entity.selected"]), "allSelected=false;")~
    jsLet("htmlSegment", "entityTableRow(entity, myUrl, 'display', ['name', 'display'], ['view', 'edit', 'delete', 'div', 'print', 'export'])")~
    "html += htmlSegment;"))~
  jsIfElse("allSelected", "cbSelectAllEntities.checked=true;", "cbSelectAllEntities.checked=false;")~
  "tableBody.innerHTML = html;");
}

auto jsDoSelectEntities() {
  return jsFunc("doSelectEntities", ["event"], 
  jsLet("selected", "cbSelectAllEntities.checked")~
  jsLet("visibleEntities", "filterEntities(entities)")~
  jsFor("let i=0", "i<visibleEntities.length", "i++", "visibleEntities[i].selected=selected;")~
  jsLet("filteredEntities", "filterEntities(entities)")~
  jsLet("sortedAndFilteredEntities", "sortEntities(filteredEntities, sortCol, sortDir)")~
  "renderEntities(pageEntities(sortedAndFilteredEntities, entriesSize, pageNo));");
}

auto jsEditEntity() {
  return 
    jsFunc("editEntity", [],
      jsLet("alerts","''")~
      "messages.innerHTML = '';"~
      "entity_name.classList.remove('is-valid');"~
      "entity_name.classList.remove('is-invalid');"~
      "entity_display.classList.remove('is-valid');"~
      "entity_display.classList.remove('is-invalid');"~
      jsIfElse(jsOr("entity_name.value.length===0", "entity_display.value.length===0"), 
        //  Name or Display missing
        "alerts += checkEntityName(entity_name);"~
        "alerts += checkEntityDisplay(entity_display);"~
        "messages.innerHTML=alerts;", 
        // Sending Form Data to server
        jsConst("formData", "new FormData(Form)")~
        jsFetch("myApi+'/edit'", ["method": "'POST'", "body": "formData", "sessionId":"sessionId"], [
          "response => response.json()",  
          "result => "~jsBlock(
            "messages.innerHTML=readMessages(result.messages);"~
            jsLet("entity", "result['entity']"
          )
        )],
        "(error) => { console.error('Error:', error); }")
    ));
}

auto jsCreateEntity() {
  return 
    jsFunc("createEntity", [], 
      // Init values
      jsLet("alerts","''")~
      "messages.innerHTML = '';"~
      "entity_name.classList.remove('is-valid');"~
      "entity_name.classList.remove('is-invalid');"~
      "entity_display.classList.remove('is-valid');"~
      "entity_display.classList.remove('is-invalid');"~
      jsElementById(["Form"])~
      // Check mandatory fields
      jsIfElse(jsOr("entity_name.value.length===0", "entity_display.value.length===0"), 
        //  Name or Display missing
        "alerts += checkEntityName(entity_name);"~
        "alerts += checkEntityDisplay(entity_display);"~
        "messages.innerHTML=alerts;", 
        // Sending Form Data to server 
        jsConst("formData", "new FormData(Form)")~
        jsFetch("myApi+'/create'", ["method": "'POST'", "sessionId":"sessionId", "body": "formData"], [
          "response => response.json()",
          "result => "~jsBlock(
            jsLet("alerts", "readMessages(result.messages)")~
            jsIf("result.status=201", 
              "entity_id.value=createUUID();"~
              "entity_name.value='';"~
              "entity_display.value='';"~
              "entity_description.value='';")~
            "messages.innerHTML=alerts;"
          )
        ],
        "(error) => { console.error('Error:', error); }"
      )));
}

auto jsDeleteEntity() {
  return 
    jsFunc("deleteEntity", [],  
      "messages.innerHTML = '';"~
      jsElementById(["Form"])~
      jsConst("formData", "new FormData(Form)")~
      jsFetch("myApi+'/delete'", ["method": "'POST'", "sessionId":"sessionId", "body": "formData"], [
        "response => response.json()",  
        "result => "~jsBlock(
          jsIfElse("result.status=201", 
            "window.location.replace(myUrl);",
            jsLet("alerts", "readMessages(result.messages)")~
            "messages.innerHTML=alerts;")
          )],
          "(error) => { console.error('Error:', error); }"
        ));
}

auto jsViewEntity() {
  return
  jsFunc("viewEntity", ["formId"], 
      "messages.innerHTML = '';"~
      jsConst("formData", "new FormData(Form)")~
      jsFetch("myApi+'/view'", ["method": "'POST'", "sessionId":"sessionId", "body": "formData"], [
        "response => response.json()",  
        "result => "~jsBlock(
          jsLet("alerts", "readMessages(result.messages)")~"messages.innerHTML=alerts;"
          )],
          "(error) => { console.error('Error:', error); }"
        ));  
}