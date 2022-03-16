module uim.apps.views.components.tables.entity;

@safe:
import uim.apps;

class DAPPEntityTable : DAPPTableViewComponent, IAPPWithEntity {
  mixin(ViewComponentThis!("APPEntityTable"));

  protected DOOPEntity _entity;
  DOOPEntity entity() { return _entity; }
  bool hasEntity() {
    return (this.entity !is null); 
  }

  O entity(this O)(DOOPEntity newEntity) {
    _entity = newEntity;

    if (auto entityHeader = cast(IAPPWithEntity)this.header) {
        entityHeader.entity(this.entity); 
    }
    if (auto entityContent = cast(IAPPWithEntity)this.content) {
      entityContent.entity(this.entity); 
    }
    if (auto entityFooter = cast(IAPPWithEntity)this.footer) {
      entityFooter.entity(this.entity); 
    } 

    return cast(O)this;
  }
} 
mixin(ViewComponentCalls!("APPEntityTable"));
