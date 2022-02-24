module uim.apps.controllers.components.component;

@safe:
import uim.apps;

/**
* DAPPControllerComponent
*
* Components are packages of logic that are shared between controllers. 
* This library comes with a set of core components you can use to aid in various common tasks. 
* You can also create your own components. If you find yourself wanting to copy and paste things between controllers, 
* you should consider creating your own component to contain the functionality. 
* Creating components keeps controller code clean and allows you to reuse code between different controllers.
**/
class DAPPControllerComponent : DAPPControllerObject {
  mixin(APPControllerComponentThis!("APPControllerComponent"));
  
  mixin(OProperty!("DAPPController", "controller"));

  // A component lookup table used to lazy load component objects.
  mixin(OProperty!("Json", "componentMap"));

  // Runtime config
  mixin(OProperty!("Json", "config"));

  // Whether the config property has already been configured with defaults
  mixin(OProperty!("bool", "configInitialized"));

  // Default config
  mixin(OProperty!("Json", "defaultConfig"));

  // Component registry class used to lazy load components.
  DAPPControllerComponentRegistry registry() { return null; }


/* __debugInfo() public
Returns an array that can be used to describe the internal state of this object.

__get() public
Magic method for lazy loading $components.

_configDelete() protected
Deletes a single config key.

_configRead() protected
Reads a config key.

_configWrite() protected
Writes a config key.

configShallow() public
Merge provided config with existing config. Unlike config() which does a recursive merge for nested keys, this method does a simple merge.


getConfigOrFail() public
Returns the config for this specific key.

getController() public
Get the controller this component is bound to.

implementedEvents() public
Get the Controller callbacks this Component is interested in.

initialize() public
Constructor hook method.

log() public
Convenience method to write a message to Log. See Log::write() for more information on writing to logs.
*/ 
}
mixin(APPControllerComponentCalls!("APPControllerComponent"));
