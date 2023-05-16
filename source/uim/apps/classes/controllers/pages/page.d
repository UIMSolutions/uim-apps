/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.apps.classes.controllers.pages.page;

import uim.apps;
@safe:

class DAppPageController : DPageController {
  mixin(ControllerThis!("AppPageController"));

  mixin(OProperty!("IApp", "app"));

	// #region Layout
    @property override ILayout layout() { 
      return _layout 
        ? _layout
        : (this.app 
          ? this.app.layout 
          : null)
        ; 
    }
	// #endregion Layout
}
mixin(ControllerCalls!("AppPageController"));

version(test_uim_mvc) { unittest {
  assert(AppPageController);
}}
