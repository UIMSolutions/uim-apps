module uim.apps.views.components.tables.table;

@safe:
import uim.apps;

class DAPPTable : DAPPViewComponent {
  mixin(APPViewComponentThis!("APPTable"));
  
  mixin(OProperty!("string", "path"));

  mixin(OProperty!("DAPPViewComponent", "header"));
  mixin(OProperty!("DAPPViewComponent", "body_"));
  mixin(OProperty!("DAPPViewComponent", "footer"));

  override void beforeH5(STRINGAA options = null) { 
    super.beforeH5(options); 
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; } 

    return [
      H5Div(["table-responsive"], 
        BS5Table(["card-table table-vcenter text-nowrap datatable"], 
          (header ? header.toH5(options) : null)~
          (body_ ? body_.toH5(options) : null)~
          (footer ? footer.toH5(options) : null)
        )        
      )].toH5;
  }
}
mixin(APPViewComponentCalls!("APPTable"));



