module uim.apps.views.pages.components.headers.entities.entity;

@safe:
import uim.apps;

class DAPPEntityPageHeader : DAPPPageHeader {
  mixin(APPPageHeaderThis!("APPEntityPageHeader", Yes.WithEntity));

  override DH5Obj actionButton(string action, STRINGAA options = null) {
    auto id = entity ? entity.id.toString : UUID().toString;      
    switch(action) {
      case "read": 
      case "view": return buttonLinkView(rootPath, id); 
      case "edit": 
      case "update": return buttonLinkEdit(rootPath, id); 
      case "delete": 
      case "remove": return buttonLinkDelete(rootPath, id); 
      case "version":return null; // Working on it 
      case "lock":return null;  
      case "unlock":return null; 
      case "print":return null; 
      case "export":return null; 
      case "import":return null; 
      default: return super.actionButton(action);
    }
  } 
}
mixin(APPPageHeaderCalls!("APPEntityPageHeader", Yes.WithEntity));

auto APPEntityPageHeader(string rootPath) { return APPEntityPageHeader.rootPath(rootPath); }
auto APPEntityPageHeader(string rootPath, string preTitle) { return APPEntityPageHeader.rootPath(rootPath).preTitle(preTitle); }
auto APPEntityPageHeader(string rootPath, string preTitle, string title) { return APPEntityPageHeader.rootPath(rootPath).preTitle(preTitle).title(title); }
auto APPEntityPageHeader(string rootPath, string preTitle, string title, string[] actions) { return APPEntityPageHeader.rootPath(rootPath).preTitle(preTitle).title(title).actions(actions); }


