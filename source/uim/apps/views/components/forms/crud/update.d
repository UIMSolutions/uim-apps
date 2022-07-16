module uim.apps.views.components.forms.crud.update;

@safe:
import uim.apps;

class DAPPUpdateForm : DAPPEntityCRUDForm {
  mixin(FormThis!("APPUpdateForm"));

  override void initialize() {
    super.initialize;

    this
      .crudMode(CRUDModes.Update);
  }
}
mixin(FormCalls!("APPUpdateForm"));

/* 
auto editheader(T:DOOPEntity)(string path, T entity, DAPPPanes panes, STRINGAA reqParameters) {
  return 
    BS5CardHeader( 
      H5H4(["card-title me-auto"], "ID: "~entity.id.toString), 
      H5Div(["btn-list"], 
        H5Span(["d-none d-sm-inline"], 
            buttonLinkCancel(path),
            resetClear(),
            submitSave()
        )
      )
    );
}

auto editbody_(T:DOOPEntity)(string path, T entity, DAPPPanes panes, STRINGAA reqParameters) {
  return 
    BS5CardBody(
      BS5Row.col(["col-12"], 
        BS5InputHidden(["name":"entity_id"]).value(entity.id)~
        FormGroups_Edit(entity)          
      ));        

}

DH5Obj[] FormGroups_Edit(DOOPEntity entity, string[] fields = ["name", "display", "description"]) {
  DH5Obj[] results;

  foreach(field; fields) {
    switch(field) {
      case "name": 
        results ~= BS5FormGroup(["row", "mb-1"],
          H5Label(["form-label col-2 col-form-label required"], "Name"),
          BS5Col(["col"], 
            UIMTextInput("entity_name", ["name":"entity_name", "placeholder":"Name eingeben"]).value(entity.name),
            H5Div(["invalid-feedback"], "Name ist nicht korrekt")));
        break;
      case "display": 
        results ~= BS5FormGroup(["row", "mb-1"],
          H5Label(["form-label col-2 col-form-label required"], "Title"),
          BS5Col(["col"], 
            UIMTextInput("entity_display", ["name":"entity_display", "placeholder":"Titel eingeben"]).value(entity.display),
            H5Div(["invalid-feedback"], "Titel ist nicht korrekt")));
        break;
      case "description": 
        results ~= BS5FormGroup(["row", "mb-1"],
          H5Label(["form-label col-2 col-form-label"], "Beschreibung"),
          BS5Col(["col"], 
            UIMTextInputarea("entity_description", ["rows":"3", "name":"entity_description", "placeholder":"Beschreibung eingeben"], entity.description)));
        break;
      default: break;
    }
  } 
  return results;
}

class DAPPEditbody_ : DAPPbody_ {
  this() { super();
    _fields = ["name", "display", "description"]; }

  mixin(OProperty!("string", "id"));
  mixin(OProperty!("string", "path"));
  mixin(OProperty!("DOOPEntity", "entity"));
  mixin(OProperty!("DAPPPanes", "panes")); 
  mixin(OProperty!("string[]", "fields")); 
  
  
  DH5Obj[] formGroups(STRINGAA options = null) {
    DH5Obj[] results;

    foreach(field; fields) {
      DH5Obj result = formGroup(field, reqParameters); 
      if (result) results ~= result;
    }

    return results;
  } 

  DH5Obj formGroup(string field, STRINGAA reqParameters) {
    switch(field) {
      case "name": return BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], "Name"),
        BS5Col(["col"], 
          UIMTextInput(["name":"entity_name", "readonly":"readonly"]).value(entity.name)));
      case "display": return BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], "Titel"),
        BS5Col(["col"], 
          UIMTextInput(["name":"entity_display", "readonly":"readonly"]).value(entity.display)));
      case "description": return BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label"], "Beschreibung"),
        BS5Col(["col"], 
          UIMTextInputarea(["rows":"3", "name":"entity_description", "readonly":"readonly"], entity.description)));
      default: return null; 
    }
  } 

  override DH5Obj colContent(STRINGAA options = null) {
    return 
      BS5Col(["col-12"], 
        BS5InputHidden("entity_id", ["name":"entity_id"]).value(entity.id)~
        formGroups(reqParameters)
      );
  } 
}
auto APPEditbody_() { return new DAPPEditbody_(); }

 */