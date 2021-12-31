module uim.apps.views.components.footers;

@safe:
import uim.apps;

class DAPPFooter : DAPPViewComponent {
  this() { super(); 
    this.inner = `Version 1.0.1 - Copyright 2017-2021 UI-Manufaktur UG (haftungsbeschränkt) - License UIM`;
  }
    
  this(DAPPView myView) { 
    this().view(myView); 
  }

  mixin(OProperty!("string", "backgroundColor"));
  mixin(OProperty!("string", "backgroundImage"));
  mixin(OProperty!("string", "inner"));

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError) { return null; }

    auto rootPath = options.get("rootPath", "/");

    string style;
    if (backgroundColor) style ~= "background-color:"~backgroundColor~";";
    if (backgroundImage) style ~= "background-image:url("~backgroundImage~");"; 
    
    return [
      H5Footer(["py-5 bg-dark mt-2 fixed-bottom"], style ? ["style":style] : null, 
        BS5Container.fluid()(
          H5P(["m-0 text-center text-white"], inner)
        ))].toH5;
  }
}
auto APPFooter() { return new DAPPFooter; }
auto APPFooter(DAPPView myView) { return new DAPPFooter(myView); }