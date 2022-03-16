module uim.apps.views.components.breadcrumbs.entities;

@safe:
import uim.apps;

class DAPPEntitiesBreadcrumbViewComponent : DAPPBreadcrumbViewComponent, IAPPWithEntities {
  mixin(ViewComponentThis!("APPEntitiesBreadcrumbViewComponent"));

  mixin(OProperty!("DOOPEntity[]", "entities"));
}
mixin(ViewComponentCalls!("APPEntitiesBreadcrumbViewComponent"));