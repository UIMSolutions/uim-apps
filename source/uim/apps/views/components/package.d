module uim.apps.views.components;

@safe:
import uim.apps;

// Main
public import uim.apps.views.components.component;
public import uim.apps.views.components.components;
public import uim.apps.views.components.null_;
public import uim.apps.views.components.static_;
public import uim.apps.views.components.entity;
public import uim.apps.views.components.entities;

// Packages
public import uim.apps.views.components.accordions;
public import uim.apps.views.components.alerts;
public import uim.apps.views.components.avatars;
public import uim.apps.views.components.badges;
public import uim.apps.views.components.breadcrumbs;
public import uim.apps.views.components.cards;
public import uim.apps.views.components.filter;
public import uim.apps.views.components.forms;
public import uim.apps.views.components.lists;
public import uim.apps.views.components.navbars;
public import uim.apps.views.components.modals;
public import uim.apps.views.components.pages;
public import uim.apps.views.components.tables;
public import uim.apps.views.components.tabpanes;
public import uim.apps.views.components.tabs;

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
