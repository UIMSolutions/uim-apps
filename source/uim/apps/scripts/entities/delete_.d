module uim.apps.scripts.entities.delete_;

@safe:
import uim.apps;

auto deleteEntity() {
  string result;

  result ~= jsElementById(["entity_id", "entity_name", "entity_display", "entity_description", "messages"]);

  return result;
}

unittest {
  version(uim_apps) {
    auto f = File("../../PUBLIC/js/apps/entities/delete.js", "w"); // open for writing
    f.write(deleteEntity);
}}