module uim.apps.views.components.components;

@safe:
import uim.apps;

class DViewComponents {
  this() { /* this.name("ViewComponents"); */ }    

  private DViewComponent[] _components;

  auto all() { return _components; }

  bool has(string anId) {
    foreach(component; _components) {
      if (component && component.id == anId) return true; }
    return false;
  }
  auto get(string anId) {
    foreach(component; _components) {
      if (component && component.id == anId) return component; }
    return null;
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
    foreach(index, component; _components) {
      if (component && component.id == anId) {
        _components[index] = null; 
        return cast(O)this;     
      }
    }
    _components ~= newComponent.id(anId); 
    return cast(O)this;     
  }

  O set(this O)(string anId, DViewComponent newComponent) {
    foreach(index, component; _components) {
      if (component && component.id == anId) {
        _components[index] = newComponent; 
      }
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
    foreach(index, component; _components) {
      if (component.id == anId) _component[index] = null;      
    }
    return cast(O)this;
  }
  O clear(this O)() {
    _component[] = null;      
    return cast(O)this;
  }
 }
auto ViewComponents() { return new DViewComponents; }

version(test_uim_apps) {
  unittest {
    auto comonent = ViewComponents;
    
  }
}