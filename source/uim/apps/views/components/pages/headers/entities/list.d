module uim.apps.views.components.pages.headers.entities.list;

@safe:
import uim.apps;

class DAPPListPageHeader : DAPPEntityPageHeader {
  this() { super();
    this.rootPath("myPath").preTitle("myEntities").title("Übersicht "~"myEntities").actions(["refresh", "create"]);
  }
  this(DAPPView myView) { this().view(myView); }
  this(DOOPEntity newEntity) { this().entity(newEntity); }
}
auto APPListPageHeader() { return new DAPPListPageHeader(); }
auto APPListPageHeader(DAPPView myView) { return new DAPPListPageHeader(myView); }
auto APPListPageHeader(DOOPEntity myEntity) { return new DAPPListPageHeader(myEntity); }
auto APPListPageHeader(string rootPath) { return APPListPageHeader.rootPath(rootPath); }
auto APPListPageHeader(string rootPath, string preTitle) { return APPListPageHeader.rootPath(rootPath).preTitle(preTitle); }
auto APPListPageHeader(string rootPath, string preTitle, string title) { return APPListPageHeader.rootPath(rootPath).preTitle(preTitle).title(title); }
auto APPListPageHeader(string rootPath, string preTitle, string title, string[] actions) { return APPListPageHeader.rootPath(rootPath).preTitle(preTitle).title(title).actions(actions); }
