module uim.apps.views.entities.list;

@safe:
import uim.apps;

class DAPPEntityListView : DAPPEntityView {
  mixin(APPViewThis!("APPEntityListView"));

  override void initialize() {
    super.initialize;

    this.name("APPEntityListView");
  }
}
mixin(APPViewCalls!("APPEntityListView"));

unittest {
  version(uim_apps) {
    //
  }
}