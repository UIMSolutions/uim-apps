/***********************************************************************************************************************
*	Copyright: © 2017-2022 UI Manufaktur UG / 2022 Ozan Nurettin Süel (sicherheitsschmiede)                              *
*	License: Licensed under Apache 2 [https://apache.org/licenses/LICENSE-2.0.txt]                                       *
*	Authors: UI Manufaktur UG Team, Ozan Nurettin Süel (Sicherheitsschmiede)										                         * 
***********************************************************************************************************************/
module uim.apps.views.components.tabpanes.entities;

@safe:
import uim.apps;

class DAPPEntitiesTabpane : DTabpane {
  mixin(ViewComponentThis!("APPEntitiesTabpane"));

  override void initialize() {
    super.initialize;

    this.components["content"] = APPEntitiesList.itemTemplate(EntityListItem);
  }
}
mixin(ViewComponentCalls!("APPEntitiesTabpane"));

