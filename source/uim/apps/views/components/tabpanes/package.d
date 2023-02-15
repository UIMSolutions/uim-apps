module uim.apps.views.components.tabpanes;

@safe:
import uim.apps;

public import uim.apps.views.components.tabpanes.entity;
public import uim.apps.views.components.tabpanes.entities;

public import uim.apps.views.components.tabpanes.general;
public import uim.apps.views.components.tabpanes.history;
public import uim.apps.views.components.tabpanes.packages;
public import uim.apps.views.components.tabpanes.tabpane;
public import uim.apps.views.components.tabpanes.packages;
public import uim.apps.views.components.tabpanes.versions;
public import uim.apps.views.components.tabpanes.specific;


/* 
auto tabpane(T:DEntity)(T entity, STRINGAA Parameters) {
    return BS5CardBody(
            H5Div(["card-title"], options.get("titile", "")),
            BS5Row( 
                BS5Col(["col-12"])
            )
       );

}

class DAPPTabpane : DAPPPane {
    this() {}
    this(DEntity myEntity) { this(); this.entity(myEntity); }    

    mixin(OProperty!("string", "path"));
    mixin(OProperty!("string[]", "actions"));

    override string toString(STRINGAA options) {
        return BS5CardBody(
            H5Div(["card-title"], this.title),
            BS5Row( 
                BS5Col(["col-12"])
            )  
       ).toString;
    }
}
auto APPTabpane() { return new DAPPTabpane; }
auto APPTabpane(DEntity myEntity) { return new DAPPTabpane(myEntity); }
auto APPTabpane(string myKey, string myTitle) { return APPTabpane.key(myKey).title(myTitle); }
auto APPTabpane(string myKey, string myTitle, string myPath) { return APPTabpane.key(myKey).title(myTitle).path(myPath); } */

class DAPPPanes {
  this() {}
  this(DEntity myEntity) { _entity = myEntity; }    

  DEntity _entity;
  DEntity entity() {
    return _entity;
  }
  O entity(this O)(DEntity newEntity) {
    foreach(pane; _panes) pane.entity(newEntity);
    return cast(O)this;}

  mixin(OProperty!("string", "path"));
  mixin(OProperty!("DTabPane[]", "panes"));
  O panes(this O)(DTabPane[] newPanes...) { 
    _panes = newPanes;
    return cast(O)this;}

  O active(this O)(string key) {
    panes.each!(a => a.active(false));
    foreach(pane; panes) if (pane.key == key) pane.active(true);
    return cast(O)this;
  }

  DH5Obj[] toH5(STRINGAA options) {
    auto navTabs = BS5NavTabs;
    auto tabContent = BS5TabContent;

    foreach(pane; panes) {   
      if (auto entityPane = cast(DAPPEntityTabpane)pane) entityPane.entity(_entity);

      if (pane.disabled) {
        navTabs.item(
          BS5NavLink(["disabled"], 
          ["href":"#"~pane.key, "data-bs-toggle":"tab", "tabindex":"-1", "aria-disabled":"true", "data-bs-toggle":"tab"], pane.title));
          tabContent.pane(pane.key, ["card fade"], "");
      }
      else {
        if (pane.active) {
          navTabs.item(
          BS5NavLink(["active"], ["href":"#"~pane.key, "aria-current":"page", "data-bs-toggle":"tab"], pane.title));

          tabContent.pane(pane.key, ["card fade show active"], pane.render(options));
        }
        else {
          navTabs.item(
              BS5NavLink(["href":"#"~pane.key, "data-bs-toggle":"tab"], pane.title));
          tabContent.pane(pane.key, ["card fade"], pane.render(options));
        }
      }
    }      
    return
      [H5Div(["card-tabs"],
        navTabs, tabContent
      )];
  }
}
auto APPPanes() { return new DAPPPanes; }
auto APPPanes(DEntity myEntity) { return new DAPPPanes(myEntity); }
