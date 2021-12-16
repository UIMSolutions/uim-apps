module uim.apps.sessions;

@safe:
import uim.apps;

public import uim.apps.sessions.reader;
public import uim.apps.sessions.manager;
public import uim.apps.sessions.nullsession;
public import uim.apps.sessions.session;

DAPPSession getAppSession(STRINGAA parameters) {
  string appSessionId = parameters.get("appSessionId", "");
  if (appSessionId in appSessions) return appSessions[appSessionId]; 
  else return null;
}

void setAppSession(DAPPSession appSession, STRINGAA parameters) {
  if (appSession) appSessions[parameters.get("appSessionId", "")] = appSession; 
}