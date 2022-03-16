module uim.apps.views.components.forms.components.contents.entity;

@safe:
import uim.apps;

class DEntityFormContent : DAPPFormContent, IAPPWithEntity {
  mixin(APPFormComponentThis!("EntityFormContent", true));

  override void initialize() {
    debugMethodCall(moduleName!DEntityFormContent~"::DEntityFormContent("~this.name~"):initialize");   
    super.initialize;

    this
    .id("FormContent_%s".format(uniform(1, 1_000)))
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

  protected DOOPEntity _entity;
  DOOPEntity entity() { return _entity; }
  bool hasEntity() {
    return (this.entity !is null); 
  }

  O entity(this O)(DOOPEntity newEntity) { 
    _entity = newEntity;

/*     if (auto entityContent = cast(DEntityFormContent)this.content) {
      entityContent.entity(this.entity); 
    }
    else if (auto entityContent = cast(DEntityViewComponent)this.content) {
      entityContent.entity(this.entity); 
    } */

    return cast(O)this;
  }

  mixin(OProperty!("DAPPFormGroupHandler", "formGroupHandler"));

  DH5Obj[] formGroups(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntityFormContent~"::DEntityFormContent:formGroups");    
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
    debugMethodCall(moduleName!DEntityFormContent~"::DEntityFormContent:bodyContent");    
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
    debugMethodCall(moduleName!DEntityFormContent~"::DEntityFormContent:toH5");    
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }

    return [
      BS5CardBody(id,
        bodyContent(options)
    )].toH5; 
  }
}
mixin(APPFormComponentCalls!("EntityFormContent", true));

version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DEntityFormContent);
    assert(EntityFormContent);
    assert(new DEntityFormContent(APPForm));
    assert(EntityFormContent(APPForm));
  }
}