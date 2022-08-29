module uim.apps.scripts.entitytable;

@safe:
import uim.apps;

auto entityTableRow() {
  return 
    jsFunc("entityTableRow", ["entity", "mainCol", "cols", "actions"], 
      jsLet("tableRow", "''")~
      "tableRow+=`<td><input id=\"${entity.id}\" class=\"form-check-input m-0 align-middle\" type=\"checkbox\" aria-label=\"Select item\" `+(entity.selected? `checked`:``)+`></td>`;"~
      jsFor("let i=0", "i<cols.length", "i++", jsIfElse("cols[i]===mainCol", "tableRow+=`<td>${entity[cols[i]]}</td>`;", "tableRow+=`<td class=\"w-1\">${entity[cols[i]]}</td>`;"))~
      jsIf("actions.length>0", 
        "tableRow+=`<td class=\"text-end\"><span class=\"dropdown\">
          <button class=\"btn btn-sm dropdown-toggle align-text-top\" data-bs-boundary=\"viewport\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">More</button>
          <div class=\"dropdown-menu dropdown-menu-end\" style=\"\">"~
            BS5DropdownItem(["href":"/entityes/view?entity_id=${entity.id}"], "Anzeigen").toString~
            BS5DropdownItem(["href":"/entityes/edit?entity_id=${entity.id}"], "Edit").toString~
            BS5DropdownItem(["href":"/entityes/delete?entity_id=${entity.id}"], "Delete").toString~
            BS5DropdownDivider.toString~
            BS5DropdownItem(["disabled"], ["href":"#"], "Print").toString~
            BS5DropdownItem(["disabled"], ["href":"#"], "Export").toString~
          "</div></span></td>`;")~
      "return '<tr>'+tableRow+'</tr>';");
}

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    auto f = File("../../PUBLIC/js/apps/entity_table.js", "w"); // open for writing
    f.write(entityTableRow);
}}
