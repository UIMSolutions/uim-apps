module uim.apps.views.components.pages.page;

@safe:
import uim.apps;

class DPage : DViewComponent {
  mixin(ViewComponentThis!("Page"));
  
  mixin(OComponent!("header", "header"));
  mixin(OComponent!("content", "content"));
  mixin(OComponent!("footer", "footer"));
}
mixin(ViewComponentCalls!("Page"));
