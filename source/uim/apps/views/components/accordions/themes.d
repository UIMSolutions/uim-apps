module uim.apps.views.components.accordions.themes;

@safe:
import uim.apps;

class DAPPAccordionThemes : DAPPAccordion {
  mixin(ViewComponentThis!("APPAccordionThemes"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize;
    
    this
      .id("accordion-themes"); 
  }
}
mixin(ViewComponentCalls!("APPAccordionThemes"));
