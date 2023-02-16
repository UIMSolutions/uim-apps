/***********************************************************************************************************************
*	Copyright: © 2017-2022 UI Manufaktur UG / 2022 Ozan Nurettin Süel (sicherheitsschmiede)                              *
*	License: Licensed under Apache 2 [https://apache.org/licenses/LICENSE-2.0.txt]                                       *
*	Authors: UI Manufaktur UG Team, Ozan Nurettin Süel (Sicherheitsschmiede)										                         * 
***********************************************************************************************************************/
module uim.apps.views.components.tabpanes.packages;

@safe:
import uim.apps;

class DAPPPackagesPaneViewComponent : DAPPEntitiesTabpane {
  mixin(ViewComponentThis!("APPPackagesPaneViewComponent"));

  mixin(OProperty!("DAPPListViewComponent", "list"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize;

    this
      .list(
        APPEntitiesList
          .itemTemplate(
            EntityListItem
              .rootPath("/projects/package/")));
  }

  override void beforeH5(STRINGAA options) {
    super.beforeH5(options);

    if (auto entitiesList = cast(DAPPEntitiesList)this.list) {
      entitiesList.entities(entities);
    }
  }

  override DH5Obj[] toH5(STRINGAA options = null) { 
    super.toH5(options);
    if (hasError) { return null; }
    
    return list.toH5(options);
  }
}
mixin(ViewComponentCalls!("APPPackagesPaneViewComponent"));

