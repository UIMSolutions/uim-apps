module uim.apps.views.components.pages.page;

@safe:
import uim.apps;

class DPage : DAPPViewComponent {
  mixin(ViewComponentThis!("Page"));
  
  mixin(OProperty!("DAPPViewComponent", "header"));
  mixin(OProperty!("DAPPViewComponent", "content"));
  mixin(OProperty!("DAPPViewComponent", "footer"));
}
mixin(ViewComponentCalls!("Page"));
