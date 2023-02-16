module uim.apps.views.components.tabpanes.general;

@safe:
import uim.apps;

class DAPPGeneralPaneViewComponent : DAPPEntityTabpane {
  mixin(ViewComponentThis!("APPGeneralPaneViewComponent"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize;
  }
}
mixin(ViewComponentCalls!("APPGeneralPaneViewComponent"));
/* 
auto generalPane(T:DEntity)(T entity, STRINGAA options = null) {
    return 
        BS5CardBody(
            H5Div(["card-title"], options.get("title", "General Data")),
            BS5Row( 
              BS5Col(["col-12"], 
              BS5FormGroup(["row", "mb-1"],
                  H5Label(["form-label col-2 col-form-label"], "Created"),
                  BS5Col(["col-2"],
                    H5Div(
                      H5Label(["form-label mb-0"], "Date"),
                      BS5InputDate(["name":"entity_createdOn", "readonly":"readonly"]).value(entity.createdOn)
                      )),
                  BS5Col(["col-2"],
                    H5Div(
                      H5Label(["form-label mb-0"], "Time"),
                      BS5InputTime(["name":"entity_createdOn", "readonly":"readonly"]).value(entity.createdOn)
                      )),
                  BS5Col(["col-6"],
                    H5Div(
                      H5Label(["form-label mb-0"], "By"),
                      UIMTextInput(["name":"entity_createdBy", "readonly":"readonly"]).value(entity.createdBy)
                      ))
                ),
                BS5FormGroup(["row", "mb-2"],
                  H5Label(["form-label col-2 col-form-label"], "Modified"),
                  BS5Col(["col-2"],
                    H5Div(
                      H5Label(["form-label mb-0"], "Date"),
                      BS5InputDate(["name":"entity_modifiedOn", "readonly":"readonly"]).value(entity.modifiedOn)
                      )),
                  BS5Col(["col-2"],
                    H5Div(
                      H5Label(["form-label mb-0"], "Time"),
                      BS5InputTime(["name":"entity_modifiedOn", "readonly":"readonly"]).value(entity.modifiedOn)
                      )),
                  BS5Col(["col-6"],
                    H5Div(
                      H5Label(["form-label mb-0"], "By"),
                      UIMTextInput(["name":"entity_modifiedBy", "readonly":"readonly"]).value(entity.modifiedBy)
                      )),
                  ),
                BS5FormGroup(["row", "mb-2"],
                  H5Label(["offset-2 form-check form-switch"],
                    H5Input(["form-check-input"], ["type":"checkbox"]),
                    H5Span(["form-check-label"], "Locked"))
                  ),
                BS5FormGroup(["row", "mb-2"],
                  H5Label(["offset-2 form-check form-switch"],
                    H5Input(["form-check-input"], ["type":"checkbox"]),
                    H5Span(["form-check-label"], "Deleted"))
                  )
            )
        )
    );
}

class DAPPPaneGeneral : DAPPPane {
  this() { super(); 
    this.key("general").title("General");
    _formgroups = ["created", "modified", "version"];

        // H5Div(["card-title"], options.get("title", "General Data")),
  }
  this(DEntity myEntity) { this(); this.entity(myEntity); }    

  mixin(OProperty!("string[]", "formgroups"));

  override void inner (STRINGAA options = null) {    
    if (!entity) return;    

    foreach(formgroup; formgroups) {
      switch(formgroup) {
        case "created":
          _col(
            BS5FormGroup("entity_created", ["row", "mb-1"],
              H5Label(["form-label col-2 col-form-label pt-4"], "Created"),
              BS5Col(["col-2"],
                H5Div(
                  H5Label(["form-label mb-0"], "Date"),
                  BS5InputDate("entity_created_date", ["name":"entity_createdOn", "readonly":"readonly"]).value(entity.createdOn)
                  )),
              BS5Col(["col-2"],
                H5Div(
                  H5Label(["form-label mb-0"], "Time"),
                  BS5InputTime("entity_created_time", ["name":"entity_createdOn", "readonly":"readonly"]).value(entity.createdOn)
                  )),
              BS5Col(["col-6"],
                H5Div(
                H5Label(["form-label mb-0"], "By"),
                UIMTextInput("entity_created_by", ["name":"entity_createdBy", "readonly":"readonly"]).value(entity.createdBy)
                )))); 
                options["scripts"] ~= jsElementById(["entity_created_date", "entity_created_time", "entity_created_by"]);
                break;
        case "modified": 
          _col(
            BS5FormGroup("entity_modified", ["row", "mb-2"],
              H5Label(["form-label col-2 col-form-label pt-4"], "Modified"),
              BS5Col(["col-2"],
                H5Div(
                  H5Label(["form-label mb-0"], "Date"),
                  BS5InputDate("entity_modified_date", ["name":"entity_createdOn", "readonly":"readonly"]).value(entity.modifiedOn)
                  )),
              BS5Col(["col-2"],
                H5Div(
                  H5Label(["form-label mb-0"], "Time"),
                  BS5InputTime("entity_modified_time", ["name":"entity_createdOn", "readonly":"readonly"]).value(entity.modifiedOn)
                  )),
              BS5Col(["col-6"],
                H5Div(
                  H5Label(["form-label mb-0"], "By"),
                  UIMTextInput("entity_modified_by", ["name":"entity_createdBy", "readonly":"readonly"]).value(entity.modifiedBy)
                  )))); 
                  options["scripts"] ~= jsElementById(["entity_modified_date", "entity_modified_time", "entity_modified_by"]);
                  break;
        case "version": 
          _col(
            BS5FormGroup("entity_version", ["row", "mb-2"],
              H5Label(["form-label col-2 col-form-label pt-4"], "Version"),
              BS5Col(["col-2"],
                H5Div(
                  H5Label(["form-label mb-0"], "Date"),
                  BS5InputDate("entity_version_date", ["name":"entity_versionOn", "readonly":"readonly"]).value(entity["versionOn"])
                  )),
              BS5Col(["col-2"],
                H5Div(
                  H5Label(["form-label mb-0"], "Time"),
                  BS5InputTime("entity_version_time", ["name":"entity_versionOn", "readonly":"readonly"]).value(entity["versionOn"])
                  )),
              BS5Col(["col-2"],
                H5Div(
                  H5Label(["form-label mb-0"], "Number"),
                  BS5InputNumber("entity_version_number", ["name":"entity_versionNumber", "readonly":"readonly"]).value(entity["versionNumber"])
                  )),
              BS5Col(["col-4"],
                H5Div(
                  H5Label(["form-label mb-0"], "By"),
                  UIMTextInput("entity_version_by", ["name":"entity_versionBy", "readonly":"readonly"]).value(entity["versionBy"])
                  )))); 
                  options["scripts"] ~= jsElementById(["entity_version_date", "entity_version_time", "entity_version_major", "entity_version_minor", "entity_version_by"]);
                  break;
        case "locked": 
          _col(               
            BS5FormGroup(["row", "mb-2"],
              H5Label(["form-label col-2 col-form-label"], "Locked"),
              BS5Col(["col-2"],
                H5Div(
                  H5Label(["form-label mb-0"], "Date"),
                  BS5InputDate("entity_locked_date", ["name":"entity_createdOn", "readonly":"readonly"]).value(entity["lockedOn"])
                  )),
              BS5Col(["col-2"],
                H5Div(
                  H5Label(["form-label mb-0"], "Time"),
                  BS5InputTime("entity_locked_time", ["name":"entity_createdOn", "readonly":"readonly"]).value(entity["lockedOn"])
                  )),
              BS5Col(["col-6"],
                H5Div(
                  H5Label(["form-label mb-0"], "By"),
                  UIMTextInput("entity_locked_by", ["name":"entity_createdBy", "readonly":"readonly"]).value(entity["lockedBy"])
                  )),
              )); 
              options["scripts"] ~= jsElementById(["entity_locked_date", "entity_locked_time", "entity_locked_by"]);
              break;    
        default: break;
      }     
    }
  }
}
   */