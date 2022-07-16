module uim.apps.routers.register;

@safe:
import uim.apps;

void uimRegister(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimRegister~":uimRegister");
  STRINGAA reqParameters = readRequestParameters(req, null); 

  APPPageController(thisServer).request(req, res);
}

/* static this() {
    serverModeller.pages("register", new class DH5APPPageController {
      this() { super(); }

      override DH5Obj toH5(STRINGAA options = null) { 
        return H5Div(["wrapper wrapper--w680"], `
<div class="card card-1">
<div class="card-heading"></div>
<div class="card-body">
<h2 class="title">Registration Info</h2>
<form method="POST">
<div class="input-group">
<input class="input--style-1" type="text" placeholder="NAME" name="name">
</div>
<div class="row row-space">
<div class="col-2">
<div class="input-group">
<input class="input--style-1 js-datepicker" type="text" placeholder="BIRTHDATE" name="birthday">
<i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
</div>
</div>
<div class="col-2">
<div class="input-group">
<div class="rs-select2 js-select-simple select--no-search">
<select name="gender" tabindex="-1" class="select2-hidden-accessible" aria-hidden="true">
<option disabled="disabled" selected="selected">GENDER</option>
<option>Male</option>
<option>Female</option>
<option>Other</option>
</select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: 100.017px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-gender-7r-container"><span class="select2-selection__rendered" id="select2-gender-7r-container" title="GENDER">GENDER</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
<div class="select-dropdown"></div>
</div>
</div>
</div>
</div>
<div class="input-group">
<div class="rs-select2 js-select-simple select--no-search">
<select name="class" tabindex="-1" class="select2-hidden-accessible" aria-hidden="true">
<option disabled="disabled" selected="selected">CLASS</option>
<option>Class 1</option>
<option>Class 2</option>
<option>Class 3</option>
</select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: 85.7px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-class-7p-container"><span class="select2-selection__rendered" id="select2-class-7p-container" title="CLASS">CLASS</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
<div class="select-dropdown"></div>
</div>
</div>
<div class="row row-space">
<div class="col-2">
<div class="input-group">
<input class="input--style-1" type="text" placeholder="REGISTRATION CODE" name="res_code">
</div>
</div>
</div>
<div class="p-t-20">
<button class="btn btn--radius btn--green" type="submit">Submit</button>
</div>
</form>
</div>
</div>`);

       /*  return 
H5Div(["container-xl"],
  pageTitle("Login"),
  BS5Row(["row-cards"],
    BS5Col(["col-md-6"],
      BS5Card
        .body_(
          H5H2(["title"], "Registration Form"),
          H5Forem(["method":"POST"], 
            BS5Row(["row-space"], 
              BS5Col(["col-2"],                   h
                BS5InputGroup(
                  BS5Label("first name"),
                  UIM(["name":"first_name"])),
              BS5Col(["col-2"], 
                BS5InputGroup(
                  BS5Label("last name"),
                  UIMTextInput(["name":"last_name"]))
            ),
            BS5Row(["row-space"], 
              BS5Col(["col-2"], 
                BS5InputGroup(
                  BS5Label("Birthday"),
                  H5Div(["input-group-icon"], UIMTextInput(["name":"birthday"]))),
              BS5Col["col-2"], 
                BS5InputGroup(
                BS5Label("Gender"),
                H5Div(["pt-10"],
                  H5Label(["radio-container m-r-45"], "Male"), 
                  H5Input(["type":"radio", "checked":"checked", "name":"gender"])
                  H5Span(["checkmark"]),
                  BS5Label(["radio-container"], "Female"),
                  H5Input(["type":"radio", "name":"gender"])
                  H5Span(["checkmark"])
                )
              )
<div class="row row-space">
BS5Col["col-2"], 
BS5InputGroup(
BS5Label("Email"),
<input class="input--style-4" type="email" name="email">
</div>
</div>
BS5Col["col-2"], 
BS5InputGroup(
BS5Label("Phone Number"),
<input class="input--style-4" type="text" name="phone">
</div>
</div>
</div>
BS5InputGroup(
BS5Label("Subject"),
<div class="rs-select2 js-select-simple select--no-search">
<select name="subject" tabindex="-1" class="select2-hidden-accessible" aria-hidden="true">
<option disabled="disabled" selected="selected">Choose option</option>
<option>Subject 1</option>
<option>Subject 2</option>
<option>Subject 3</option>
</select><span class="select2 select2-container select2-container--default" dir="ltr" style="width: 139.9px;"><span class="selection"><span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-subject-vc-container"><span class="select2-selection__rendered" id="select2-subject-vc-container" title="Choose option">Choose option</span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
<div class="select-dropdown"></div>
</div>
</div>
<div class="p-t-15">
<button class="btn btn--radius-2 btn--blue" type="submit">Submit</button>
</div>
</form>
</div>
    )     
  )
).toString;      * /  
  
      }
    }
  );
} */