module uim.apps.interfaces.entity;

@safe:
import uim.apps;

interface IAPPWithEntity {  
  @property DOOPEntity entity();
  @property O entity(this O)(DOOPEntity myEntity);
}
