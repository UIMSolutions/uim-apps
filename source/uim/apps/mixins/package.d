module uim.apps.mixins;

@safe:
import uim.apps;

public import uim.apps.mixins.actions;
public import uim.apps.mixins.controllers;
public import uim.apps.mixins.routers;
public import uim.apps.mixins.viewcomponents;
public import uim.apps.mixins.views;

template APPParameter(string name, string afterSet = null) {
  const char[] APPParameter = `
string `~name~`() { 
  return parameter("`~name~`"); 
} 
O `~name~`(this O)(string newValue) { 
  this.parameter("`~name~`", newValue);
  _afterSet`~name.capitalize~`;
  return cast(O)this; 
}
void _afterSet`~name.capitalize~`() { `~afterSet~` } // hook
`;
}