module uim.apps.views.components.tables.table;

@safe:
import uim.apps;

class DAPPTableViewComponent : DViewComponent {
  mixin(ViewComponentThis!("APPTableViewComponent"));
  
  mixin(OProperty!("string", "path"));

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; } 

    return [
      H5Div(["table-responsive"], 
        BS5Table(["card-table table-vcenter text-nowrap datatable"], 
          this.components["header"].toH5(options)~
          this.components["content"].toH5(options)~
          this.components["footer"].toH5(options)
        )        
      )].toH5;
  }
}
mixin(ViewComponentCalls!("APPTableViewComponent"));



