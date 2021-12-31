module uim.apps.views.components.panes.history;

@safe:
import uim.apps;

class DAPPPaneHistory : DAPPPane {
  this() { super();     
    this.title("History");
  }
  this(DOOPEntity myEntity) { this(); this.entity(myEntity); }    
  this(DOOPEntity myEntity, DOOPEntity[] myHistory) { this(); this.entity(myEntity).history(myHistory); }    

  mixin(OProperty!("DOOPEntity[]", "history"));
  O history(this O)(Json[] jsons) {
    _history ~= jsons.map!(a => OOPEntity(a)).array;
    return cast(O)this;
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    
    return [
      BS5CardBody(
        H5Div(["card-title"], options.get("title", "History")),
        BS5Row( 
          BS5Col(["col-12"], 
            APPTableHistory.history(history).toH5(options)
          )))].toH5;
  } 
}
auto APPPaneHistory() { return new DAPPPaneHistory; }
auto APPPaneHistory(DOOPEntity myEntity) { return APPPaneHistory.entity(myEntity); }
auto APPPaneHistory(DOOPEntity myEntity, DOOPEntity[] myHistory) { return APPPaneHistory(myEntity).history(myHistory); }

auto APPPaneHistory(string myKey, string myTitle) { return APPPaneHistory.key(myKey).title(myTitle); }
auto APPPaneHistory(string myKey, string myTitle, string myPath) { return APPPaneHistory.key(myKey).title(myTitle).path(myPath); }
  

  