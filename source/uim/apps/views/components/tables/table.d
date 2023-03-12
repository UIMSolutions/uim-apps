module uim.apps.views.components.tables.table;

@safe:
import uim.apps;

class DAPPTableViewComponent : DViewComponent {
  mixin(ViewComponentThis!("APPTableViewComponent"));
  
  mixin(OProperty!("string", "path"));  
  mixin(OProperty!("DViewComponent", "header"));
  mixin(OProperty!("DViewComponent", "content"));
  mixin(OProperty!("DViewComponent", "footer"));

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; } 

    return [
      H5Div(["table-responsive"], 
        BS5Table(["card-table table-vcenter text-nowrap datatable"], 
          this.header.toH5(options)~
          this.content.toH5(options)~
          this.footer.toH5(options)
        )        
      )].toH5;
  }
}
mixin(ViewComponentCalls!("APPTableViewComponent"));

version(test_uim_apps) { unittest {
  assert(APPTableViewComponent);
}}

