/***********************************************************************************************************************
*	Copyright: © 2017-2022 UI Manufaktur UG / 2022 Ozan Nurettin Süel (sicherheitsschmiede)                              *
*	License: Licensed under Apache 2 [https://apache.org/licenses/LICENSE-2.0.txt]                                       *
*	Authors: UI Manufaktur UG Team, Ozan Nurettin Süel (Sicherheitsschmiede)										                         * 
***********************************************************************************************************************/
module uim.apps.views.components.pages.components.titles.title;

@safe:
import uim.apps;

class DAPPPageTitle : DAPPViewComponent { 
  mixin(APPViewComponentThis!("APPPageTitle"));

  override DH5Obj[] toH5(STRINGAA options = null) { 
    return
      [H5Div(["container-fluid "], 
        H5Div(["page-header d-print-none"], 
          BS5Row(["align-items-center"])
          .col(["col"], 
            H5Div("pageBreadcrumbs", [BreadcrumbsStyle], options.get("pageBreadcrumbs", "")),
            H5H2(["page-title"], options.get("pageTitle", "")))
          .col(["col-auto ms-auto d-print-none"], 
            H5Div(["btn-list"],
              H5Span(["d-none d-sm-inline"], BS5Button(["btn btn-white"], "New view")),
              H5A(["btn btn-primary d-none d-sm-inline-block"], ["href":"#", "data-bs-toggle":"modal", "data-bs-target":"#modal-report", "style":"background-color:#35A6FF"], tablerIcon("plus")~"Create new report"),
              H5A(["btn btn-primary d-sm-none btn-icon"], ["href":"#", "data-bs-toggle":"modal", "data-bs-target":"#modal-report", "aria-label":"Create new report", "style":"background-color:#35A6FF"], tablerIcon("plus"))
            )
          )
        )
      )].toH5;  
  }
}
mixin(APPViewComponentCalls!("APPPageTitle"));
