module uim.apps.interfaces;

@safe:
import uim.apps;

interface IAPPWithEntities {  
  @property DOOPEntity[] entities();
  // @property O entities(this O)(DOOPEntity[] myEntities);
  @property void entities(DOOPEntity[] myEntities);
}

interface IAPPWithEntity {  
  @property DOOPEntity entity();
  @property O entity(this O)(DOOPEntity myEntity);
}