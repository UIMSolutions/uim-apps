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

string appCalls() {
  return "
auto App() { return new DApp; }
auto App(string appName) { return new DApp(appName); }
  ";
}

template AppCalls() {
  const char[] AppCalls = appCalls();
}