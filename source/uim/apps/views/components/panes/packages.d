/***********************************************************************************************************************
*	Copyright: © 2017-2022 UI Manufaktur UG / 2022 Ozan Nurettin Süel (sicherheitsschmiede)                              *
*	License: Licensed under Apache 2 [https://apache.org/licenses/LICENSE-2.0.txt]                                       *
*	Authors: UI Manufaktur UG Team, Ozan Nurettin Süel (Sicherheitsschmiede)										                         * 
***********************************************************************************************************************/
module uim.apps.views.components.panes.packages;

@safe:
import uim.apps;

class DAPPPackagesPaneViewComponent : DAPPEntitiesPaneViewComponent {
  mixin(APPViewComponentThis!("APPPackagesPaneViewComponent"));

  mixin(OProperty!("DAPPListViewComponent", "list"));

  override void initialize() {
    super.initialize;

    this
      .list(
        APPListViewComponent
          .itemTemplate(
            APPListEntityComponent
              .rootPath("/projects/package/")));
  }

  override void beforeH5(STRINGAA options) {
    super.beforeH5(options);

    this.list
      .entities(entities);
  }

  override DH5Obj[] toH5(STRINGAA options = null) { 
    super.toH5(options);
    if (hasError) { return null; }
    
    return list.toH5(options);
  }
}
mixin(APPViewComponentCalls!("APPPackagesPaneViewComponent"));

