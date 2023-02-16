module uim.apps.controllers.components.component;

@safe:
import uim.apps;

class DControllerComponent : DBaseController {
  mixin(ControllerComponentThis!("ControllerComponent"));
  
  mixin(OProperty!("DController", "controller"));

  // A component lookup table used to lazy load component objects.
  mixin(OProperty!("Json", "componentMap"));


  // Whether the config property has already been configured with defaults
  mixin(OProperty!("bool", "configInitialized"));

  // Component registry class used to lazy load components.
  DControllerComponentRegistry registry() { return null; }

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
mixin(ControllerComponentCalls!("ControllerComponent"));
