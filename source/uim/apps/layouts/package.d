module uim.apps.layouts;

@safe:
import uim.apps;

// Main
public import uim.apps.layouts.layout;

/*
DH5AppLayout {
    this() { super(); 
      _bodyAttributes["style"] = "background-color: #ffffff;";

      this
      .metas(
        ["charset":"utf-8"],
        ["http-equiv":"X-UA-Compatible", "content":"IE=edge"],
        ["name":"viewport", "content":"width=device-width, initial-scale=1"], 
        ["http-equiv":"Content-Type", "content":"text/html; charset=utf-8"],
        )
      .links(
        ["rel":"icon", "type":"image/ico", "href":"/img/favicon.ico"],
        )
      .styles(
        ["href":"/lib/kothing/last/kothing-editor.min.css", "rel":"stylesheet"],
        ["href":"/lib/katex/last/katex.min.css", "rel":"stylesheet"],
        ["href":"/css/apps/main.css", "rel":"stylesheet"],        
        ["href":"/css/apps/cms/main.css", "rel":"stylesheet"]
        )
       .scripts(
        ["src":"/lib/apexcharts/last/apexcharts.min.js"],
        ["src":"/lib/tabler/last/js/tabler.min.js"],
        ["src":"/lib/kothing/last/kothing-editor.min.js"],
        ["src":"/lib/katex/last/katex.min.js"],
        ["src":"/js/apps/app.js"], 
        )
      .title("SERVER!Entities");   

        _bodyAttributes["style"] = "background-color: #ffffff;";
        _bodyClasses = ["d-flex", "flex-column", "h-100"];
 
    }

    override string toString(DAPPPageController page, STRINGAA reqParameters) {
      // debug writeln("in app.grundschutz.layout");
      debug writeln(page.scripts.map!(a => a.toString));

      if (auto app = page.app) {
        reqParameters["rootPath"] = app.rootPath;      
        writeln("ROOTPATH = ", reqParameters["rootPath"]);
      }
      foreach(k,v; this.parameters) reqParameters[k] = v;
      foreach(k,v; page.parameters) reqParameters[k] = v;

      auto head = ("navigation" in reqParameters ? reqParameters["navigation"] : navigation(reqParameters));
      auto body_ = H5Div(["page-wrapper"], 
            APPPageTitle.toString(reqParameters)~
            H5Div(["page-body"], 
              H5Div(["container-fluid"], (this.layout ?  this.layout.toString(page.content(reqParameters), reqParameters) : page.content(reqParameters)))
            ).toString
          ).toString;

      auto foot = ("footer" in reqParameters ? reqParameters["footer"] : footer(reqParameters));

      return super.toString(page,    
        H5Div(["wrapper"], 
          head~
          body_~
          foot
        ).toString, 
        reqParameters); 
    }
  });
}

auto navigation(STRINGAA reqParameters) {
  auto rootPath = reqParameters.get("rootPath", "/");

  return 
    APPFirstNavbar.toString(reqParameters)~
    APPSecondNavbar(/* [CTLNavSlot] * /).brand(["link":"/", "title":"ADMIN!Central"]).toString(reqParameters);
}    

string footer(STRINGAA parameters) {
  auto rootPath = parameters.get("rootPath", "/");

  return H5Footer(["pt-3 pb-3 fixed-bottom"], ["style":"background-color:#35A6FF"], 
    BS5Container.fluid()(
      H5P(["m-0 text-center text-white"], 
        `Version 1.0.1 - Copyright &copy; 2017-2021 UI Manufaktur UG (haftungsbeschränkt) - License UIM`)
    )).toString;
}


*/