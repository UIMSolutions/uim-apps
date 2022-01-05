module uim.apps.scripts.entities.view;

@safe:
import uim.apps;

auto viewEntity() {
  string result;

  result ~= jsElementById(["entity_id", "entity_name", "entity_display", "entity_description", "messages"]);

  return result;
}

unittest {
  version(test_uim_apps) {
    auto f = File("../../PUBLIC/js/apps/entities/view.js", "w"); // open for writing
    f.write(viewEntity);
}}