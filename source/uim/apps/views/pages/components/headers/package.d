module uim.apps.views.pages.components.headers;

@safe:
import uim.apps;

// Main
public import uim.apps.views.pages.components.headers.header;

// Packages
public import uim.apps.views.pages.components.headers.entities;

enum BreadcrumbsStyle = "text-small mb-1"; // Original = "page-pretitle"

Flag!"WithEntity" WithEntity;

template APPPageHeaderThis(string name, bool withEntity = false) {
  const char[] APPPageHeaderThis = `
    this() { super(); this.name("`~name~`"); }
    this(DAPPView myView) { this().view(myView); }
  `~
  (withEntity ? `
    this(DOOPEntity myEntity) { this().entity(myEntity); }
    this(DAPPView myView, DOOPEntity myEntity) { this(myView).entity(myEntity); }
  `:``);
}

template APPPageHeaderCalls(string name, bool withEntity = false) {
  const char[] APPPageHeaderCalls = `
auto `~name~`() { return new DAPPPageHeader(); }
auto `~name~`(DAPPView myView) { return new D`~name~`(myView); }
  `~
  (withEntity ? `
auto `~name~`(DOOPEntity myEntity) { return new D`~name~`(myEntity); }
auto `~name~`(DAPPView myView, DOOPEntity myEntity) { return new D`~name~`(myView, myEntity); }
  `:``);
}