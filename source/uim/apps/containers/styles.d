module uim.apps.containers.styles;

@safe:
import uim.apps;

class DAPPStyleContainer : DAPPH5Container {
	O entries(this O)(STRINGAA[] newEntries) { 
    this.entries(newEntries.map!(a => H5Style(a)).array); 
    return cast(O)this;
  }

	O addLinks(this O)(string[] newLinks...) { 
    this.addLinks(newLinks); 
    return cast(O)this;
  }
	
  O addLinks(this O)(string[] newLinks) { 
    this.addLinks(newLinks.map!(entry => ["rel":"stylesheet", "href":entry]).array); 
    return cast(O)this;
  }

	O addContent(this O)(string[] newEntries...) { 
    this.addContent(newEntries); 
    return cast(O)this;
  }
	
  O addContent(this O)(string[] newEntries) { 
    this.add(newEntries.map!(entry => H5Style(entry)).array); 
    return cast(O)this;
  }

	O addLinks(this O)(STRINGAA[] newEntries...) { 
    this.add(newEntries); 
    return cast(O)this;
  }
  O addLinks(this O)(STRINGAA[] newEntries) { 
    this.add(newEntries.map!(entry => H5Link(entry)).array); 
    return cast(O)this;
  }
}
auto APPStyleContainer() { return new DAPPStyleContainer; }

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

/*     assert(new DAPPStyleContainer);
    assert(APPStyleContainer);
    assert(cast(DAPPStyleContainer)APPStyleContainer);
    assert(!APPStyleContainer.entries); */
/*     assert(APPStyleContainer.entries.add("abc").entries);

    assert(APPStyleContainer.entries.add("abc").entries.length == 1);
    assert(APPStyleContainer.entries.add(["src":"abc"]).entries.length == 1);
    assert(APPStyleContainer.entries.add(H5Style).entries.length == 1);

    assert(APPStyleContainer.entries.add("abc", "xyz").entries.length == 2);
    assert(APPStyleContainer.entries.add(["src":"abc"], ["src":"xyz"]).entries.length == 2);
    assert(APPStyleContainer.entries.add(H5Style, H5Style).entries.length == 2);

    assert(APPStyleContainer.entries.add(["abc", "xyz"]).entries.length == 2);
    assert(APPStyleContainer.entries.add([["src":"abc"], ["src":"xyz"]]).entries.length == 2);
    assert(APPStyleContainer.entries.add([H5Style, H5Style]).entries.length == 2); */
  }
}