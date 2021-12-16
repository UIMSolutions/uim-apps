module uim.apps.security;

@safe:
import uim.apps;

class DAPPSecurityOptions {
  this() {}
  this(bool[string] initOptions) { this(); _options = initOptions; }
  this(string[] requiredOptions...) { this(); requiredOptions.each!(a => _options[a] = true); }
  this(string[] requiredOptions) { this(); requiredOptions.each!(a => _options[a] = true); }

  private bool[string] _options;
  private bool[string] _values;
  bool required(string option) { return _options.get(option, false); }
  O required(this O)(string option, bool isRequired) { _options[option] = isRequired; return cast(O)this; }
  O required(this O)(string[] options...) { this.required(options); return cast(O)this; }
  O required(this O)(string[] options) { options.each!(a => _options[a] = true); return cast(O)this; }

  DAPPSecurityOptions copy() {
    auto result = APPSecurityOptions(_options);
    return result;
  }
}
auto APPSecurityOptions() { return new DAPPSecurityOptions; }
auto APPSecurityOptions(bool[string] initOptions) { return new DAPPSecurityOptions(initOptions); }