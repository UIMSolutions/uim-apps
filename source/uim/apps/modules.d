/***********************************************************************************************************************
*	Copyright: © 2017-2022 UI Manufaktur UG / 2022 Ozan Nurettin Süel (sicherheitsschmiede)                              *
*	License: Licensed under Apache 2 [https://apache.org/licenses/LICENSE-2.0.txt]                                       *
*	Authors: UI Manufaktur UG Team, Ozan Nurettin Süel (Sicherheitsschmiede)										                         * 
***********************************************************************************************************************/
module uim.apps.modules;

@safe:
import uim.apps;

void modules(HTTPServerRequest req, HTTPServerResponse res) { 
	string content = `import App from '/`~req.params["source"].replace("_", "/")~`/`~req.params["file"].replace("_", ".")~`';new Vue({render: h => h(App),}).$mount('#app');`;
	res.writeBody(content, "text/javascript");
}
