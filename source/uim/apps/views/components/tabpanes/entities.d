/***********************************************************************************************************************
*	Copyright: © 2017-2022 UI Manufaktur UG / 2022 Ozan Nurettin Süel (sicherheitsschmiede)                              *
*	License: Licensed under Apache 2 [https://apache.org/licenses/LICENSE-2.0.txt]                                       *
*	Authors: UI Manufaktur UG Team, Ozan Nurettin Süel (Sicherheitsschmiede)										                         * 
***********************************************************************************************************************/
module uim.apps.views.components.tabpanes.entities;

@safe:
import uim.apps;

class DAPPEntitiesTabpane : DTabpane, IAPPWithEntities {
  mixin(ViewComponentThis!("APPEntitiesTabpane"));

  protected DOOPEntity[] _entities;
  DOOPEntity[] entities() { return _entities; }
  bool hasEntities() {
    return (this.entities !is null); 
  }

  O entities(this O)(DOOPEntity[] newEntities) {
    _entities = newEntities;

/*     if (auto entitiesHeader = cast(IAPPWithEntities)this.header) {
      entitiesHeader.entities(this.entities); 
    }
    if (auto entitiesContent = cast(IAPPWithEntities)this.content) {
      entitiesContent.entities(this.entities); 
    }
    if (auto entitiesFooter = cast(IAPPWithEntities)this.footer) {
      entitiesFooter.entities(this.entities); 
    } */

    return cast(O)this;
  }

  override void initialize() {
    super.initialize;

    this
      .content(
        APPEntitiesList
          .itemTemplate(
            EntityListItem));
  }
}
mixin(ViewComponentCalls!("APPEntitiesTabpane"));

