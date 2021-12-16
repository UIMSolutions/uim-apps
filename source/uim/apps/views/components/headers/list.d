module uim.apps.views.components.headers.list;

@safe:
import uim.apps;

class DAPPListPageHeader : DAPPPageHeader {
  this() { super();
    this.path("myPath").preTitle("myEntities").title("Übersicht "~"myEntities").actions(["refresh", "create"]);
  }
  this(DAPPView myView) { this().view(myView); }
  this(DOOPEntity newEntity) { this().entity(newEntity); }
}
auto APPListPageHeader() { return new DAPPListPageHeader(); }
auto APPListPageHeader(DAPPView myView) { return new DAPPListPageHeader(myView); }
auto APPListPageHeader(DOOPEntity myEntity) { return new DAPPListPageHeader(myEntity); }
auto APPListPageHeader(string path) { return APPListPageHeader.path(path); }
auto APPListPageHeader(string path, string preTitle) { return APPListPageHeader.path(path).preTitle(preTitle); }
auto APPListPageHeader(string path, string preTitle, string title) { return APPListPageHeader.path(path).preTitle(preTitle).title(title); }
auto APPListPageHeader(string path, string preTitle, string title, string[] actions) { return APPListPageHeader.path(path).preTitle(preTitle).title(title).actions(actions); }
