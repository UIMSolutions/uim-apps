module uim.apps.views.components.pages.page;

@safe:
import uim.apps;

class DPage : DViewComponent {
  mixin(ViewComponentThis!("Page"));
  
  mixin(OViewComponent!("header", "header"));
  mixin(OViewComponent!("content", "content"));
  mixin(OViewComponent!("footer", "footer"));
}
mixin(ViewComponentCalls!("Page"));
