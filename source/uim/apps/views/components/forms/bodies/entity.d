module uim.apps.views.components.forms.bodies.entity;

@safe:
import uim.apps;

class DAPPEntityFormBody : DAPPFormBody {
  this() { super(); 
    this
    .id("formbody_%s".format(uniform(1, 1_000)))
    .crudMode(CRUDModes.Create)
    .fields(["name", "display", "description"]); }
  this(DAPPForm myForm) { this().form(myForm); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this().form(myForm).entity(myEntity); }

  mixin(OProperty!("string[]", "fields"));
  mixin(OProperty!("DAPPPanes", "panes"));
  mixin(OProperty!("DOOPEntity", "entity"));

  DH5Obj[] formGroups(STRINGAA options = null) {
    DH5Obj[] results;
    foreach(field; this.fields) {     
      DH5Obj[] fGroup;
      switch(crudMode) {
        case CRUDModes.Create: fGroup = formGroup(field, false, options); break;
        case CRUDModes.Read:   fGroup = formGroup(field, true, options); break;
        case CRUDModes.Update: fGroup = formGroup(field, false, options); break;
        case CRUDModes.Delete: fGroup = formGroup(field, true, options); break;
        default: break;
      }
      if (fGroup) results ~= fGroup;
    }  

    return results;
  }  

  override DH5Obj[] formGroup(string field, bool readOnly, STRINGAA options = null) {
    super.formGroup(field, readOnly, options);
    
    if (entity) {
      switch(field) {
        case "name": return APPFormGroupName(form).toH5(options);
        case "display": return APPFormGroupDisplay(form).toH5(options);        
        case "description": return APPDescriptionFormGroup(form).toH5(options);        
        default: return null; 
    }}
    return null;
  }  

  override DH5Obj bodyContent(STRINGAA options = null) {
    DH5Obj row = super.bodyContent(options);
    
    string entityId;
    entityId = entity ? form.entity["id"] : null;
    
    auto col = BS5Col(["col-12"], 
      BS5InputHidden("sessionToken", ["name":"sessionToken"]).value(options.get("sessionToken", null)));
    if (id.isUUID) col(BS5InputHidden("entity_id", ["name":"entity_id"]).value(entityId));
    if (auto fGroups = formGroups(options)) col(fGroups);
 
    return 
      row(col);    
  } 

  override void beforeH5(STRINGAA options = null) {
    super.beforeH5(options);
    if (hasError) { return; }

    if (auto entityForm = cast(DAPPEntityForm)form) {
      this.entity(entityForm.entity);
    }
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);
    
    return [
      BS5CardBody(id,
        bodyContent(options)
    )].toH5; 
  }
}
mixin(APPFormComponentCalls!("APPEntityFormBody"));
