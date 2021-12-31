module uim.apps.views.null_;

@safe:
import uim.apps;

class DAPPNullView : DAPPView {
  this() { 
    super(); 
    this.name = "APPNullView"; }
  this(DAPPPageController aController) { this().controller(aController); }

  override DH5Obj[] toH5(STRINGAA options = null) {
    return null;
  }
	unittest {
		version(uim_html) {
			// TODO
			}}  

  override string render(STRINGAA options = null) {
    return null;
  }
	unittest {
		version(uim_html) {
			// TODO
			}}  
}
auto APPNullView() { return new DAPPNullView(); }
auto APPNullView(DAPPPageController aController) { return new DAPPNullView(aController); }

unittest {
  version(uim_html) {
    assert(H5NullView.name == "H5NullView");
    assert(H5NullView.name("newView").name == "newView");
}}
