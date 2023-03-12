module uim.apps.views.components.pages.page;

@safe:
import uim.apps;

class DPage : DViewComponent {
  mixin(ViewComponentThis!("Page"));
  
  mixin(OProperty!("DViewComponent", "header"));
  mixin(OProperty!("DViewComponent", "content"));
  mixin(OProperty!("DViewComponent", "footer"));
}
mixin(ViewComponentCalls!("Page"));
