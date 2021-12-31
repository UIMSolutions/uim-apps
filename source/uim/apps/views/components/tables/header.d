module uim.apps.views.components.tables.header;

@safe:
import uim.apps;

class DAPPTableHeader : DAPPViewComponent {
  this() { this.visibleEntities(10); }
  this(DAPPView myView) { this().view(myView); }

  mixin(OProperty!("string", "mainTitle"));
  mixin(OProperty!("size_t", "visibleEntities"));

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }

    return [
      H5Div(["d-flex"],
      H5Div(["text-muted"], 
        H5String("Show"),
        H5Div(["mx-2 d-inline-block"],
          BS5InputText(["form-control-sm"], ["value":to!string(visibleEntities), "size":"3", "aria-label": mainTitle~" count"])), 
        H5String("entries")),
      H5Div(["ms-auto text-muted"], 
        H5String("Search:"),
        H5Div(["ms-2 d-inline-block"], 
          BS5InputText(["form-control-sm"], ["aria-label":"Search "~mainTitle.toLower]))))].toH5;
  }
}
auto APPTableHeader() { return new DAPPTableHeader; }

