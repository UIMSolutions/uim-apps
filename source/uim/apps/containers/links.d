module uim.apps.containers.links;

@safe:
import uim.apps;

class DAPPLinkContainer : DAPPH5Container {
	O entries(this O)(STRINGAA[] newEntries) { 
    this.entries(newEntries.map!(a => H5Link(a)).array); 
    return cast(O)this;
  }

	O entries(this O)(DH5Link[] newEntries...) { 
    this.entries(newEntries); 
    return cast(O)this;
  }

	O add(this O)(string[] newEntries...) { 
    this.add(newEntries); 
    return cast(O)this;
  }
	
  O add(this O)(string[] newEntries) { 
    this.add(newEntries.map!(entry => H5Link(["href":entry])).array); 
    return cast(O)this;
  }

	O add(this O)(STRINGAA[] newEntries...) { 
    _entries ~= newEntries.map!(entry => cast(DH5Obj)H5Link(entry)).array; 
    return cast(O)this;
  }
	
  O add(this O)(STRINGAA[] newEntries) { 
    _entries ~= newEntries.map!(entry => cast(DH5Obj)H5Link(entry)).array; 
    return cast(O)this;
  }
}
auto APPLinkContainer() { return new DAPPLinkContainer; }

unittest {
  version(test_uim_apps) {
/*     assert(new DAPPLinkContainer);
    assert(APPLinkContainer);
    assert(cast(DAPPLinkContainer)APPLinkContainer);
    assert(!APPLinkContainer.entries);
    assert(APPLinkContainer.entries.add("abc").entries);

    assert(APPLinkContainer.entries.add("abc").entries.length == 1);
    assert(APPLinkContainer.entries.add(["src":"abc"]).entries.length == 1);
    assert(APPLinkContainer.entries.add(H5Link).entries.length == 1);

    assert(APPLinkContainer.entries.add("abc", "xyz").entries.length == 2);
    assert(APPLinkContainer.entries.add(["src":"abc"], ["src":"xyz"]).entries.length == 2);
    assert(APPLinkContainer.entries.add(H5Link, H5Link).entries.length == 2);

    assert(APPLinkContainer.entries.add(["abc", "xyz"]).entries.length == 2);
    assert(APPLinkContainer.entries.add([["src":"abc"], ["src":"xyz"]]).entries.length == 2);
    assert(APPLinkContainer.entries.add([H5Link, H5Link]).entries.length == 2); */
  }
}