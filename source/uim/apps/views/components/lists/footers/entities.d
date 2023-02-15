module uim.apps.views.components.lists.footers.entities;

@safe:
import uim.apps;

class DAPPEntitiesListFooter : DAPPListFooter {
  mixin(ViewComponentThis!("APPEntitiesListFooter"));
  mixin(OProperty!("DEntity[]", "entities"));

  mixin(OProperty!("bool", "showNumber"));
  mixin(OProperty!("bool", "showSorter"));
  mixin(OProperty!("bool", "showFilter"));
  mixin(OProperty!("string", "title"));
  mixin(OProperty!("STRINGAA", "filterValues"));  
  mixin(OProperty!("STRINGAA", "sortValues"));    

  override DH5Obj[] toH5(STRINGAA options = null) { 
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return null; }

    auto cardTitleRow = BS5Row;
    auto cardTitle = BS5CardTitle(["d-block"], cardTitleRow);

    if (title || showNumber) {
      cardTitleRow.col(["col-auto"], title~
        (showNumber ? BS5Badge(["ms-1 badge-pill badge-sm"], to!string(this.entities.length)).toString : null)); 
    }

    string[] filterParameters;
    if (showFilter) {
      DH5Obj[] selectOptions;
      foreach(k; filterValues.byKey.array.sort) {
        selectOptions ~= H5Option(["value":k], filterValues[k]).selected(options.get("filterBy", null) == k);
      }

      auto filter = BS5Form(["action":options.get("path", null),
        "method":"get"],
        ("sortBy" in options ? BS5InputHidden(["name":"sortBy", "value":options["sortBy"]]) : null),
        ("sortDir" in options ? BS5InputHidden(["name":"sortDir", "value":options["sortDir"]]) : null),
        H5Div(["input-group"],
          UIMTextInput(["form-control-sm"], ["name":"filterValue", "placeholder":"Filter value...", "value": options.get("filterValue", null)]),
          BS5InputSelect(["form-control-sm"], ["name":"filterBy"], selectOptions),
          BS5ButtonSubmit(["btn-sm"], "Filtern")
      ));
      cardTitleRow.col(["ms-auto col-auto"], filter);

      filterParameters = ("filterBy" in options ? ["filterBy="~options["filterBy"]] : [])~("filterValue" in options ? ["filterValue="~options["filterValue"]] : []);
    }
    if (showSorter) {
      DH5Obj[] sortDropItems;
      foreach(k; sortValues.byKey.array.sort) {
        sortDropItems ~= BS5DropdownLink(["href":"?"~(filterParameters ? filterParameters.join("&")~"&" : null)~"sortBy="~k~"&sortDir=up"], sortValues[k]~" aufsteigend");
        sortDropItems ~= BS5DropdownLink(["href":"?"~(filterParameters ? filterParameters.join("&")~"&" : null)~"sortBy="~k~"&sortDir=down"], sortValues[k]~" absteigend");
      }

      auto sorter = BS5Dropdown;
      sorter
        .link(["btn-primary btn-sm"], "Sortieren")
        .menu(sortDropItems);

      cardTitleRow.col(["ms-auto col-auto"], sorter);
    }

    return [cardTitle].toH5;
  }
}
mixin(ViewComponentCalls!("APPEntitiesListFooter"));
