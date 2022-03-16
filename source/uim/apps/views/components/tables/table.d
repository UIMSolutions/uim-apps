module uim.apps.views.components.tables.table;

@safe:
import uim.apps;

class DAPPTableViewComponent : DViewComponent {
  mixin(ViewComponentThis!("APPTableViewComponent"));
  
  mixin(OProperty!("string", "path"));

/*   mixin(APPViewProperty!("DViewComponent", "header"));
  mixin(APPViewProperty!("DViewComponent", "body_"));
  mixin(APPViewProperty!("DViewComponent", "footer")); */

  override void beforeH5(STRINGAA options = null) { 
    super.beforeH5(options); 
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; } 

    return [
      H5Div(["table-responsive"], 
        BS5Table(["card-table table-vcenter text-nowrap datatable"], 
          (header ? header.toH5(options) : null)~
          (content ? content.toH5(options) : null)~
          (footer ? footer.toH5(options) : null)
        )        
      )].toH5;
  }
}
mixin(ViewComponentCalls!("APPTableViewComponent"));



