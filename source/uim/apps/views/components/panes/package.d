module uim.apps.views.components.panes;

@safe:
import uim.apps;

public import uim.apps.views.components.panes.general;
public import uim.apps.views.components.panes.history;
public import uim.apps.views.components.panes.pane;
public import uim.apps.views.components.panes.versions;
public import uim.apps.views.components.panes.specific;

/* 
auto tabpane(T:DOOPEntity)(T entity, STRINGAA Parameters) {
    return BS5CardBody(
            H5Div(["card-title"], parameters.get("titile", "")),
            BS5Row( 
                BS5Col(["col-12"])
            )
       );

}

class DAPPTabpane : DAPPPane {
    this() {}
    this(DOOPEntity myEntity) { this(); this.entity(myEntity); }    

    mixin(SProperty!("string", "path"));
    mixin(SProperty!("string[]", "actions"));

    override string toString(STRINGAA parameters) {
        return BS5CardBody(
            H5Div(["card-title"], this.title),
            BS5Row( 
                BS5Col(["col-12"])
            )  
       ).toString;
    }
}
auto APPTabpane() { return new DAPPTabpane; }
auto APPTabpane(DOOPEntity myEntity) { return new DAPPTabpane(myEntity); }
auto APPTabpane(string myKey, string myTitle) { return APPTabpane.key(myKey).title(myTitle); }
auto APPTabpane(string myKey, string myTitle, string myPath) { return APPTabpane.key(myKey).title(myTitle).path(myPath); } */

class DAPPPanes {
  this() {}
  this(DOOPEntity myEntity) { _entity = myEntity; }    

  DOOPEntity _entity;
  DOOPEntity entity() {
    return _entity;
  }
  O entity(this O)(DOOPEntity newEntity) {
    foreach(pane; _panes) pane.entity(newEntity);
    return cast(O)this;}

  mixin(SProperty!("string", "path"));
  mixin(SProperty!("DAPPPane[]", "panes"));
  O panes(this O)(DAPPPane[] newPanes...) { 
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
      pane.entity(_entity);

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
auto APPPanes(DOOPEntity myEntity) { return new DAPPPanes(myEntity); }
