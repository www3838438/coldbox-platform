<!-----------------------------------------------------------------------Author 	 :	Your NameDate     :	September 25, 2005Description : 				This is a ColdBox event handler.Please note that the extends needs to point to the eventhandler.cfcin the ColdBox system directory.extends = coldbox.system.eventhandler	-----------------------------------------------------------------------><cfcomponent name="ehGeneral" extends="coldbox.system.eventhandler">		<cffunction name="onAppStart" access="public" returntype="void" output="false">		<cfargument name="Event" type="coldbox.system.beans.requestContext">			</cffunction>		<cffunction name="dspHome" access="public" returntype="void" output="false">		<cfargument name="Event" type="coldbox.system.beans.requestContext">		<cfscript>		//Vars		var hours = randRange(20,200);		var rc = Event.getCollection();				// Param Values		Event.paramValue("thisLocale", "th_TH");		Event.paramValue("dateF", "0");		Event.paramValue("timeF", "2");				//Change Locale		getPlugin("i18n").setfwLocale(rc.thisLocale);						//Set variables to display for locale.		rc.now = getPlugin("i18n").toEpoch(now());		rc.locales = getPlugin("i18n").getLocales();		rc.lang = getPlugin("i18n").showLanguage();		rc.country = getPlugin("i18n").showCountry();		//rc.c = getPlugin("i18n").showISOCountry();		rc.timeZones = getPlugin("i18n").getAvailableTZ();		rc.serverTZ = getPlugin("i18n").getServerTZ();		rc.thisTZ = rc.timezones[randRange(1,arrayLen(rc.timeZones))];		rc.laterOn = getPlugin("i18n").i18nDateAdd(rc.now,"hour",hours,rc.thisTZ);		rc.usesDST = getPlugin("i18n").usesDST(rc.thisTZ);		if (rc.usesDST)			rc.inDST=getPlugin("i18n").inDST(rc.now,rc.thisTZ);		rc.tDate=getPlugin("i18n").i18nDateFormat(rc.now,rc.dateF,rc.thisTZ);		rc.tDateTime=getPlugin("i18n").i18nDateTimeFormat(rc.now,rc.dateF,rc.timeF,rc.thisTZ);		rc.version=getPlugin("i18n").getVersion();		rc.tzOffset=getPlugin("i18n").getTZOffset(rc.now,rc.thisTZ);              //Set the view       Event.setView("vwHome");		</cfscript>	</cffunction>	</cfcomponent>