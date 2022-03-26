module uim.apps.views.object_;

@safe:
import uim.apps;

class DViewObject : DAPPObject {
  this() { super(); }

  mixin(OProperty!("DViewComponents", "components"));

  mixin(OProperty!("DOOPEntity", "entity", null, true, true, "", `
    this.components.entity(this.entity);
    `));

  mixin(OProperty!("DOOPEntity[]", "entities", null, true, true, "", `
    this.components.entities(this.entities);
   `));

  override void initialize() {
    super.initialize;

    this
      .components(ViewComponents(this));
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

