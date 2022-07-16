module uim.apps.views.components.tables.history;

@safe:
import uim.apps;

/* class DAPPTableHistory : DAPPEntitiesTableHeader {
  this() { super(); }
  this(DAPPView myView) { this().view(myView); }

  mixin(OProperty!("DOOPEntity[]", "history"));
  O history(this O)(Json[] jsons) {
      _history ~= jsons.map!(a => OOPEntity(a)).array;
      return cast(O)this;
  }

  DH5Obj row(DOOPEntity entity) {
    auto id = entity ? entity.id.toString : UUID().toString;
    auto link = "?entity_id="~id;
      return
        H5Tr
          .td(BS5InputDate(["form-control-flush"], ["readonly":"readonly"]).value(entity.createdOn))
          .td(UIMTextInput(["form-control-flush"], ["readonly":"readonly"]).value(entity.name))
          .td(UIMTextInput(["form-control-flush"], ["readonly":"readonly"]).value(entity.display))
          .td(
             H5Div(["btn-list"], 
              H5Span(["d-none d-sm-inline"],               
                buttonLinkView(path, id),
                buttonLinkDelete(path, id)
              )                
            ) 
          );
  }

  override void beforeH5(STRINGAA options = null) {    
    super.beforeH5(options);

    auto rows = history.map!(a => row(a)).array;

    _header = H5Thead(
      H5Tr
        .th("Created on")
        .th("Name")
        .th("Titel")
        .th(["text-end"], "Actions"));
    _body = H5Tbody(rows);
  }
    /* return 
        BS5CardBody(
            H5Div(["card-title"], parameters.get("title", "History")),
            BS5Row( 
                BS5Col(["col-12"], 
                    H5Div(["table-responsive"], 
                        BS5Table(["card-table table-vcenter text-nowrap datatable"])
                            .header(header)
                            .body_(rows)
                        )
                    )
                )
        ).toString;

  } * /
}
auto APPTableHistory() { return new DAPPTableHistory; }
/* auto APPTableHistory(string myKey, string myTitle) { return APPTableHistory.key(myKey).title(myTitle); }
auto APPTableHistory(string myKey, string myTitle, string myPath) { return APPTableHistory.key(myKey).title(myTitle).path(myPath); }
 * /  

  
 */