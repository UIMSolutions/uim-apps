module uim.apps.views.components.components;

@safe:
import uim.apps;

class DViewComponents {
  this() { /* this.name("ViewComponents"); */ }    
  this(DViewObject myParentComponent) { 
    this().parent(myParentComponent);    
  }    

  mixin(OProperty!("DViewObject", "parent"));

  private DViewComponent[] _components;

  size_t length() { return _components.length; }
  auto all() { return _components; }

  bool has(string anId) {
    foreach(component; _components) {
      if (component && component.id == anId) return true; }
    return false;
  }

  size_t pos(string anId) {
    foreach(index, component; _components) {
      if (component && component.id == anId) return index; }
    return -1;
  }

  auto get(string anId) {
    foreach(component; _components) {
      if (component && component.id == anId) return component; }
    return NullComponent;
  }
  ref auto opIndex(string anId) {
    return get(anId);
  }

  O add(this O)(DViewComponent[] newComponents...) {
    this.add(newComponents);
    return cast(O)this;     
  }

  O add(this O)(DViewComponent[] newComponents) {
    foreach(newComponent; newComponents) {
      if (newComponent) {
        this.add(newComponent.id, newComponent); 
      }
    }
    return cast(O)this;     
  }

  O add(this O)(string anId, DViewComponent newComponent) {
    if (has(anId)) {
      _components[pos(anId)] = newComponent.id(anId); 
    }
    else {
      _components ~= newComponent.id(anId); 
    }
    return cast(O)this;     
  }

  O set(this O)(DViewComponent newComponent) {
    if (newComponent is null) { return cast(O)this; }     

    set(newComponent.id, newComponent);
    return cast(O)this;     
  }

  O set(this O)(string anId, DViewComponent newComponent) { 
    if (newComponent is null) { return cast(O)this; }     

    if (has(anId)) {
      _components[pos(anId)] = newComponent.id(anId); 
    }
    return cast(O)this;     
  }

  O opIndexAssign(this O)(DViewComponent newComponent, string anId) {
    set(anId, newComponent);
    return cast(O)this;
  }

protected DOOPEntity _entity;
  DOOPEntity entity() { return _entity; }
  bool hasEntity() {
    return (this.entity !is null); 
  }

  O entity(this O)(DOOPEntity newEntity) {
    _entity = newEntity;
 
    foreach(component; _components) {
      if (component) { component.entity(newEntity); }
    }
    return cast(O)this;
  } 
  
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

    foreach(component; _components) {
      if (component) {
        component.entities(newEntities);
      }
    }

    return cast(O)this;
  }

  DH5Obj[] toH5(STRINGAA options = null) {
    DH5Obj[] results;

    foreach(component; _components) {
      if (component) results ~= component.toH5(options);      
    }

    return results;
  }

  O remove(this O)(string anId) {
    if (has(anId)) {
      _components.remove(pos(anId));
    }
    return cast(O)this;
  }

  O clear(this O)() {
    _component[] = null;      
    return cast(O)this;
  }

  DViewComponents dup() {
    return ViewComponents.add(_components.dup);
  }
}
auto ViewComponents() { return new DViewComponents; }
auto ViewComponents(DViewObject myParent) { return new DViewComponents(myParent); }

version(test_uim_apps) {
  unittest {
    assert(ViewComponents);
    auto components = ViewComponents;
    assert(components.length == 0);
    
  }
}