module uim.apps.views.components.breadcrumbs.entities;

@safe:
import uim.apps;

class DAPPEntitiesBreadcrumbViewComponent : DAPPBreadcrumbViewComponent, IAPPWithEntities {
  mixin(APPViewComponentThis!("APPEntitiesBreadcrumbViewComponent"));

  mixin(OProperty!("DOOPEntity[]", "entities"));
}
mixin(APPViewComponentCalls!("APPEntitiesBreadcrumbViewComponent"));