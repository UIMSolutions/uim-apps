module uim.apps.views.components.forms.components.groups.handler;

@safe:
import uim.apps;

class DFormGroupHandler : DFormComponent {
  mixin(FormComponentThis!("FormGroupHandler", true));

  mixin(OProperty!("DFormGroup[string]", "formGroups"));
  O addFormGroups(this O)(DFormGroup[string] newFormGroups) {
    newFormGroups.byKey.each!(key => formGroups[key] = newFormGroups[key]);
    return cast(O)this;
  }

  override void initialize() {
    super.initialize;

    this
      .formGroups([
        "name": FormGroupName, 
        "display": FormGroupDisplay, 
        "description": APPDescriptionFormGroup]);
  } 

  override void _afterSetForm() {
    super._afterSetForm;

    foreach(key, formGroup; formGroups) {
      if (formGroup) formGroup.form(this.form);
    }
  }

  DH5Obj[] group(string field, bool readonly, STRINGAA options = null) {
    debug writeln(moduleName!DFormGroupHandler, ":DFormGroupHandler::group");
    debug writeln("CrudMode:", this.crudMode);

    foreach(key, formGroup; formGroups) {
      if (formGroup) formGroup.form(this.form);
    }

    debug writeln(entity ? ("Found entity: %s".format(entity.name)) : "entity missing");
    if (entity) {
      debug writeln("Found entity:", entity.name);
      
      if (auto formGroup = this.formGroups.get(field.toLower, null)) { // field name not case sensitive !
        debug writeln("Found formGroup for field:", field);
        formGroup.crudMode(this.crudMode).form(form);
        if (auto entityFormGroup = cast(DFormGroup)formGroup) {
          return entityFormGroup.entity(entity).toH5(options);
        }
        return formGroup.toH5(options);
    }}
    return null;
  }
}  
mixin(FormComponentCalls!("FormGroupHandler", true));
