module uim.apps.views.components.panes.history;

@safe:
import uim.apps;

class DAPPPaneHistory : DAPPPane {
  this() { super();     
    this.title("History");
  }
  this(DOOPEntity myEntity) { this(); this.entity(myEntity); }    
  this(DOOPEntity myEntity, DOOPEntity[] myHistory) { this(); this.entity(myEntity).history(myHistory); }    

  mixin(SProperty!("DOOPEntity[]", "history"));
  O history(this O)(Json[] jsons) {
    _history ~= jsons.map!(a => OOPEntity(a)).array;
    return cast(O)this;
  }

  override void beforeH5(STRINGAA options = null) { // hook
    super.beforeH5(options);
    if (hasError) { return; }
    
    _h5Content ~= BS5CardBody(
      H5Div(["card-title"], options.get("title", "History")),
      BS5Row( 
        BS5Col(["col-12"], 
          APPTableHistory.history(history).toH5(options)
        )));
  } 
}
auto APPPaneHistory() { return new DAPPPaneHistory; }
auto APPPaneHistory(DOOPEntity myEntity) { return APPPaneHistory.entity(myEntity); }
auto APPPaneHistory(DOOPEntity myEntity, DOOPEntity[] myHistory) { return APPPaneHistory(myEntity).history(myHistory); }

auto APPPaneHistory(string myKey, string myTitle) { return APPPaneHistory.key(myKey).title(myTitle); }
auto APPPaneHistory(string myKey, string myTitle, string myPath) { return APPPaneHistory.key(myKey).title(myTitle).path(myPath); }
  

  