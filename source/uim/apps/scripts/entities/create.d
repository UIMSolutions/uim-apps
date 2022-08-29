module uim.apps.scripts.entities.create;

@safe:
import uim.apps;

auto createEntity() {
  string result;

  result ~= jsElementById(["entity_id", "entity_name", "entity_display", "entity_description", "messages"]);

  return result;
}

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    auto f = File("../../PUBLIC/js/apps/entities/create.js", "w"); // open for writing
    f.write(createEntity);
}}