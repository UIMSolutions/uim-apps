module uim.apps.views.components.forms.components.component;

@safe:
import uim.apps;

class DAPPFormComponent : DAPPViewComponent {
  this() { super(); }

  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(OProperty!("DAPPForm", "form"));
  mixin(OProperty!("string", "rootPath"));
  mixin(OProperty!("string", "id"));
  mixin(OProperty!("string", "title"));  
  mixin(OProperty!("bool", "readonly")); 

  override string opIndex(string name) {
    switch (name) {
      case "id": return this.id;
      case "name": return this.name;
      case "rootPath": return this.rootPath;
      case "title": return this.title;
      default: return super.opIndex(name);
    }
  }

  override void opIndexAssign(string value, string name) {
    switch (name) {
      case "id": this.id(value); break;
      case "name": this.name(value); break;
      case "rootPath": this.rootPath(value); break;
      case "title": this.title(value); break;
      default: super.opIndex(name); break;
    }
  }
}