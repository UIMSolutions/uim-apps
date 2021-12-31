module uim.apps.controllers.validators.validator;

@safe:
import uim.apps;

class DAPPValidator : DAPPController {
  this() { super(); }
  this(DAPPApplication myApp) { this().app(myApp); }
  this(DAPPApplication myApp, string myName) { this(myApp).name(myName); }
  this(DAPPApplication myApp, DETBBase myDatabase) { this(myApp).database(myDatabase); }
  this(DAPPApplication myApp, string myName, DETBBase myDatabase) { this(myApp, myName).database(myDatabase); }

  /// Main function of Controller
  DOOPEntity validate(STRINGAA parameters) {
    return null; }
  unittest {
    version(uim_apps) {
      /// TODO 
    }}

  override Json message(STRINGAA parameters) {
    return super.message(parameters); }
  unittest {
    version(uim_apps) {
      /// TODO 
    }}

  override Json message(Json json, STRINGAA parameters) {    
    auto result = super.message(json, parameters);
    
    if ("results" !in result) result["results"] = Json.emptyObject; 
    
    return result; }}
  unittest {
    version(uim_apps) {
      /// TODO 
    }}
auto APPValidator() { return new DAPPValidator; }
auto APPValidator(DAPPApplication myApp) { return new DAPPValidator(myApp); }
auto APPValidator(DAPPApplication myApp, string myName) { return new DAPPValidator(myApp, myName); }
auto APPValidator(DAPPApplication myApp, DETBBase myDatabase) { return new DAPPValidator(myApp, myDatabase); }
auto APPValidator(DAPPApplication myApp, string myName, DETBBase myDatabase) { return new DAPPValidator(myApp, myName, myDatabase); }