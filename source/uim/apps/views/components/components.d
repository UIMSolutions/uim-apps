module uim.apps.views.components.components;

@safe:
import uim.apps;

class DViewComponents {
  this() { super(); this.name("ViewComponents"); }    

  private DViewComponent[] _components;

  auto all() { return _components; }
  auto get(string anId) {
    foreach(component; _components) {
      if (component && component.id == anId) return component;      
    }
    return APPNullComponent;
  }
  ref auto opIndex(string anId) {
    return get(anId);
  }

  O add(this O)(DViewComponent[] newComponents...) {
    add(newComponents);
    return cast(O)this;     
  }
  O add(this O)(DViewComponent[] newComponents) {
    foreach(newComponent; newComponents) {
      if (newComponent) {
        add(newComponent.id, newComponent); 
      }
    }
    return cast(O)this;     
  }
  O add(this O)(string anId, DViewComponent newComponent) {
    auto addComponent = newComponent;
    if (addComponent is null) {
      addComponent = NullComponent.id(anId);
    }

    foreach(index, component; _components) {
      if (component && component.id == anId) {
        _components[index] = addCompoent.id(anId); 
        return cast(O)this;     
      }
    }
    _components ~= newComponent.id(anId); 
    return cast(O)this;     
  }

  O set(this O)(string anId, DViewComponent newComponent) {
    if (component && component.id == anId) {
      _components[index] = newComponent; 
      return cast(O)this;     
    }
    return cast(O)this;     
  }
  O opIndexAssign(this O)(DViewComponent newComponent, string anId) {
    set(anId, newComponent);
    return cast(O)this;
  }

  DH5Obj[] toH5(STRINGAA options = null) {
    DH5Obj[] results;

    foreach(component; _components) {
      results ~= component.toH5(options);      
    }

    return results;
  }

  O remove(this O)(string anId) {
    foreach(index, component; _components) {
      if (component.id == anId) _component[index] = NullComponent;      
    }
    return cast(O)this;
  }
  O clear(this O)() {
    _component[] = null;      
    return cast(O)this;
  }
 }
auto ViewComponents() { return new DViewComponents; }
