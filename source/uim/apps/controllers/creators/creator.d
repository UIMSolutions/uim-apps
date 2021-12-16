module uim.apps.controllers.creators.creator;

@safe:
import uim.apps;

/* static this() {
  appErrorCodes[appErrorPrefix+200] = "Creator not work";
} */

class DAPPCreator : DAPPController {
  this() { super(); }
  this(DAPPUIM myApp) { this().app(myApp); }
  this(DAPPUIM myApp, string myName) { this(myApp).name(myName); }
  this(DAPPUIM myApp, DETBBase myDatabase) { this(myApp).database(myDatabase); }
  this(DAPPUIM myApp, string myName, DETBBase myDatabase) { this(myApp, myName).database(myDatabase); }

  DOOPEntity create(STRINGAA parameters) {
    return null;
  }
}