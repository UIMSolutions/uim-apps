module uim.apps.views.components.forms.components.inputs.handler;

@safe:
import uim.apps;

class DFormInputHandler : DFormComponent {
  mixin(FormComponentThis!("FormInputHandler", true));

  mixin(OProperty!("DFormInput[string]", "formInputs"));
  O adDFormInputs(this O)(DFormInput[string] newFormInputs) {
    newFormInputs.byKey.each!(key => formInputs[key] = newFormInputs[key]);
    return cast(O)this;
  }

  override void initialize() {
    super.initialize;

    this
      .formInputs([
        "name": NameFormInput, 
        "display": DisplayFormInput, 
        "description": DescriptionFormInput]);
  } 

  override void _afterSetForm() {
    super._afterSetForm;

    foreach(key, formGroup; formInputs) {
      if (formGroup) formGroup.form(this.form);
    }
  }

  DH5Obj[] group(string field, bool readonly, STRINGAA options = null) {
    debug writeln(moduleName!DFormInputHandler, ":DFormInputHandler::group");
    debug writeln("CrudMode:", this.crudMode);

    foreach(key, formGroup; formInputs) {
      if (formGroup) formGroup.form(this.form);
    }

    debug writeln(entity ? ("Found entity: %s".format(entity.name)) : "entity missing");
    if (entity) {
      debug writeln("Found entity:", entity.name);
      
      if (auto formGroup = this.formInputs.get(field.toLower, null)) { // field name not case sensitive !
        debug writeln("Found formGroup for field:", field);
        formGroup.crudMode(this.crudMode).form(form);
        if (auto FormGroup = cast(DFormInput)formGroup) {
          return FormGroup.entity(entity).toH5(options);
        }
        return formGroup.toH5(options);
    }}
    return null;
  }
}  
mixin(FormComponentCalls!("FormInputHandler", true));
