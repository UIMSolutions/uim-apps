module uim.apps.interfaces.entities;

@safe:
import uim.apps;

interface IAPPWithEntities {  
  @property DOOPEntity[] entities();
  @property O entities(this O)(DOOPEntity[] myEntities);
}
