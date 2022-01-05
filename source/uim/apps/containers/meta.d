module uim.apps.containers.metas;

@safe:
import uim.apps;

class DAPPMetaContainer : DAPPH5Container {
	O entries(this O)(STRINGAA[] newEntries) { 
    this.entries(newEntries.map!(a => H5Meta(a)).array); 
    return cast(O)this;
  }

  O add(this O)(STRINGAA[] newEntries...) { 
    this.add(newEntries); 
    return cast(O)this;
  }

  O add(this O)(STRINGAA[] newEntries) { 
    _entries ~= newEntries.map!(entry => cast(DH5Obj)H5Meta(entry)).array; 
    return cast(O)this;
  }
}
auto APPMetaContainer() { return new DAPPMetaContainer; }

unittest {
  version(test_uim_apps) {
/*     assert(new DAPPLinkContainer);
    assert(APPLinkContainer);
    assert(cast(DAPPLinkContainer)APPLinkContainer);
    assert(!APPLinkContainer.entries);
    assert(APPLinkContainer.entries.add("abc").entries);

    assert(APPLinkContainer.entries.add("abc").entries.length == 1);
    assert(APPLinkContainer.entries.add(["src":"abc"]).entries.length == 1);
    assert(APPLinkContainer.entries.add(H5Meta).entries.length == 1);

    assert(APPLinkContainer.entries.add("abc", "xyz").entries.length == 2);
    assert(APPLinkContainer.entries.add(["src":"abc"], ["src":"xyz"]).entries.length == 2);
    assert(APPLinkContainer.entries.add(H5Meta, H5Meta).entries.length == 2);

    assert(APPLinkContainer.entries.add(["abc", "xyz"]).entries.length == 2);
    assert(APPLinkContainer.entries.add([["src":"abc"], ["src":"xyz"]]).entries.length == 2);
    assert(APPLinkContainer.entries.add([H5Meta, H5Meta]).entries.length == 2); */
  }
}