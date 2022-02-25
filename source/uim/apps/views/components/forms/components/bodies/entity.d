module uim.apps.views.components.forms.components.bodies.entity;

@safe:
import uim.apps;

class DAPPEntityFormBody : DAPPFormBody, IAPPWithEntity {
  mixin(APPFormComponentThis!("APPEntityFormBody", true));

  override void initialize() {
    debugMethodCall(moduleName!DAPPEntityFormBody~"::DAPPEntityFormBody("~this.name~"):initialize");   
    super.initialize;

    this
    .id("formbody_%s".format(uniform(1, 1_000)))
    .crudMode(CRUDModes.Create)
    .fields(["name", "display", "description"])
    .formGroupHandler(APPFormGroupHandler(this.form));   
  }

  mixin(OProperty!("string[]", "fields"));
  O addFields(this O)(string[] newFields) {
    _fields ~= newFields;
    return cast(O)this;
  }
  
  mixin(OProperty!("DAPPPanes", "panes"));
  mixin(OProperty!("DOOPEntity", "entity"));
  mixin(OProperty!("DAPPFormGroupHandler", "formGroupHandler"));

  DH5Obj[] formGroups(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityFormBody~"::DAPPEntityFormBody:formGroups");    
    DH5Obj[] results;

    debug writeln(entity ? "Has entity: "~entity.name : "No entity");
    debug writeln(form ? "Has form " : "No form");

    if (formGroupHandler) {
      debug writeln("Found formGroupHandler:",formGroupHandler.name);

      formGroupHandler
        .form(this.form)
        .crudMode(this.crudMode)
        .entity(entity);
      debug writeln("CrudMode:", this.crudMode);

      foreach(field; this.fields) {     
        debug writeln("formGroup:", field);

        final switch(crudMode) {
          case CRUDModes.Create: results ~= formGroupHandler.group(field, false, options); break;
          case CRUDModes.Read:   results ~= formGroupHandler.group(field, true,  options); break;
          case CRUDModes.Update: results ~= formGroupHandler.group(field, false, options); break;
          case CRUDModes.Delete: results ~= formGroupHandler.group(field, true,  options); break;
        }
    }} 

    return results;
  }  

  override DH5Obj bodyContent(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityFormBody~"::DAPPEntityFormBody:bodyContent");    
    DH5Obj row = super.bodyContent(options);
    
    auto col = BS5Col(["col-12"], 
      BS5InputHidden("sessionToken", ["name":"sessionToken"]).value(options.get("sessionToken", null)));
    
    debug writeln(entity ? "Found entity : "~entity.name : "No entity");
    if (entity) {
      col(BS5InputHidden("entity_id", ["name":"entity_id"]).value(entity.id.toString));
    }

    if (auto fGroups = formGroups(options)) {
      debug writeln("Found formgroups");
      col(fGroups);
    }

    return 
      row(
        col);    
  } 

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DAPPEntityFormBody~"::DAPPEntityFormBody:toH5");    
    super.toH5(options);
    
    debug writeln(form ? "Has form " : "No form");
    debug writeln(entity ? "Has entity" : "no entity :-(");
    return [
      BS5CardBody(id,
        bodyContent(options)
    )].toH5; 
  }
}
mixin(APPFormComponentCalls!("APPEntityFormBody", true));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DAPPEntityFormBody);
    assert(APPEntityFormBody);
    assert(new DAPPEntityFormBody(APPForm));
    assert(APPEntityFormBody(APPForm));
  }
}