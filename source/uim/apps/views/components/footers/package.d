module uim.apps.views.components.footers;

@safe:
import uim.apps;

string footer(STRINGAA options = null) {
  auto rootPath = options.get("rootPath", "/");

  return H5Footer(["py-5 bg-dark mt-2 fixed-bottom"], ["style":"background-color:#35A6FF"], 
    BS5Container.fluid()(
      H5P(["m-0 text-center text-white"], `Version 1.0.1 - Copyright 2017-2021 UI-Manufaktur UG (haftungsbeschränkt) - License UIM`)
    )).toString;
}

class DAPPFooter : DAPPViewComponent {
  this() { super(); }

  mixin(SProperty!("string", "backgroundColor"));
  mixin(SProperty!("string", "backgroundImage"));
  mixin(SProperty!("string", "inner"));

  override void beforeH5(STRINGAA options = null) { // hook
    super.beforeH5(options);
    if (hasError) { return; }

    auto rootPath = options.get("rootPath", "/");

    string style;
    if (backgroundColor) style ~= "background-color:"~backgroundColor~";";
    if (backgroundImage) style ~= "background-image:url("~backgroundImage~");"; 
    
    _h5Content ~= H5Footer(["py-5 bg-dark mt-2 fixed-bottom"], style ? ["style":style] : null, 
      BS5Container.fluid()(
        H5P(["m-0 text-center text-white"], inner)
      ));
  }
}
auto APPFooter() { return new DAPPFooter; }