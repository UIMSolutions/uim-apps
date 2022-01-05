module uim.apps.scripts.entities.create;

@safe:
import uim.apps;

auto createEntity() {
  string result;

  result ~= jsElementById(["entity_id", "entity_name", "entity_display", "entity_description", "messages"]);

  return result;
}

unittest {
  version(test_uim_apps) {
    auto f = File("../../PUBLIC/js/apps/entities/create.js", "w"); // open for writing
    f.write(createEntity);
}}