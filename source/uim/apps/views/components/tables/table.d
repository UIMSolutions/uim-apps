module uim.apps.views.components.tables.table;

@safe:
import uim.apps;

class DAPPTable : DAPPViewComponent {
    this() { super(); }
    this(DAPPView myView) { this().view(myView); }
  
    mixin(OProperty!("DOOPEntity", "entity"));
    mixin(OProperty!("string", "path"));

    void tableContent(STRINGAA options = null) {
      // Reset
      _header = null;        
      _body = null;        
      _footer = null;        

      return;
    }

    DH5Obj _table;
    DH5Obj _header;
    DH5Obj _body;
    DH5Obj _footer;
    override void beforeH5(STRINGAA options = null) { // hook
      super.beforeH5(options);
      if (hasError) { return; } 

        // init
        auto _table = BS5Table(["card-table table-vcenter text-nowrap datatable"]);        
        if (entity) {
          tableContent(options);

          // create table content
          if (_header) _table(_header);
          if (_body) _table(_body);
          if (_footer) _table(_footer);
        }
        _h5Content ~= H5Div(["table-responsive"], _table);
    }
}
auto APPTable() { return new DAPPTable(); }
auto APPTable(DOOPEntity entity) { return APPTable.entity(entity); }
auto APPTable(string path) { return APPTable.path(path); }
auto APPTable(DOOPEntity entity, string path) { return APPTable.entity(entity).path(path); }



