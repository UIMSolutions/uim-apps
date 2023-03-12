module uim.apps.views.components;

@safe:
import uim.apps;

// Main
public import uim.apps.views.components.component;
public import uim.apps.views.components.components;
public import uim.apps.views.components.null_;
public import uim.apps.views.components.entity;
public import uim.apps.views.components.entities;

// Packages
public import uim.apps.views.components.forms;
public import uim.apps.views.components.navbars;
public import uim.apps.views.components.tables;

DH5Obj viewEntities(uint initValue = 10) {
  return H5Div(["text-muted"], 
    H5String("Anzeige "),
    H5Div(["mx-2 d-inline-block"], 
      BS5InputNumber("viewEntities", ["form-control-sm"], ["aria-label":"Entities count", "size":"3", "min":"0"]).value(initValue)
    ),
    H5Div("Einträge"));
}

enum BreadcrumbsStyle = "text-small mb-1"; // Original = "page-pretitle"

Flag!"WithEntity" WithEntity;
Flag!"WithEntities" WithEntities;
