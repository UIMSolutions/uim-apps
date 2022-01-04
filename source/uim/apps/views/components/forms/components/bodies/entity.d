module uim.apps.views.components.forms.components.bodies.entity;

@safe:
import uim.apps;

class DAPPEntityFormBody : DAPPFormBody, IAPPWithEntity {
  mixin(APPFormComponentThis!("APPEntityFormBody"));
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPForm myForm, DOOPEntity myEntity) { this().form(myForm).entity(myEntity); }

  override void initialize() {
    super.initialize;

    this
    .id("formbody_%s".format(uniform(1, 1_000)))
    .crudMode(CRUDModes.Create)
    .fields(["name", "display", "description"]); 
  }

  mixin(OProperty!("string[]", "fields"));
  mixin(OProperty!("DAPPPanes", "panes"));
  mixin(OProperty!("DOOPEntity", "entity"));

  DH5Obj[] formGroups(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityFormBody~"::DAPPEntityFormBody:formGroups");    
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
    debugMethodCall(moduleName!DAPPEntityFormBody~"::DAPPEntityFormBody:formGroup");    
    super.formGroup(field, readOnly, options);
    
    if (entity) {
      switch(field) {
        case "name": return APPFormGroupName(form, entity).toH5(options);
        case "display": return APPFormGroupDisplay(form, entity).toH5(options);        
        case "description": return APPDescriptionFormGroup(form, entity).toH5(options);        
        default: return null; 
    }}
    return null;
  }  

  override DH5Obj bodyContent(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityFormBody~"::DAPPEntityFormBody:bodyContent");    
    DH5Obj row = super.bodyContent(options);
    
    string entityId;
    if (auto entityForm = cast(IAPPWithEntity)this.form) {
      entityId = entityForm.entity ? entityForm.entity.id.toString : null;
    }
    
    auto col = BS5Col(["col-12"], 
      BS5InputHidden("sessionToken", ["name":"sessionToken"]).value(options.get("sessionToken", null)));
    if (entityId) col(BS5InputHidden("entity_id", ["name":"entity_id"]).value(entityId));
    if (auto fGroups = formGroups(options)) col(fGroups);
 
    return 
      row(col);    
  } 

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityFormBody~"::DAPPEntityFormBody:beforeH5");    
    super.beforeH5(options);
    if (hasError) { return; }

    if (auto entityForm = cast(IAPPWithEntity)form) {
      this.entity(entityForm.entity);
    }
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityFormBody~"::DAPPEntityFormBody:toH5");    
    super.toH5(options);
    
    return [
      BS5CardBody(id,
        bodyContent(options)
    )].toH5; 
  }
}
mixin(APPFormComponentCalls!("APPEntityFormBody"));
