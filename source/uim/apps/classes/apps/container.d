/*********************************************************************************************************
	copyright: © 2015-2023 ozan nurettin süel (sicherheitsschmiede)                                        
	license: subject to the terms of the apache 2.0 license, as written in the included license.txt file.  
	authors: ozan nurettin süel (sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.apps.classes.apps.container;

import uim.apps;

@safe:
class DAppContainer  : DNamedContainer!IApp {
	mixin(OProperty!("IAppManager", "appManager"));

	override void opIndexAssign(IApp anItem, string aName) { 
		if (auto myApp = cast(DApp)anItem) {
			myApp.manager = appManager;
		}

    super[aName] = anItem;
  }
}
auto AppContainer() { return new DAppContainer; }