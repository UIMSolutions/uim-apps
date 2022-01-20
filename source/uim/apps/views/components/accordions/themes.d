module uim.apps.views.components.accordions.themes;

@safe:
import uim.apps;

class DAPPAccordionThemes : DAPPAccordion {
  mixin(APPViewComponentThis!("APPAccordionThemes"));

  override void initialize() {
    super.initialize;
    
    this.id("accordion-themes"); 
  }
}
mixin(APPViewComponentCalls!("APPAccordionThemes"));
