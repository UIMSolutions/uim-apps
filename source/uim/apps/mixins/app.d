module uim.apps.mixins.app;

string appThis() {
  return "
    this() { super(); }
    this(string appName) { super(appName); }
  ";
}

template AppThis() {
  const char[] AppThis = appThis();
}

string appCalls(string shortName, string className = null) {
  auto clName = className.length > 0 ? className : "D"~shortName;

  return "
auto "~shortName~"() { return new "~clName~"; }
auto "~shortName~"(string aName) { return new "~clName~"(aName); }
auto "~shortName~"(string aName, string aRootPath) { return new "~clName~"(aName, aRootPath); }
  ";
}

template AppCalls() {
  const char[] AppCalls = appCalls();
}