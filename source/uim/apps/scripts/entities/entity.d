module uim.apps.scripts.entities.entity;

@safe:
import uim.apps;

auto entity() {
  string result;

  result ~= jsClass("APPEntity", [
    jsMethod("constructor", ["data"], 
      jsForIn("key", "data", "this[key] = data[key];")
    )
  ]);
  
  //Entity row
  result ~= 
    jsFunc("entityTableRow", ["entity", "path", "mainCol", "cols", "actions"], 
      jsLet("tableRow", "''")~
      "tableRow+=`<td><input id=\"${entity.id}\" class=\"form-check-input m-0 align-middle\" type=\"checkbox\" aria-label=\"Select item\" `+(entity.selected? `checked`:``)+`></td>`;"~
      "tableRow+=`<td class=\"w-1\">${timestampToLocalDate(entity.createdOn)}</td>`;"~
      "tableRow+=`<td class=\"w-1\">${timestampToLocalDate(entity.modifiedOn)}</td>`;"~
      jsFor("let i=0", "i<cols.length", "i++", 
        jsIfElse("cols[i]===mainCol", 
          "tableRow+=`<td><a href=\"${path}/view?entity_id=${entity.id}\">${entity[cols[i]]}</a></td>`;", 
          "tableRow+=`<td class=\"w-1\">${entity[cols[i]]}</td>`;"))~
      "return '<tr>'+tableRow+'</tr>';");

  return result;

/*
Old version
jsFunc("entityTableRow", ["entity", "path", "mainCol", "cols", "actions"], 
  jsLet("tableRow", "''")~
  "tableRow+=`<td><input id=\"${entity.id}\" class=\"form-check-input m-0 align-middle\" type=\"checkbox\" aria-label=\"Select item\" `+(entity.selected? `checked`:``)+`></td>`;"~
  jsFor("let i=0", "i<cols.length", "i++", 
    jsIfElse("cols[i]===mainCol", "tableRow+=`<td>${entity[cols[i]]}</td>`;", "tableRow+=`<td class=\"w-1\">${entity[cols[i]]}</td>`;"))~
  jsIf("actions.length>0", 
    "tableRow+=`<td class=\"text-end\"><span class=\"dropdown\">
      <button class=\"btn btn-sm dropdown-toggle align-text-top\" data-bs-boundary=\"viewport\" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">Aktionen</button>
      <div class=\"dropdown-menu dropdown-menu-end\" style=\"\">"~
        BS5DropdownLink(["href":"${path}/view?entity_id=${entity.id}"], "Anzeigen").toString~
        BS5DropdownLink(["href":"${path}/edit?entity_id=${entity.id}"], "Bearbeiten").toString~
        BS5DropdownLink(["disabled"], ["href":"${path}/lock?entity_id=${entity.id}"], "Sperren").toString~
        BS5DropdownLink(["disabled"], ["href":"${path}/version?entity_id=${entity.id}"], "Versionieren").toString~
        BS5DropdownLink(["href":"${path}/delete?entity_id=${entity.id}"], "Löschen").toString~
        BS5DropdownDivider.toString~
        BS5DropdownLink(["disabled"], ["href":"#"], "Drucken").toString~
        BS5DropdownLink(["disabled"], ["href":"#"], "Exportieren").toString~
      "</div></span></td>`;")~
  "return '<tr>'+tableRow+'</tr>';")~
*/


}


version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    auto f = File("../../PUBLIC/js/apps/entities/entity.js", "w"); // open for writing
    f.write(entity);
}}

