module uim.apps.views.object_;

@safe:
import uim.apps;

class DAPPViewObject : DAPPObject {
  this() { super(); }

  mixin(OProperty!("DViewComponents", "components"));

  protected DOOPEntity _entity;
  DOOPEntity entity() { return _entity; }
  bool hasEntity() {
    return (this.entity !is null); 
  }

  O entity(this O)(DOOPEntity newEntity) {
    _entity = newEntity;
 
    this.components.entity(newEntity);
    _afterSetEntity;
    return cast(O)this;
  } 
  
  void _afterSetEntity() {} // hook

  protected DOOPEntity[] _entities;
  DOOPEntity[] entities() { return _entities; }
  bool hasEntities() {
    return (this.entities !is null); 
  }

  O entities(this O)(DOOPEntity[] newEntities...) {
    this.entities(newEntities);
    return cast(O)this;
  }

  O entities(this O)(DOOPEntity[] newEntities) {
    _entities = newEntities;

    this.components.entities(newEntities);
    _afterSetEntities;
    return cast(O)this;
  }
  void _afterSetEntities() {}

  override void initialize() {
    super.initialize;

    this
      .components(ViewComponents);
  }

  O addComponent(this O)(DViewComponent newComponent) {
    this.components[newComponent.id] = newComponent;
    return cast(O)this;
  }

  O addComponent(this O)(string anId, DViewComponent newComponent) {
    this.components[anId] = newComponent;
    return cast(O)this;
  }

  void opIndexAssign(DViewComponent newComponent, string anId) {
    addComponent(anId, newComponent);
  }

  override void opIndexAssign(string newValue, string key) {
    this.parameter(key, newValue);
  }
}

