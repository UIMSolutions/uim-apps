module uim.apps.views.components.accordions.themes;

@safe:
import uim.apps;

class DAPPAccordionThemes : DAPPAccordion {
  mixin(ViewComponentThis!("APPAccordionThemes"));

  override void initialize() {
    super.initialize;
    
    this
      .id("accordion-themes"); 
  }
}
mixin(ViewComponentCalls!("APPAccordionThemes"));
