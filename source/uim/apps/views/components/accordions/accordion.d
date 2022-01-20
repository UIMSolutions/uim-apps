module uim.apps.views.components.accordions.accordion;

@safe:
import uim.apps;

class DAPPAccordion : DAPPViewComponent {  
  mixin(APPViewComponentThis!("APPAccordion"));

  override void initialize() {
    super.initialize;
    
    this.id("accordion-viewcomponent");
  }

  mixin(OProperty!("string", "id"));
  mixin(OProperty!("string", "title"));
  mixin(OProperty!("DH5Obj[]", "accordionBody"));

  override DH5Obj[] toH5(STRINGAA options = null) { 
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; }    

    return [
      H5Div(id, ["accordion bg-white"], 
        H5Div(["accordion-item"], 
          H5H2("heading-1", ["accordion-header"], 
            H5Button(["accordion-button"], ["type":"button", "data-bs-toggle":"collapse", 
            "data-bs-target":"#collapse-1", "aria-expanded":"true"], title)
          ),
          H5Div("collapse-1", ["accordion-collapse collapse show"], ["data-bs-parent":"#"~id],
            H5Div(["accordion-body p-0"], 
              accordionBody  
            )
          )
        )
      )].toH5;
  }
}
mixin(APPViewComponentCalls!("APPAccordion"));
