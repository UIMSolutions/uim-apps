module uim.apps.views.components.pages.headers.entities.entity;

@safe:
import uim.apps;

class DAPPEntityPageHeader : DPageHeader {
  mixin(ViewComponentThis!("APPEntityPageHeader", Yes.WithEntity));

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
mixin(ViewComponentCalls!("APPEntityPageHeader", Yes.WithEntity));
