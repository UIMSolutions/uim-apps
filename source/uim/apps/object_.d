module uim.apps.object_;

@safe:
import uim.apps;

class DAPPObject {
  this() {
    this.name = "APPObject";
    initialize();
  }

  void initialize() {}
  
  mixin(APPParameter!("id")); 
  mixin(APPParameter!("name")); 

  /// Additional parameters
  mixin(OProperty!("STRINGAA", "parameters")); 
  bool hasParameter(string key) {
    return key in _parameters ? true : false;
  }
  string parameter(string key) {
    return _parameters.get(key, null);
  }
  O parameter(this O)(string key, string newValue) {
    _parameters[key] = newValue;
    return cast(O)this;
  }

  string opIndex(string key) {
    switch(key) { 
      case "error": return error;
      default: return this.parameter(key);
    }
  }
  void opIndexAssign(string newValue, string key) {
    this.parameter(key, newValue);
  }

  // #region error handling
    string _error;
    string error() { return _error; }
    O error(this O)(string newError) {
      debug writeln("New Error:", newError);
      _error = newError;
      return cast(O)this;
    }

    bool hasError() { return (this.error.length > 0); } 
    O clearError(this O)() {
      _error = null;
      return cast(O)this;
    }
  // #endregion error
  
  O create(this O)() {
    return new O;
  }

  O clone(this O)() {
    O obj = create;
    return obj;
  }
}
auto APPObject() { return new DAPPObject; }

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    assert(new DAPPObject);

    assert(APPObject);

    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    assert(APPObject.id == "");

    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    assert(APPObject.id("object").id == "object");

    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    assert(APPObject.name == "APPObject");

    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    assert(APPObject.name("object").name == "object");
}}