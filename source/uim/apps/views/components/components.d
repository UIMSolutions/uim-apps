module uim.apps.views.components.components;

@safe:
import uim.apps;

class DAPPViewComponents {
  this() { /* this.name("ViewComponents"); */ }    
  this(DAPPBaseView myParent) { this().parent(myParent); }    

  mixin(OProperty!("DAPPBaseView", "parent"));

  private DAPPViewComponent[string] _components;

  size_t length() { return _components.length; }
  auto all() { return _components.byValue.array; }
  auto allKeys() { return _components.byKey.array; }
  auto allComponents() { return _components.byValue.array; }

  bool has(string anId) {
    return (anId in _components ? true : false);
  }

  auto get(string anId) {
    return _components.get(anId, NullComponent);
  }
  ref auto opIndex(string anId) {
    return get(anId);
  }

  O set(this O)(DAPPViewComponent[] newComponents...) {
    this.set(newComponents);
    return cast(O)this;     
  }

  O set(this O)(DAPPViewComponent[] newComponents) {
    newComponents.each!(comp => _components[comp.id] = comp); 
    return cast(O)this;     
  }

  O set(this O)(DAPPViewComponent newComponent) {
    if (newComponent is null) { return cast(O)this; }     

    set(newComponent.id, newComponent);
    return cast(O)this;     
  }

  O set(this O)(string anId, DAPPViewComponent newComponent) { 
    if (newComponent is null) { return cast(O)this; }     
    _components[anId] = newComponent.id(anId); 
    return cast(O)this;     
  }

  O opIndexAssign(this O)(DAPPViewComponent newComponent, string anId) {
    set(anId, newComponent);
    return cast(O)this;
  }

protected DEntity _entity;
  DEntity entity() { return _entity; }
  bool hasEntity() {
    return (this.entity !is null); 
  }

  O entity(this O)(DEntity newEntity) {
    _entity = newEntity;
 
    _components.each!(comp => comp.entity(newEntity));
    return cast(O)this;
  } 
  
  protected DEntity[] _entities;
  DEntity[] entities() { return _entities; }
  bool hasEntities() {
    return (this.entities !is null); 
  }

  O entities(this O)(DEntity[] newEntities...) {
    this.entities(newEntities);
    return cast(O)this;
  }

  O entities(this O)(DEntity[] newEntities) {
    _entities = newEntities;
    _components.each!(comp => comp.entities(_entities));

    return cast(O)this;
  }

  O remove(this O)(string anId) {
    _components.remove(anId);
    return cast(O)this;
  }

  O clear(this O)() {
    _component.clear;      
    return cast(O)this;
  }

  auto dup() {
    return _components.dup;
  }
}
auto ViewComponents() { return new DAPPViewComponents; }
auto ViewComponents(DAPPBaseView myParent) { return new DAPPViewComponents(myParent); }

version(test_uim_apps) { unittest {
    assert(ViewComponents);
    auto components = ViewComponents;
    assert(components.length == 0);
    
  }
}