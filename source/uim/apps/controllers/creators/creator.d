module uim.apps.controllers.creators.creator;

@safe:
import uim.apps;

class DAPPCreator : DAPPController {
  this() { super(); }
  this(DAPPApplication myApp) { this().app(myApp); }

  DOOPEntity create(STRINGAA parameters) {
    return null;
  }
}
auto APPCreator() { return new DAPPCreator(); }
auto APPCreator(DAPPApplication myApp) { return new DAPPCreator(myApp); } 