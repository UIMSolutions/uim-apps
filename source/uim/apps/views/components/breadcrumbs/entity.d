module uim.apps.views.components.breadcrumbs.entity;

@safe:
import uim.apps;

class DAPPEntityBreadcrumbViewComponent : DAPPBreadcrumbViewComponent, IAPPWithEntity {
  mixin(APPViewComponentThis!("APPEntityBreadcrumbViewComponent"));

  mixin(OProperty!("DOOPEntity", "entity"));
}
mixin(APPViewComponentCalls!("APPEntityBreadcrumbViewComponent"));