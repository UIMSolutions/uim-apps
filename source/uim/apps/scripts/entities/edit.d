module uim.apps.scripts.entities.edit;

@safe:
import uim.apps;

auto editEntity() {
  string result;

  result ~= jsElementById(["entity_id", "entity_name", "entity_display", "entity_description", "messages"]);

  result ~= jsFunc("checkEntityName", ["source"], 
      jsIf("source.value.length===0", 
        "source.classList.add('is-invalid');"~
        "return alertError('Name fehlt', 'Eingabefeld Name darf nicht leer sein.');")~
      "return '';")~
    jsFunc("checkEntityDisplay", ["source"], 
      jsIf("source.value.length===0", 
        "source.classList.add('is-invalid');"~
        "return alertError('Titel fehlt', 'Eingabefeld Titel darf nicht leer sein.');")~
      "return '';");

  return result;
}

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    auto f = File("../../PUBLIC/js/apps/entities/edit.js", "w"); // open for writing
    f.write(editEntity);
}}