/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.apps.classes.apps.registry;

import uim.apps;
@safe:

class DAppRegistry : DRegistry!IApp {
  this() {}  

  static DAppRegistry registry; 
  IApp[] apps() {
    return this.all;
  };
}
auto AppRegistry() { 
  if (!DAppRegistry.registry) {
    DAppRegistry.registry = new DAppRegistry; 
  }
  return 
    DAppRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(AppRegistry.register("mvc/test",  App).paths == ["mvc/test"]);
  assert(AppRegistry.register("mvc/test2", App).paths.length == 2);
}}