/*

<div class="card mb-3">
                  <div class="card-header">
                    <h3 class="card-title">Last commits</h3>
                  </div>
                  <div class="list-group list-group-flush list-group-hoverable">
                    <div class="list-group-item">
                      <div class="row align-items-center">
                        <div class="col-auto"><span class="badge bg-red"></span></div>
                        <div class="col-auto">
                          <a href="#">
                            <span class="avatar" style="background-image: url(./static/avatars/000m.jpg)"></span>
                          </a>
                        </div>
                        <div class="col text-truncate">
                          <a href="#" class="text-body d-block">Paweł Kuna</a>
                          <small class="d-block text-muted text-truncate mt-n1">Change deprecated html tags to text decoration classes (#29604)</small>
                        </div>
                        <div class="col-auto">
                          <a href="#" class="list-group-item-actions"><!-- Download SVG icon from http://tabler-icons.io/i/star -->
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon text-muted" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.75l-6.172 3.245l1.179 -6.873l-5 -4.867l6.9 -1l3.086 -6.253l3.086 6.253l6.9 1l-5 4.867l1.179 6.873z"></path></svg>
                          </a>
                        </div>
                      </div>
                    </div>
                    <div class="list-group-item">
                      <div class="row align-items-center">
                        <div class="col-auto"><span class="badge"></span></div>
                        <div class="col-auto">
                          <a href="#">
                            <span class="avatar">JL</span>
                          </a>
                        </div>
                        <div class="col text-truncate">
                          <a href="#" class="text-body d-block">Jeffie Lewzey</a>
                          <small class="d-block text-muted text-truncate mt-n1">justify-content:between ⇒ justify-content:space-between (#29734)</small>
                        </div>
                        <div class="col-auto">
                          <a href="#" class="list-group-item-actions show"><!-- Download SVG icon from http://tabler-icons.io/i/star -->
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon text-yellow" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.75l-6.172 3.245l1.179 -6.873l-5 -4.867l6.9 -1l3.086 -6.253l3.086 6.253l6.9 1l-5 4.867l1.179 6.873z"></path></svg>
                          </a>
                        </div>
                      </div>
                    </div>
                    <div class="list-group-item">
                      <div class="row align-items-center">
                        <div class="col-auto"><span class="badge bg-"></span></div>
                        <div class="col-auto">
                          <a href="#">
                            <span class="avatar" style="background-image: url(./static/avatars/002m.jpg)"></span>
                          </a>
                        </div>
                        <div class="col text-truncate">
                          <a href="#" class="text-body d-block">Mallory Hulme</a>
                          <small class="d-block text-muted text-truncate mt-n1">Update change-version.js (#29736)</small>
                        </div>
                        <div class="col-auto">
                          <a href="#" class="list-group-item-actions"><!-- Download SVG icon from http://tabler-icons.io/i/star -->
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon text-muted" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.75l-6.172 3.245l1.179 -6.873l-5 -4.867l6.9 -1l3.086 -6.253l3.086 6.253l6.9 1l-5 4.867l1.179 6.873z"></path></svg>
                          </a>
                        </div>
                      </div>
                    </div>
                    <div class="list-group-item">
                      <div class="row align-items-center">
                        <div class="col-auto"><span class="badge bg-green"></span></div>
                        <div class="col-auto">
                          <a href="#">
                            <span class="avatar" style="background-image: url(./static/avatars/003m.jpg)"></span>
                          </a>
                        </div>
                        <div class="col text-truncate">
                          <a href="#" class="text-body d-block">Dunn Slane</a>
                          <small class="d-block text-muted text-truncate mt-n1">Regenerate package-lock.json (#29730)</small>
                        </div>
                        <div class="col-auto">
                          <a href="#" class="list-group-item-actions"><!-- Download SVG icon from http://tabler-icons.io/i/star -->
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon text-muted" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.75l-6.172 3.245l1.179 -6.873l-5 -4.867l6.9 -1l3.086 -6.253l3.086 6.253l6.9 1l-5 4.867l1.179 6.873z"></path></svg>
                          </a>
                        </div>
                      </div>
                    </div>
                    <div class="list-group-item">
                      <div class="row align-items-center">
                        <div class="col-auto"><span class="badge bg-red"></span></div>
                        <div class="col-auto">
                          <a href="#">
                            <span class="avatar" style="background-image: url(./static/avatars/000f.jpg)"></span>
                          </a>
                        </div>
                        <div class="col text-truncate">
                          <a href="#" class="text-body d-block">Emmy Levet</a>
                          <small class="d-block text-muted text-truncate mt-n1">Some minor text tweaks</small>
                        </div>
                        <div class="col-auto">
                          <a href="#" class="list-group-item-actions show"><!-- Download SVG icon from http://tabler-icons.io/i/star -->
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon text-yellow" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.75l-6.172 3.245l1.179 -6.873l-5 -4.867l6.9 -1l3.086 -6.253l3.086 6.253l6.9 1l-5 4.867l1.179 6.873z"></path></svg>
                          </a>
                        </div>
                      </div>
                    </div>
                    <div class="list-group-item">
                      <div class="row align-items-center">
                        <div class="col-auto"><span class="badge bg-yellow"></span></div>
                        <div class="col-auto">
                          <a href="#">
                            <span class="avatar" style="background-image: url(./static/avatars/001f.jpg)"></span>
                          </a>
                        </div>
                        <div class="col text-truncate">
                          <a href="#" class="text-body d-block">Maryjo Lebarree</a>
                          <small class="d-block text-muted text-truncate mt-n1">Link to versioned docs</small>
                        </div>
                        <div class="col-auto">
                          <a href="#" class="list-group-item-actions"><!-- Download SVG icon from http://tabler-icons.io/i/star -->
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon text-muted" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.75l-6.172 3.245l1.179 -6.873l-5 -4.867l6.9 -1l3.086 -6.253l3.086 6.253l6.9 1l-5 4.867l1.179 6.873z"></path></svg>
                          </a>
                        </div>
                      </div>
                    </div>
                    <div class="list-group-item">
                      <div class="row align-items-center">
                        <div class="col-auto"><span class="badge"></span></div>
                        <div class="col-auto">
                          <a href="#">
                            <span class="avatar">EP</span>
                          </a>
                        </div>
                        <div class="col text-truncate">
                          <a href="#" class="text-body d-block">Egan Poetz</a>
                          <small class="d-block text-muted text-truncate mt-n1">Copywriting edits</small>
                        </div>
                        <div class="col-auto">
                          <a href="#" class="list-group-item-actions"><!-- Download SVG icon from http://tabler-icons.io/i/star -->
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon text-muted" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.75l-6.172 3.245l1.179 -6.873l-5 -4.867l6.9 -1l3.086 -6.253l3.086 6.253l6.9 1l-5 4.867l1.179 6.873z"></path></svg>
                          </a>
                        </div>
                      </div>
                    </div>
                    <div class="list-group-item">
                      <div class="row align-items-center">
                        <div class="col-auto"><span class="badge bg-yellow"></span></div>
                        <div class="col-auto">
                          <a href="#">
                            <span class="avatar" style="background-image: url(./static/avatars/002f.jpg)"></span>
                          </a>
                        </div>
                        <div class="col text-truncate">
                          <a href="#" class="text-body d-block">Kellie Skingley</a>
                          <small class="d-block text-muted text-truncate mt-n1">Enable RFS for font resizing</small>
                        </div>
                        <div class="col-auto">
                          <a href="#" class="list-group-item-actions show"><!-- Download SVG icon from http://tabler-icons.io/i/star -->
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon text-yellow" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M12 17.75l-6.172 3.245l1.179 -6.873l-5 -4.867l6.9 -1l3.086 -6.253l3.086 6.253l6.9 1l-5 4.867l1.179 6.873z"></path></svg>
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
*/