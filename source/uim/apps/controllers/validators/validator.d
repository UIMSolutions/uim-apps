module uim.apps.controllers.validators.validator;

@safe:
import uim.apps;

class DAPPValidator : DAPPController {
  mixin(APPControllerThis!("APPValidator"));

  /// Main function of Controller
  DOOPEntity validate(STRINGAA parameters) {
    return null; }
  version(test_uim_apps) {
    unittest {
      writeln("--- Test in ", __MODULE__, "/", __LINE__);
      
      /// TODO 
    }}

  override Json message(STRINGAA parameters) {
    return super.message(parameters); }
    version(test_uim_apps) {
      unittest {
        writeln("--- Test in ", __MODULE__, "/", __LINE__);

          /// TODO 
        }}

  override Json message(Json json, STRINGAA parameters) {    
    auto result = super.message(json, parameters);
    
    if ("results" !in result) result["results"] = Json.emptyObject; 
    
    return result; }
  }
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO 
    }}
    
mixin(APPControllerCalls!("APPValidator"));
version(test_uim_apps) {
  unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

      /// TODO 
    }}
