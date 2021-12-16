module uim.apps.views.components.panes.specific;

import uim.apps;
@safe:

class DAPPPaneSpecific : DAPPPane {
  this() { super(); this.title("Specific"); }
  this(DOOPEntity myEntity) { this(); this.entity(myEntity); }    
  
  override void inner(STRINGAA options = null) {    
    _col = BS5Col(["col-12"], 
      BS5FormGroup(["row", "mb-1"],
        H5Label(["form-label col-2 col-form-label pt-4"], "Created"),
        BS5Col(["col-2"])));    
  }
}
auto APPPaneSpecific() { return new DAPPPaneSpecific; }
auto APPPaneSpecific(DOOPEntity myEntity) { return APPPaneSpecific.entity(myEntity); }
auto APPPaneSpecific(string myKey, string myTitle) { return APPPaneSpecific.key(myKey).title(myTitle); }

auto APPPaneSpecific(string myKey, string myTitle, string myPath) { return APPPaneSpecific(myKey, myTitle).path(myPath); }
auto APPPaneSpecific(DOOPEntity myEntity, string myKey, string myTitle, string myPath) { return APPPaneSpecific(myEntity).key(myKey).title(myTitle).path(myPath); }
  