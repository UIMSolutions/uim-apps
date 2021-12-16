module uim.apps.controllers.pages.helpers;

@safe:
import uim.apps;

void initPages(DH5App app) {
  app.pages("login", APPLoginPage);
  app.pages("login2", APPLogin2Page);
  app.pages("logout", APPLogoutPage);
  app.pages("lostaccount", APPLostAccountPage);
  app.pages("lostpw", APPLostPWPage);
  app.pages("register", APPRegisterPage);
}

auto initRouter(URLRouter router, DH5App app) {
 	/* router
		.get("/login", &app.loginPage.request)
		.get("/logout", &app.logoutPage.request); */

  return router;
}