module uim.apps.views.components.forms.components.groups.handler;

@safe:
import uim.apps;

class DAPPFormGroupHandler : DAPPFormComponent, IAPPWithEntity {
  mixin(APPFormComponentThis!("APPFormGroupHandler", true));

  mixin(OProperty!("DOOPEntity", "entity"));

  mixin(OProperty!("DAPPFormGroup[string]", "formGroups"));
  O addFormGroups(this O)(DAPPFormGroup[string] newFormGroups) {
    newFormGroups.byKey.each!(key => formGroups[key] = newFormGroups[key]);
    return cast(O)this;
  }

  override void initialize() {
    super.initialize;

    this
      .formGroups([
        "name": APPFormGroupName, 
        "display": APPFormGroupDisplay, 
        "description": APPDescriptionFormGroup]);
  } 

  DH5Obj[] group(string field, bool readonly, STRINGAA options = null) {
    debug writeln(moduleName!DAPPFormGroupHandler, ":DAPPFormGroupHandler::group");

    debug writeln(entity ? ("Found entity: %s".format(entity.id)) : "entity missing");
    if (entity) {
      debug writeln("Found entity:", entity.id);
      
      if (auto formGroup = this.formGroups.get(field, null)) {
        debug writeln("Found formGroup for field:", field);
        return formGroup.form(form).entity(entity).toH5(options);
    }}
    return null;
  }
}  
mixin(APPFormComponentCalls!("APPFormGroupHandler", true));
