---------------------------------------------------------------------
--[[ license agreement >>
---------------------------------------------------------------------

Copyright © 2007-2014 RoLex

Ledokol is free software; You can redistribute it
and modify it under the terms of the GNU General
Public License as published by the Free Software
Foundation, either version 3 of the license, or at
your option any later version.

Ledokol is distributed in the hope that it will be
useful, but without any warranty, without even the
implied warranty of merchantability or fitness for
a particular purpose. See the GNU General Public
License for more details.

Please see http://www.gnu.org/licenses/ for a copy
of the GNU General Public License.

---------------------------------------------------------------------
]]-- license agreement <<
---------------------------------------------------------------------

---------------------------------------------------------------------
--[[ script information >>
---------------------------------------------------------------------

Author: RoLex
Email: webmaster@feardc.net
License: GNU General Public License
Website: http://ledo.feardc.net/
Support hub: dchub://hub.verlihub.net:7777/

Description:

Ledokol stands for Russian word - icebreaker. In this case it's the
biggest multifunctional security and entertainment Lua script with
over sixty different features for Verlihub.

---------------------------------------------------------------------
]]-- script information <<
---------------------------------------------------------------------

---------------------------------------------------------------------
--[[ special thanks >>
---------------------------------------------------------------------

* chaos for previous web and hub hosting
* Doxtur for previous hub hosting
* BulleT for previous hub hosting
* Maximum for previous hub hosting
* TheBoss for previous hub hosting
* netcelli for rich Lua plugin
* Aethra for script management back in 2008
* Stefani for idea of creating LSD Zone
* Hungarista for general code suggestions
* burek for LuaSocket and other code suggestions
* Molotov for QSDCHublist user lookup back in 2010
* Seth for a lot of general suggestions and testing
* LadyStardust for Polish translation
* Astronomik for Russian translation
* Uhlik for Czech translation
* Neolo for Ukrainian translation
* Everyone else for testing and reporting bugs
* Myself for having patience while building this powerful icebreaker

---------------------------------------------------------------------
]]-- special thanks <<
---------------------------------------------------------------------

---------------------------------------------------------------------
-- global storage variables and tables >>
---------------------------------------------------------------------

ver_ledo = "2.7.9" -- ledokol version

---------------------------------------------------------------------
-- default custom settings table >>
---------------------------------------------------------------------

table_sets = {
	["mincommandclass"] = 4,
	["minusrcommandclass"] = 0,
	["commandstopm"] = 1,
	["scanbelowclass"] = 3,
	["thirdacttime"] = "1d",
	["sixthactaddr"] = "nemesis.te-home.net",
	["seventhacttime"] = "",
	["ninthactrepmsg"] = "Sorry. I won't be spamming this hub again.",
	["enableantispam"] = 1,
	["antibelowclass"] = 3,
	["allowspamtoops"] = 0,
	["checkcmdspam"] = 0,
	["antikreason"] = "Spam detected: *",
	["antimessage"] = "Your message wasn't sent due to spam detection. Please contact the hub administration if you disagree with this decision.",
	["enablesearfilt"] = 0,
	["sefireason"] = "Forbidden search request detected: *",
	["searfiltmsg"] = "Your search request is forbidden and therefore discarded: *",
	["classnotianti"] = 3,
	["classnotiex"] = 3,
	["classnotisefi"] = 3,
	["classnotimich"] = 3,
	["classnotiflood"] = 3,
	["classnotigagip"] = 11,
	["classnoticom"] = 10,
	["classnotisay"] = 5,
	["classnotirepl"] = 3,
	["classnotikick"] = 3,
	["classnotiban"] = 3,
	["classnotireg"] = 4,
	["classnoticonfig"] = 10,
	["classnotiredir"] = 4,
	["classnotibadctm"] = 11,
	["classnotiunk"] = 3,
	["classnotioff"] = 3,
	["classnotiledoact"] = 10,
	["classnotiprotoflood"] = 3,
	["classnotiauth"] = 3,
	["classnotiwelcome"] = 3,
	["classnotibotpm"] = 3,
	["classnotihardban"] = 3,
	["classnotiipwatch"] = 5,
	["classnotiblist"] = 3,
	["classnoticust"] = 0,
	["classnotipeakuc"] = 0,
	["classnotipeakts"] = 0,
	["micheck"] = 1,
	["micallall"] = 0,
	["michnick"] = 1,
	["michdesc"] = 0,
	["michtag"] = 0,
	["michconn"] = 0,
	["michemail"] = 0,
	["michshare"] = 0,
	["michip"] = 0,
	["michcc"] = 0,
	["michdns"] = 0,
	["michsup"] = 0,
	["michver"] = 0,
	["michfakenum"] = 0,
	["michfakediv"] = 0,
	["michclone"] = 0,
	["michsameip"] = 0,
	["minickmessage"] = "Forbidden nick detected: *",
	["midescmessage"] = "Forbidden description detected: *",
	["mitagmessage"] = "Forbidden tag detected: *",
	["miconnmessage"] = "Forbidden connection type detected: *",
	["miemailmessage"] = "Forbidden email detected: *",
	["misharemessage"] = "Forbidden share size detected: *",
	["miipmessage"] = "Forbidden IP address detected: *",
	["miccmessage"] = "Forbidden CC detected: *",
	["midnsmessage"] = "Forbidden DNS detected: *",
	["misupmessage"] = "Forbidden client supports detected: *",
	["mivermessage"] = "Forbidden NMDC version detected: *",
	["mifakemessage"] = "Fake share detected: *",
	["miclonemessage"] = "Clone of yourself detected: *",
	["misameipmessage"] = "Connection from same IP detected: *",
	["mitbantime"] = "3h",
	["miclonekicktime"] = "",
	["kickunkusers"] = 0,
	["unkbeforelogin"] = 1,
	["unktbantime"] = "3h",
	["unkkickreason"] = "Unknown protocol command detected from your client: *",
	["authrunning"] = 1,
	["authmessage"] = "Your IP doesn't match the authorization IP set for your nick.",
	["regkickaction"] = 1,
	["regmechatcnt"] = 0,
	["regmeuptime"] = 0,
	["searchuptime"] = 0,
	["searuptimeact"] = 0,
	["showuseruptime"] = 0,
	["custnickclass"] = 3,
	["custmaxlen"] = 64,
	["savecustnicks"] = 1,
	["opkeyclass"] = 11,
	["opkeyself"] = 11,
	["opkeyshare"] = 0,
	["enablevipkick"] = 0,
	["votekickclass"] = 11,
	["votekickcount"] = 5,
	["relmodclass"] = 3,
	["welcomeclass"] = 3,
	["offmsgclass"] = 3,
	["mchistclass"] = 0,
	["sayclass"] = 5,
	["clearclass"] = 3,
	["chatrunning"] = 1,
	["ccroomrunning"] = 0,
	["ccroomautocls"] = 3,
	["ccroommancls"] = 3,
	["roomusernotify"] = 1,
	["ccroomstyle"] = "#" .. string.char (160) .. "<cc>",
	["remrunning"] = 1,
	["replrunning"] = 1,
	["resprunning"] = 1,
	["respdelay"] = 3,
	["newsclass"] = 0,
	["newsautolines"] = 0,
	["chatrankclass"] = 11,
	["sharerankclass"] = 11,
	["shareranmin"] = 500,
	["oprankclass"] = 11,
	["searrankclass"] = 11,
	["wordrankclass"] = 11,
	["wordranmin"] = 5,
	["wordranmax"] = 25,
	["ranklimit"] = 25,
	["ccstatsclass"] = 0,
	["savecchistory"] = 0,
	["histlimit"] = 0,
	["histbotmsg"] = 1,
	["histautolines"] = 0,
	["ophistautolines"] = 0,
	["histautolinemax"] = 65,
	["histautonewlinedel"] = 1,
	["autoupdcheck"] = 24,
	["addspecialver"] = 0,
	["addledobot"] = 1,
	["ledobotnick"] = "#" .. string.char (160) .. "Ledokol",
	["ledobotmail"] = "",
	["ledobotsize"] = -1,
	["useextrafeed"] = 0,
	["extrafeednick"] = "#" .. string.char (160) .. "Feed",
	["timebotint"] = 0,
	["timebotnick"] = "#" .. string.char (160) .. "%d/%m" .. string.char (160) .. "%H:%M",
	["fasttimebot"] = 0,
	["srvtimediff"] = 0,
	["longdateformat"] = "%d/%m -%y",
	["dateformat"] = "%d/%m",
	["timeformat"] = "%H:%M",
	["shrtuptimefmt"] = "%s:%s:%s:%s:%s",
	["rolltopicint"] = 0,
	["rolltopicspace"] = 5,
	["showtopicowner"] = 1,
	["chatantiflood"] = 0,
	["chatfloodallcount"] = 10,
	["chatfloodallint"] = 10, -- todo
	["chatfloodcount"] = 5,
	["chatfloodint"] = 5,
	["chatfloodaction"] = 1,
	["chatfloodcmdgag"] = 0,
	["protofloodctmcnt"] = 0,
	["protofloodctmint"] = 10,
	["protofloodctmact"] = 0,
	["ipconantiflint"] = 0,
	["enablehardban"] = 0,
	["useblacklist"] = 0,
	--["hublistpingint"] = 0,
	--["hubpingtimeout"] = 1,
	["enableuserlog"] = 0,
	["ulogautoclean"] = 30,
	["logallmyinfos"] = 0,
	["enableipwatch"] = 0,
	["chatcodeon"] = 0,
	["codemaxclass"] = 2,
	["codelength"] = 4,
	["codecharlist"] = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz123456789",
	["codecharsep"] = "",
	["codetext"] = "Please specify chat security code: <code>",
	["pmminclass"] = 0,
	["ctmminclass"] = 0,
	["ctmmsginterval"] = 300,
	["ctmblockmsg"] = "You aren't allowed to connect to other users.",
	["chatmodeclass"] = 3,
	["funrandomchat"] = 0,
	["enablecmdlog"] = 0,
	["useripsupport"] = 0,
	["useripinchat"] = 0,
	["statscollint"] = 0,
	["userrecmsg"] = "New user record since <shortdate>: <old> -> <new>",
	["sharerecmsg"] = "New share record since <shortdate>: <old> -> <new>",
	["instusermenu"] = 0,
	["instrcmenu"] = 0,
	["usermenuname"] = ".:: Ledokol menu",
	["tolowcharcase"] = 0,
	["translitmode"] = 0,
	["langfileprefix"] = "en"
}

---------------------------------------------------------------------
-- default custom settings table <<
---------------------------------------------------------------------

---------------------------------------------------------------------
-- private settings table >>
---------------------------------------------------------------------

table_othsets = {
	["ledobottag"] = "<Ledokol V:" .. ver_ledo .. ",M:A,H:0/0/1,S:0>",
	["ledobotdesc"] = "Security and entertainment bot",
	["timebotdesc"] = "Ledokol time bot",
	["updserv"] = "http://ledo.feardc.net/",
	["vazhub"] = "hub.verlihub.net:7777",
	["tmpfile"] = "ledokol.tmp",
	["sectmpfile"] = "ledo.tmp",
	["verfile"] = "ledokol.ver",
	["seenurl"] = "http://www.te-home.net/?do=hublist&action=seen&nick=",
	["cfgdir"] = "",
	["feednick"] = "",
	["sendfrom"] = "",
	["botnick"] = "",
	["opchatnick"] = "",
	["optrig"] = "",
	["ustrig"] = "",
	["topicowner"] = nil,
	["topicvalue"] = nil,
	["lastupdcheck"] = os.time (),
	["remseconds"] = os.time (),
	["timebotseconds"] = os.time (),
	["rolltopicsecs"] = os.time (),
	["rolltopiclen"] = 1,
	--["hubpingmins"] = os.time (),
	["statscollmins"] = os.time (),
	["ulogcleanmins"] = 0,
	["collgarb"] = os.time (),
	["uptime"] = os.time (),
	["lasttimenick"] = nil,
	["ver_lua"] = nil,
	["ver_luaplug"] = nil,
	--["ver_sock"] = nil,
	--["ver_ltn12"] = nil,
	["ver_sql"] = nil,
	["ver_curl"] = nil,
	--["ver_iconv"] = nil,
	["func_getcc"] = false,
	["func_getusercity"] = false,
	["func_getipcn"] = false,
	["func_getusergeoip"] = false,
	["func_gethostgeoip"] = false,
	["func_getbots"] = false,
	["func_getuptime"] = false,
	["func_gettopic"] = false,
	["func_getuserversion"] = false,
	["func_getusersupports"] = false,
	["langver"] = "EN",
	["locked"] = false,
	["restart"] = false
}

---------------------------------------------------------------------
-- private settings table <<
---------------------------------------------------------------------

---------------------------------------------------------------------
-- ledokol sql tables >>
---------------------------------------------------------------------

tbl_sql = {
	["conf"] = "lua_ledo_conf",
	["anti"] = "lua_ledo_anti",
	["antiex"] = "lua_ledo_antiex",
	["sefi"] = "lua_ledo_sefi",
	["sefiex"] = "lua_ledo_sefiex",
	["minick"] = "lua_ledo_minick",
	["midesc"] = "lua_ledo_midesc",
	["mitag"] = "lua_ledo_mitag",
	["miconn"] = "lua_ledo_miconn",
	["miemail"] = "lua_ledo_miemail",
	["mishare"] = "lua_ledo_mishare",
	["miip"] = "lua_ledo_miip",
	["micc"] = "lua_ledo_micc",
	["midns"] = "lua_ledo_midns",
	["misup"] = "lua_ledo_misup",
	["miver"] = "lua_ledo_miver",
	["miex"] = "lua_ledo_miex",
	["wm"] = "lua_ledo_wm",
	["cust"] = "lua_ledo_cust",
	["chat"] = "lua_ledo_chat",
	["rem"] = "lua_ledo_rem",
	["news"] = "lua_ledo_news",
	["mcrepl"] = "lua_ledo_mcrepl",
	["replex"] = "lua_ledo_replex",
	["mcresp"] = "lua_ledo_mcresp",
	["respex"] = "lua_ledo_respex",
	["auth"] = "lua_ledo_auth",
	["rel"] = "lua_ledo_rel",
	["chran"] = "lua_ledo_chran",
	["opran"] = "lua_ledo_opran",
	["shran"] = "lua_ledo_shran",
	["srran"] = "lua_ledo_srran",
	["wdran"] = "lua_ledo_wdran",
	["ranex"] = "lua_ledo_ranex",
	["ccstat"] = "lua_ledo_ccstat",
	["off"] = "lua_ledo_off",
	["mchist"] = "lua_ledo_mchist",
	["ophist"] = "lua_ledo_ophist",
	["ledocmd"] = "lua_ledo_ledocmd",
	["cmd"] = "lua_ledo_cmd",
	["cmdex"] = "lua_ledo_cmdex",
	["ulog"] = "lua_ledo_ulog",
	["clog"] = "lua_ledo_clog",
	["hubs"] = "lua_ledo_hubs",
	["prot"] = "lua_ledo_prot",
	["stat"] = "lua_ledo_stat",
	["nopm"] = "lua_ledo_nopm",
	["hban"] = "lua_ledo_hban",
	["ipwa"] = "lua_ledo_ipwa",
	["ipgag"] = "lua_ledo_ipgag",
	["rcmenu"] = "lua_ledo_rcmenu"
}

---------------------------------------------------------------------
-- ledokol sql tables <<
---------------------------------------------------------------------

---------------------------------------------------------------------
-- ledokol commands table >>
---------------------------------------------------------------------

table_cmnds = {
	["antiadd"] = "antiadd",
	["antidel"] = "antidel",
	["antilist"] = "antilist",
	["antiexadd"] = "antiexadd",
	["antiexdel"] = "antiexdel",
	["antiexlist"] = "antiexlist",
	["sefiadd"] = "sefiadd",
	["sefidel"] = "sefidel",
	["sefilist"] = "sefilist",
	["sefiexadd"] = "sefiexadd",
	["sefiexdel"] = "sefiexdel",
	["sefiexlist"] = "sefiexlist",
	["myinfadd"] = "myinfadd",
	["myinfdel"] = "myinfdel",
	["myinflist"] = "myinflist",
	["protadd"] = "protadd",
	["protdel"] = "protdel",
	["protlist"] = "protlist",
	["authadd"] = "authadd",
	["authmod"] = "authmod",
	["authdel"] = "authdel",
	["authlist"] = "authlist",
	["offlist"] = "offlist",
	["offdel"] = "offdel",
	["offclean"] = "offclean",
	["offmsg"] = "offmsg",
	["showtopic"] = "showtopic",
	["repladd"] = "repladd",
	["repldel"] = "repldel",
	["repllist"] = "repllist",
	["replexadd"] = "replexadd",
	["replexdel"] = "replexdel",
	["replexlist"] = "replexlist",
	["respadd"] = "respadd",
	["respdel"] = "respdel",
	["resplist"] = "resplist",
	["respexadd"] = "respexadd",
	["respexdel"] = "respexdel",
	["respexlist"] = "respexlist",
	["remadd"] = "remadd",
	["remdel"] = "remdel",
	["remlist"] = "remlist",
	["remshow"] = "remshow",
	["nopmadd"] = "nopmadd",
	["nopmdel"] = "nopmdel",
	["nopmlist"] = "nopmlist",
	["rcmenuadd"] = "rcmenuadd",
	["rcmenudel"] = "rcmenudel",
	["rcmenulist"] = "rcmenulist",
	["rcmenuord"] = "rcmenuord",
	["ipwatadd"] = "ipwatadd",
	["ipwatdel"] = "ipwatdel",
	["ipwatlist"] = "ipwatlist",
	["hban"] = "hban",
	["hunban"] = "hunban",
	["hbans"] = "hbans",
	["newsadd"] = "newsadd",
	["newsdel"] = "newsdel",
	["hubnews"] = "hubnews",
	["reladd"] = "reladd",
	["reldel"] = "reldel",
	["rellist"] = "rellist",
	["relfind"] = "relfind",
	["histclean"] = "histclean",
	["ophistory"] = "ophistory",
	["history"] = "history",
	["myhistory"] = "myhistory",
	["regname"] = "regname",
	["reglist"] = "reglist",
	["regfind"] = "regfind",
	["regstats"] = "regstats",
	["readlog"] = "readlog",
	["cmndset"] = "cmndset",
	["cmndshow"] = "cmndshow",
	["cmndreset"] = "cmndreset",
	["cmndadd"] = "cmndadd",
	["cmnddel"] = "cmnddel",
	["cmndlist"] = "cmndlist",
	["cmndexadd"] = "cmndexadd",
	["cmndexdel"] = "cmndexdel",
	["cmndexlist"] = "cmndexlist",
	["clear"] = "clear",
	["say"] = "say",
	["mode"] = "mode",
	["calculate"] = "calculate",
	["mychatrank"] = "mychatrank",
	["mysharerank"] = "mysharerank",
	["myoprank"] = "myoprank",
	["chatranks"] = "chatranks",
	["shareranks"] = "shareranks",
	["opranks"] = "opranks",
	["searranks"] = "searranks",
	["wordranks"] = "wordranks",
	["cclive"] = "cclive",
	["citylive"] = "citylive",
	["cchist"] = "cchist",
	["ranexadd"] = "ranexadd",
	["ranexdel"] = "ranexdel",
	["ranexlist"] = "ranexlist",
	["randel"] = "randel",
	["ranclean"] = "ranclean",
	["cleanup"] = "cleanup",
	["nick"] = "nick",
	["realnick"] = "realnick",
	["custlist"] = "custlist",
	["rename"] = "rename",
	["custdel"] = "custdel",
	["chatadd"] = "chatadd",
	["chatdel"] = "chatdel",
	["chatlist"] = "chatlist",
	["wmforce"] = "wmforce",
	["wmlist"] = "wmlist",
	["wmdel"] = "wmdel",
	["wmset"] = "wmset",
	["wmshow"] = "wmshow",
	["userinfo"] = "userinfo",
	["ipinfo"] = "ipinfo",
	["ulog"] = "ulog",
	["seen"] = "seen",
	["clog"] = "clog",
	["dropip"] = "dropip",
	["votekick"] = "votekick",
	["gagipadd"] = "gagipadd",
	["gagipdel"] = "gagipdel",
	["gagiplist"] = "gagiplist",
	["gagccadd"] = "gagccadd",
	["gagccdel"] = "gagccdel",
	["gagcclist"] = "gagcclist",
	["hubadd"] = "hubadd",
	["hubdel"] = "hubdel",
	["showhubs"] = "showhubs",
	["ledohelp"] = "ledohelp",
	["ledostats"] = "ledostats",
	["ledover"] = "ledover",
	["ledoconf"] = "ledoconf",
	["ledoset"] = "ledoset",
	["ledokoluninstallisconfirmed"] = "ledokoluninstallisconfirmed",
	["ledosql"] = "ledosql",
	["ledoshell"] = "ledoshell",
	["chatenter"] = "enter",
	["chatleave"] = "leave",
	["chatusers"] = "users",
	["chathelp"] = "help"
}

---------------------------------------------------------------------
-- ledokol commands table <<
---------------------------------------------------------------------

---------------------------------------------------------------------
-- default language table >>
---------------------------------------------------------------------

table_lang_def = {
	[1] = "Current topic: %s",
	[2] = "Current topic set by %s: %s",
	[3] = "This operation might take very long time depending on how much is going to be removed. Please be patient.",
	[4] = "days",
	[5] = "%s with class %s deleted %s IP logger plugin entries older than %s days.",
	[6] = "%s with class %s deleted %s unbans older than %s days.",
	[7] = "%s with class %s deleted %s bans older than %s days.",
	[8] = "%s with class %s deleted %s kicks older than %s days.",
	[9] = "I'm probably away. State your business and I might answer later if you're lucky.",
	[10] = "Perform script update",
	[11] = "Deleted %s main chat history messages.",
	[12] = "There are no main chat history messages to remove.",
	[13] = "Deleted %s operator chat history messages.",
	[14] = "There are no operator chat history messages to remove.",
	[15] = "%s with class %s deleted %s main chat history messages.",
	[16] = "Unable to connect to target server. Please try again later.",
	[17] = "Last %s main chat messages",
	[18] = "Main chat history is empty.",
	[19] = "Requested file %s not found on target server. Please try again later.",
	[20] = "%s is now known as: %s",
	[21] = "Last %s operator chat messages",
	[22] = "Operator chat history is empty.",
	[23] = "Valid priority is a number from %s to %s.",
	[24] = "Ledokol version %s released. Downloading script files...",
	[25] = "You are currently running latest version of Ledokol. No update is required.",
	[26] = "Why would you send offline message to yourself?",
	[27] = "User %s is online. Sending message directly.",
	[28] = "Your offline message stored for user: %s",
	[29] = "%s with IP %s and class %s sent offline message.",
	[30] = "priority",
	[31] = "Offline",
	[32] = "Online",
	[33] = "I sent offline message to you on %s",
	[34] = "My current status",
	[35] = "%s with IP %s and class %s received offline messages.",
	[36] = "Stored offline messages",
	[37] = "Offline message list is empty.",
	[38] = "Deleted %s offline messages.",
	[39] = "Couldn't delete offline messages because not found: %s",
	[40] = "%s with class %s deleted all offline messages.",
	[41] = "There are no offline messages to remove.",
	[42] = "No topic is set.",
	[43] = "%s with IP %s and class %s allowed due to forbidden nick exception: %s",
	[44] = "message",
	[45] = "%s with IP %s and class %s allowed due to forbidden description exception: %s",
	[46] = "User you're trying to kick or redirect is protected.",
	[47] = "%s with IP %s and class %s allowed due to forbidden tag exception: %s",
	[48] = "type",
	[49] = "%s with IP %s and class %s allowed due to forbidden connection type exception: %s",
	[50] = "%s with class %s changed configuration variable %s: %s => %s",
	[51] = "%s with IP %s and class %s allowed due to forbidden email exception: %s",
	[52] = "%s received own message.",
	[53] = "%s with IP %s and class %s allowed due to forbidden share size exception: %s",
	[54] = "Deleted %s releases from category: %s",
	[55] = "Why would you want to set empty topic?",
	[56] = "Couldn't add forbidden nick because already exists: %s",
	[57] = "Added forbidden nick: %s",
	[58] = "Couldn't add forbidden description because already exists: %s",
	[59] = "Added forbidden description: %s",
	[60] = "Couldn't add forbidden tag because already exists: %s",
	[61] = "Added forbidden tag: %s",
	[62] = "Couldn't add forbidden connection type because already exists: %s",
	[63] = "Added forbidden connection type: %s",
	[64] = "Couldn't add forbidden email because already exists: %s",
	[65] = "Added forbidden email: %s",
	[66] = "Couldn't add forbidden share size because already exists: %s",
	[67] = "Added forbidden share size: %s",
	[68] = "Couldn't add MyINFO exception because already exists: %s",
	[69] = "Added MyINFO exception: %s",
	[70] = "and",
	[71] = "Deleted forbidden nick: %s",
	[72] = "Couldn't delete forbidden nick because not found: %s",
	[73] = "Deleted forbidden description: %s",
	[74] = "Couldn't delete forbidden description because not found: %s",
	[75] = "Deleted forbidden tag: %s",
	[76] = "Couldn't delete forbidden tag because not found: %s",
	[77] = "Deleted forbidden connection type: %s",
	[78] = "Couldn't delete forbidden connection type because not found: %s",
	[79] = "Deleted forbidden email: %s",
	[80] = "Couldn't delete forbidden email because not found: %s",
	[81] = "Deleted forbidden share size: %s",
	[82] = "Couldn't delete forbidden share size because not found: %s",
	[83] = "Deleted MyINFO exception: %s",
	[84] = "Couldn't delete MyINFO exception because not found: %s",
	[85] = "Forbidden nick list",
	[86] = "Forbidden nick list is empty.",
	[87] = "Forbidden description list",
	[88] = "Forbidden description list is empty.",
	[89] = "Forbidden tag list",
	[90] = "Forbidden tag list is empty.",
	[91] = "Forbidden connection type list",
	[92] = "Forbidden connection type list is empty.",
	[93] = "Forbidden email list",
	[94] = "Forbidden email list is empty.",
	[95] = "Forbidden share size list",
	[96] = "Forbidden share size list is empty.",
	[97] = "MyINFO exception list",
	[98] = "MyINFO exception list is empty.",
	[99] = "Deleted %s rows: %s",
	[100] = "Known types are: %s",
	[101] = "No rows to remove: %s",
	[102] = "date",
	[103] = "%s with class %s used command: %s",
	[104] = "context",
	[105] = "Deleted from chat rank list: %s",
	[106] = "Not found in chat rank list: %s",
	[107] = "Deleted from operator rank list: %s",
	[108] = "Not found in operator rank list: %s",
	[109] = "Antispam",
	[110] = "Your chat rank is: %s",
	[111] = "You have to write something in main chat to get started.",
	[112] = "Custom nick list is empty.",
	[113] = "Total share rank size: %s",
	[114] = "Your operator rank is: %s",
	[115] = "You have to do some operator actions to get started.",
	[116] = "Top %s chat rankers",
	[117] = "Chat rank list is empty.",
	[118] = "Top %s operator rankers",
	[119] = "Operator rank list is empty.",
	[120] = "string",
	[121] = "No user results found.",
	[122] = "Showing %s user log results",
	[123] = "Size of user log table: %s [ %s: %s @ %s ]",
	[124] = "Add protection entry",
	[125] = "Delete protection entry",
	[126] = "flags",
	[127] = "%s dropped due to bad search request.",
	[128] = "This command is either disabled or you don't have access to it.",
	[129] = "Deleted antispam entry: %s",
	[130] = "Couldn't delete antispam entry because not found: %s",
	[131] = "Antispam list",
	[132] = "Antispam list is empty.",
	[133] = "Couldn't add antispam exception entry because already exists: %s",
	[134] = "Added antispam exception entry: %s",
	[135] = "Deleted antispam exception entry: %s",
	[136] = "Couldn't delete antispam exception entry because not found: %s",
	[137] = "Antispam exception list",
	[138] = "Antispam exception list is empty.",
	[139] = "The user you're trying to send offline message to is a bot. Message is discarded.",
	[140] = "You can't start at user number %s when you only have %s accounts with class %s.",
	[141] = "Showing %s out of total %s accounts with class %s starting at user number %s",
	[142] = "There are no accounts with class: %s",
	[143] = "Known classes are: %s",
	[144] = "%s with class %s sent say message: <%s> %s",
	[145] = "%s with class %s had bad luck sending say message: <%s> %s",
	[146] = "You can't talk from nick whose class is higher or equals your own.",
	[147] = "%s with IP %s and class %s kicked: <%s> %s",
	[148] = "%s with class %s deleted %s statistics plugin entries older than %s days.",
	[149] = "offset",
	[150] = "order",
	[151] = "%s didn't get any search results.",
	[152] = "Redirected %s with IP %s and class %s to %s: <%s> %s",
	[153] = "Unknown protocol command from %s with IP %s and class %s: %s",
	[154] = "Custom nick list",
	[155] = "Ledokol operator commands",
	[156] = "Add antispam entry",
	[157] = "Showing last %s lines out of total %s found in %s file",
	[158] = "Delete antispam entry",
	[159] = "Add antispam exception entry",
	[160] = "Delete antispam exception entry",
	[161] = "Add MyINFO entry",
	[162] = "Delete MyINFO entry",
	[163] = "MyINFO list",
	[164] = "List of registered users by class",
	[165] = "Speak from other nick",
	[166] = "Remove user or word from rank list",
	[167] = "%s with class %s deleted %s user log entries older than %s days.",
	[168] = "List stored offline messages",
	[169] = "Delete offline messages by date",
	[170] = "Delete all offline messages",
	[171] = "class",
	[172] = "Clean up tables",
	[173] = "Operator chat history",
	[174] = "Delete all history messages",
	[175] = "Your operator rank",
	[176] = "Script configuration variables",
	[177] = "Change configuration variable",
	[178] = "nick",
	[179] = "This list of commands",
	[180] = "Ledokol user commands",
	[181] = "Current topic",
	[182] = "Your chat rank",
	[183] = "You're not allowed to send private messages.",
	[184] = "Unknown",
	[185] = "identifier",
	[186] = "Offline message to user",
	[187] = "Main chat history",
	[188] = "Ledokol statistics",
	[189] = "Script version: %s",
	[190] = "Total chat rank points: %s",
	[191] = "Total operator rank points: %s",
	[192] = "Average message count per user: %s",
	[193] = "lre",
	[194] = "action",
	[195] = "Changed configuration variable %s: %s => %s",
	[196] = "Configuration variable %s can only be set to: %s",
	[197] = "or",
	[198] = "Configuration variable %s must be a number.",
	[199] = "to",
	[200] = "Unknown configuration variable: %s",
	[201] = "%s version: %s",
	[202] = "Not installed",
	[203] = "%s dropped due to spam.",
	[204] = "variable",
	[205] = "value",
	[206] = "minutes",
	[207] = "%s library version: %s",
	[208] = "Reorder right click menu item",
	[209] = "lines",
	[210] = "Couldn't add rank exception because already exists: %s",
	[211] = "Added rank exception: %s",
	[212] = "Deleted rank exception: %s",
	[213] = "Couldn't delete rank exception because not found: %s",
	[214] = "Rank exception list",
	[215] = "Rank exception list is empty.",
	[216] = "Add rank exception",
	[217] = "Delete rank exception",
	[218] = "In order to use this feature you must turn off registered users list cache. Do it by setting hub configuration variable %s to %s and restarting the hub. Please note: Turning cache off is not recommended with large list of registered users.",
	[219] = "Both",
	[220] = "Deleted search filter: %s",
	[221] = "Couldn't delete search filter because not found: %s",
	[222] = "Search filter list",
	[223] = "Search filter list is empty.",
	[224] = "Magnet link: %s",
	[225] = "Add search filter",
	[226] = "Delete search filter",
	[227] = "Known actions are: %s",
	[228] = "Known flags are: %s",
	[229] = "Downloading version file...",
	[230] = "Size of kicks table: %s [ %s: %s @ %s ]",
	[231] = "Size of bans table: %s [ %s: %s @ %s ]",
	[232] = "Size of unbans table: %s [ %s: %s @ %s ]",
	[233] = "Size of IP logger plugin table: %s [ %s: %s @ %s ]",
	[234] = "Size of statistics plugin table: %s [ %s: %s @ %s ]",
	[235] = "Modified authorization entry: %s @ %s",
	[236] = "Added authorization entry: %s @ %s",
	[237] = "Deleted authorization entry: %s",
	[238] = "Couldn't delete authorization entry because not found: %s",
	[239] = "IP authorization list",
	[240] = "IP authorization list is empty.",
	[241] = "Add IP authorization entry",
	[242] = "Delete authorization entry",
	[243] = "ip",
	[244] = "%s with IP %s and class %s authorized.",
	[245] = "%s with IP %s and class %s failed authorization and disconnected.",
	[246] = "Category: %s",
	[247] = "Set custom nick for yourself",
	[248] = "This nick is registered or in use and therefore can't be used as custom nick: %s",
	[249] = "Set your welcome message",
	[250] = "Division by zero is forbidden.",
	[251] = "Show your welcome messages",
	[252] = "Welcome message list",
	[253] = "Delete user and his welcome messages",
	[254] = "Nick",
	[255] = "Login message",
	[256] = "Logout message",
	[257] = "Welcome message list is empty.",
	[258] = "Welcome messages were deleted for user: %s",
	[259] = "Couldn't delete user from welcome message list because not found: %s",
	[260] = "Your login message set: %s",
	[261] = "%s with class %s changed his login message: %s",
	[262] = "Your logout message set: %s",
	[263] = "%s with class %s changed his logout message: %s",
	[264] = "You don't have any welcome messages.",
	[265] = "Your login message: %s",
	[266] = "Add chatroom",
	[267] = "Chatroom list",
	[268] = "Delete chatroom",
	[269] = "description",
	[270] = "minclass",
	[271] = "maxclass",
	[272] = "Modified chatroom: %s",
	[273] = "Added chatroom: %s",
	[274] = "Deleted chatroom: %s",
	[275] = "Couldn't delete chatroom because not found: %s",
	[276] = "Chatroom",
	[277] = "Description",
	[278] = "Chatroom list is empty.",
	[279] = "Not found in country code statistics table: %s",
	[280] = "Custom nick %s is now owned by real user and therefore has been reset for user: %s",
	[281] = "%s is registered with class %s.",
	[282] = "Query executed but didn't return any results.",
	[283] = "Published: %s",
	[284] = "Add search filter exception entry",
	[285] = "Delete search filter exception entry",
	[286] = "Search filter exception list",
	[287] = "Couldn't add search filter exception entry because already exists: %s",
	[288] = "Added search filter exception entry: %s",
	[289] = "Deleted search filter exception entry: %s",
	[290] = "Couldn't delete search filter exception entry because not found: %s",
	[291] = "Search filter exception list is empty.",
	[292] = "file",
	[293] = "Read hub logs",
	[294] = "Known files are: %s",
	[295] = "Requested file is empty or couldn't be found.",
	[296] = "Add command notification exception",
	[297] = "Delete command notification exception",
	[298] = "Command notification exception list",
	[299] = "Added command notification exception entry: %s",
	[300] = "Couldn't add command notification exception entry because already exists: %s",
	[301] = "Deleted command notification exception entry: %s",
	[302] = "Couldn't delete command notification exception entry because not found: %s",
	[303] = "Command notification exception list is empty.",
	[304] = "Couldn't add chatroom because nick is already in use: %s",
	[305] = "Query results",
	[306] = "Connections from your IP aren't allowed for another %s seconds.",
	[307] = "Executed shell command didn't return any status code: %s",
	[308] = "Returned status code: %s",
	[309] = "Added by: %s",
	[310] = "publisher",
	[311] = "Release list is empty.",
	[312] = "Last %s releases",
	[313] = "No releases by requested publisher were found: %s",
	[314] = "Last %s releases published by %s",
	[315] = "No releases by requested category were found: %s",
	[316] = "Last %s releases by category %s",
	[317] = "No releases by requested search string were found: %s",
	[318] = "time",
	[319] = "Known search types are: %s",
	[320] = "Configuration variable %s can't be empty.",
	[321] = "Deleted from share rank list: %s",
	[322] = "Not found in share rank list: %s",
	[323] = "Your share rank",
	[324] = "Top %s share rankers",
	[325] = "You have to share %s and reconnect to get started.",
	[326] = "Share rank list is empty.",
	[327] = "Your share rank is: %s",
	[328] = "Custom nick can't be longer than %s characters.",
	[329] = "Delete custom nick",
	[330] = "Deleted user from custom nick list: %s",
	[331] = "Couldn't delete user from custom nick list because not found: %s",
	[332] = "Selected type requires extra parameters. Please refer to manual for more information.",
	[333] = "Size of registered users table: %s [ %s: %s @ %s ]",
	[334] = "Deleted %s accounts with class %s",
	[335] = "%s with class %s deleted %s accounts with class %s that has been inactive for %s days.",
	[336] = "Add command permission",
	[337] = "Delete command permission",
	[338] = "Command permission list",
	[339] = "Modified command permission with class %s: %s",
	[340] = "Added command permission with class %s: %s",
	[341] = "Deleted command permission: %s",
	[342] = "Couldn't delete command permission because not found: %s",
	[343] = "Command permission list is empty.",
	[344] = "Total search rank points: %s",
	[345] = "Please use following commands to finish update process.",
	[346] = "Moving files...",
	[347] = "Please visit %s to download the script manually.",
	[348] = "Couldn't add forbidden IP address because already exists: %s",
	[349] = "Added forbidden IP address: %s",
	[350] = "Deleted forbidden IP address: %s",
	[351] = "Couldn't delete forbidden IP address because not found: %s",
	[352] = "Forbidden IP address list",
	[353] = "Forbidden IP address list is empty.",
	[354] = "%s with IP %s and class %s allowed due to forbidden IP address exception: %s",
	[355] = "Couldn't delete category because not found: %s",
	[356] = "%s redirected due to spam.",
	[357] = "%s redirected due to bad search request.",
	[358] = "You can download me from: %s",
	[359] = "%s is registered with class %s and has been automatically unregistered and deleted from other tables.",
	[360] = "PiB",
	[361] = "TiB",
	[362] = "GiB",
	[363] = "MiB",
	[364] = "KiB",
	[365] = "B",
	[366] = "EiB",
	[367] = "Get users real nick",
	[368] = "Requested nick wasn't found in custom nick list.",
	[369] = "Requested nick belongs to a user who is %s: %s",
	[370] = "offline",
	[371] = "online",
	[372] = "Clean up ranks",
	[373] = "limit",
	[374] = "%s with class %s deleted %s chat ranks lower than %s.",
	[375] = "%s with class %s deleted %s share ranks lower than %s GiB.",
	[376] = "%s with class %s deleted %s operator ranks lower than %s.",
	[377] = "Size of chat ranks table: %s [ %s: %s @ %s ]",
	[378] = "Size of share ranks table: %s [ %s: %s @ %s ]",
	[379] = "Size of operator ranks table: %s [ %s: %s @ %s ]",
	[380] = "content",
	[381] = "destination",
	[382] = "interval",
	[383] = "Add reminder",
	[384] = "Delete reminder",
	[385] = "Reminder list",
	[386] = "Reminder list is empty.",
	[387] = "Known destinanions are: %s",
	[388] = "Known interval is: %s",
	[389] = "Modified reminder: %s",
	[390] = "Added reminder: %s",
	[391] = "Deleted reminder: %s",
	[392] = "Reminder not found: %s",
	[393] = "Identifier: %s",
	[394] = "Content: %s",
	[395] = "Interval: %s of %s",
	[396] = "Destination: %s",
	[397] = "Raw command",
	[398] = "PM",
	[399] = "MC",
	[400] = "reply",
	[401] = "Add chat responder",
	[402] = "Delete chat responder",
	[403] = "Main chat responder list",
	[404] = "Main chat responder list is empty.",
	[405] = "%s with class %s deleted %s operator chat history messages.",
	[406] = "Search in user log",
	[407] = "Added chat responder: %s",
	[408] = "Deleted chat responder with ID: %s",
	[409] = "Couldn't delete chat responder because ID not found: %s",
	[410] = "Responder",
	[411] = "Reply",
	[412] = "Add chat responder exception",
	[413] = "Delete chat responder exception",
	[414] = "Chat responder exception list",
	[415] = "Chat responder exception list is empty.",
	[416] = "Couldn't add chat responder exception because already exists: %s",
	[417] = "Added chat responder exception: %s",
	[418] = "Deleted chat responder exception: %s",
	[419] = "Couldn't delete chat responder exception because not found: %s",
	[420] = "command",
	[421] = "Customize script command",
	[422] = "Customized script command: %s => %s",
	[423] = "Unknown script command: %s",
	[424] = "Requested nick is real.",
	[425] = "%s with class %s customized script command: %s => %s",
	[426] = "Reset all custom commands",
	[427] = "%s custom commands were reset.",
	[428] = "Ledokol tables are now deleted and script is locked.",
	[429] = "Please unload the script and remove it from scripts directory.",
	[430] = "Good luck.",
	[431] = "Please unload the script to finish.",
	[432] = "%s with IP %s and class %s sent message to %s: %s",
	[433] = "Script uptime: %s",
	[434] = "month",
	[435] = "months",
	[436] = "day",
	[437] = "hour",
	[438] = "hours",
	[439] = "Top %s used words",
	[440] = "Deleted from word rank list: %s",
	[441] = "Not found in word rank list: %s",
	[442] = "%s with class %s deleted %s word ranks lower than %s.",
	[443] = "Size of word ranks table: %s [ %s: %s @ %s ]",
	[444] = "Total word rank points: %s",
	[445] = "Word rank list is empty.",
	[446] = "%s with class %s registered new user with class %s: %s",
	[447] = "%s with class %s deleted registered user with class %s: %s",
	[448] = "%s with class %s changed user class from %s to %s: %s",
	[449] = "%s with IP %s and class %s allowed due to fake share exception: %s",
	[450] = "%s with IP %s and class %s allowed due to clone exception: %s",
	[451] = "%s with IP %s and class %s allowed due to same IP exception: %s",
	[452] = "seconds",
	[453] = "Add news item",
	[454] = "Delete news items",
	[455] = "Read hub news",
	[456] = "Added news item: %s",
	[457] = "Hub news list is empty.",
	[458] = "Deleted %s news items.",
	[459] = "Couldn't delete news items because not found: %s",
	[460] = "Last %s news items",
	[461] = "By %s on %s: %s",
	[462] = "There are no main chat history messages written by you.",
	[463] = "Last %s main chat messages written by you",
	[464] = "Your main chat history",
	[465] = "Script memory usage: %s",
	[466] = "Couldn't load language file %s: %s",
	[467] = "Force custom nick for user",
	[468] = "User is not in userlist: %s",
	[469] = "Either the feature is disabled or user that you're trying to set welcome message for doesn't have access to it.",
	[470] = "name",
	[471] = "category",
	[472] = "tth",
	[473] = "Add new release",
	[474] = "Delete releases",
	[475] = "List of available releases",
	[476] = "Find release by name or category",
	[477] = "Hub is now going for a very quick restart. Please be patient.",
	[478] = "Hub is now going to shut down. Please be patient.",
	[479] = "equation",
	[480] = "Calculate an equation",
	[481] = "Both numbers must be either pi or numbers.",
	[482] = "Known operations are: %s",
	[483] = "Your logout message: %s",
	[484] = "Force welcome message for user",
	[485] = "Login message set for %s: %s",
	[486] = "Change nick of an registered user",
	[487] = "User is not registered: %s",
	[488] = "You are now going to be disconnected from the hub in order for your new nick to apply: %s",
	[489] = "Renamed account %s: %s",
	[490] = "%s with class %s renamed account %s: %s",
	[491] = "Your login message deleted.",
	[492] = "Your logout message deleted.",
	[493] = "%s with class %s deleted his login message.",
	[494] = "%s with class %s deleted his logout message.",
	[495] = "Logout message set for %s: %s",
	[496] = "%s with class %s changed login message for %s: %s",
	[497] = "%s with class %s changed logout message for %s: %s",
	[498] = "Login message deleted for user: %s",
	[499] = "Logout message deleted for user: %s",
	[500] = "%s with class %s deleted login message for user: %s",
	[501] = "%s with class %s deleted logout message for user: %s",
	[502] = "%s with class %s deleted welcome messages for user: %s",
	[503] = "minute",
	[504] = "Last %s releases by search string %s",
	[505] = "Modified release: %s",
	[506] = "Added release: %s",
	[507] = "Deleted release: %s",
	[508] = "Couldn't delete release because not found: %s",
	[509] = "Reminder preview",
	[510] = "Preview of %s reminder: %s",
	[511] = "Specified nick is already in use.",
	[512] = "Live user location statistics by country",
	[513] = "All time user location statistics",
	[514] = "This feature requires %s or later installed on your system.",
	[515] = "Total count since %s: %s",
	[516] = "Unknown country",
	[517] = "No users in the hub.",
	[518] = "User location statistics table is empty.",
	[519] = "Total count: %s",
	[520] = "Deleted all rows: %s",
	[521] = "%s with class %s deleted all user location entries.",
	[522] = "address",
	[523] = "owner",
	[524] = "Add friendly hub",
	[525] = "Delete friendly hub",
	[526] = "Show friendly hubs",
	[527] = "Added friendly hub: %s",
	[528] = "Modified friendly hub: %s",
	[529] = "Deleted friendly hub: %s",
	[530] = "Friendly hub not found: %s",
	[531] = "Friendly hublist",
	[532] = "Friendly hublist is empty.",
	[533] = "Executed shell command didn't return any output.",
	[534] = "Returned output",
	[535] = "%s renamed %s to: %s",
	[536] = "%s plugin version: %s",
	[537] = "second",
	[538] = "You are now known as: %s",
	[539] = "You renamed %s to: %s",
	[540] = "Spam exception from %s with IP %s and class %s in MC: %s",
	[541] = "Spam exception from %s with IP %s and class %s in PM: %s",
	[542] = "Spam exception from %s with IP %s and class %s in offline message: %s",
	[543] = "Spam exception from %s with IP %s and class %s in report: %s",
	[544] = "Spam notification from %s with IP %s and class %s in MC: %s",
	[545] = "Spam notification from %s with IP %s and class %s in PM: %s",
	[546] = "Spam notification from %s with IP %s and class %s in offline message: %s",
	[547] = "Spam notification from %s with IP %s and class %s in report: %s",
	[548] = "Spam from %s with IP %s and class %s in MC: %s",
	[549] = "Spam from %s with IP %s and class %s in PM: %s",
	[550] = "Spam from %s with IP %s and class %s in offline message: %s",
	[551] = "Spam from %s with IP %s and class %s in report: %s",
	[552] = "Modified antispam entry with action %s and priority %s to scan in MC: %s",
	[553] = "Modified antispam entry with action %s and priority %s to scan in PM: %s",
	[554] = "Modified antispam entry with action %s and priority %s to scan in MC and PM: %s",
	[555] = "Added antispam entry with action %s and priority %s to scan in MC: %s",
	[556] = "Added antispam entry with action %s and priority %s to scan in PM: %s",
	[557] = "Added antispam entry with action %s and priority %s to scan in MC and PM: %s",
	[558] = "Search request exception from %s with IP %s and class %s as any file: %s",
	[559] = "Search request exception from %s with IP %s and class %s as audio file: %s",
	[560] = "Search request exception from %s with IP %s and class %s as compressed file: %s",
	[561] = "Search request exception from %s with IP %s and class %s as document: %s",
	[562] = "Search request exception from %s with IP %s and class %s as executable: %s",
	[563] = "Search request exception from %s with IP %s and class %s as picture: %s",
	[564] = "Search request exception from %s with IP %s and class %s as video: %s",
	[565] = "Search request exception from %s with IP %s and class %s as folder: %s",
	[566] = "Search request exception from %s with IP %s and class %s as TTH: %s",
	[567] = "Search request notification from %s with IP %s and class %s as any file: %s",
	[568] = "Search request notification from %s with IP %s and class %s as audio file: %s",
	[569] = "Search request notification from %s with IP %s and class %s as compressed file: %s",
	[570] = "Search request notification from %s with IP %s and class %s as document: %s",
	[571] = "Search request notification from %s with IP %s and class %s as executable: %s",
	[572] = "Search request notification from %s with IP %s and class %s as picture: %s",
	[573] = "Search request notification from %s with IP %s and class %s as video: %s",
	[574] = "Search request notification from %s with IP %s and class %s as folder: %s",
	[575] = "Search request notification from %s with IP %s and class %s as TTH: %s",
	[576] = "Bad search request from %s with IP %s and class %s as any file: %s",
	[577] = "Bad search request from %s with IP %s and class %s as audio file: %s",
	[578] = "Bad search request from %s with IP %s and class %s as compressed file: %s",
	[579] = "Bad search request from %s with IP %s and class %s as document: %s",
	[580] = "Bad search request from %s with IP %s and class %s as executable: %s",
	[581] = "Bad search request from %s with IP %s and class %s as picture: %s",
	[582] = "Bad search request from %s with IP %s and class %s as video: %s",
	[583] = "Bad search request from %s with IP %s and class %s as folder: %s",
	[584] = "Bad search request from %s with IP %s and class %s as TTH: %s",
	[585] = "Modified search filter with action %s and priority %s as any file: %s",
	[586] = "Modified search filter with action %s and priority %s as audio file: %s",
	[587] = "Modified search filter with action %s and priority %s as compressed file: %s",
	[588] = "Modified search filter with action %s and priority %s as document: %s",
	[589] = "Modified search filter with action %s and priority %s as executable: %s",
	[590] = "Modified search filter with action %s and priority %s as picture: %s",
	[591] = "Modified search filter with action %s and priority %s as video: %s",
	[592] = "Modified search filter with action %s and priority %s as folder: %s",
	[593] = "Modified search filter with action %s and priority %s as TTH: %s",
	[594] = "Added search filter with action %s and priority %s as any file: %s",
	[595] = "Added search filter with action %s and priority %s as audio file: %s",
	[596] = "Added search filter with action %s and priority %s as compressed file: %s",
	[597] = "Added search filter with action %s and priority %s as document: %s",
	[598] = "Added search filter with action %s and priority %s as executable: %s",
	[599] = "Added search filter with action %s and priority %s as picture: %s",
	[600] = "Added search filter with action %s and priority %s as video: %s",
	[601] = "Added search filter with action %s and priority %s as folder: %s",
	[602] = "Added search filter with action %s and priority %s as TTH: %s",
	[603] = "%s with class %s deleted %s releases older than %s days.",
	[604] = "Size of release table: %s [ %s: %s @ %s ]",
	[605] = "LRE",
	[606] = "Code accepted.",
	[607] = "Protection list",
	[608] = "Added protection entry: %s",
	[609] = "Deleted protection entry: %s",
	[610] = "Protection entry already exists: %s",
	[611] = "Protection entry not found: %s",
	[612] = "Protection list is empty.",
	[613] = "Missing %s in configuration variable.",
	[614] = "Chatroom: %s",
	[615] = "You've left the chatroom.",
	[616] = "User left the chatroom: %s",
	[617] = "User entered the chatroom: %s",
	[618] = "You've entered %s chatroom.",
	[619] = "You're not member of this chatroom.",
	[620] = "You don't have access to this chatroom.",
	[621] = "Chatroom member list",
	[622] = "Chatroom is empty.",
	[623] = "You're already member of this chatroom.",
	[624] = "Chatroom user commands",
	[625] = "This feature requires %s module installed on your system.",
	[626] = "Unknown chatroom command. Use %s for help.",
	[627] = "Enter the chatroom",
	[628] = "Leave the chatroom",
	[629] = "Deleted %s rows from country code statistics table: %s",
	[630] = "Set chat mode",
	[631] = "Known chat modes are: %s",
	[632] = "mode",
	[633] = "Changing chat mode for %s: %s => %s",
	[634] = "Not found in chat mode list: %s",
	[635] = "Chat mode user list",
	[636] = "Chat mode user list is empty.",
	[637] = "%s user lookup",
	[638] = "Looking on %s for %s...",
	[639] = "User %s found in following hubs",
	[640] = "User %s wasn't found in any hubs.",
	[641] = "Add IP gag",
	[642] = "Added IP gag: %s",
	[643] = "Modified IP gag: %s",
	[644] = "Deleted IP gag: %s",
	[645] = "IP gag not found: %s",
	[646] = "IP gag list",
	[647] = "IP gag list is empty.",
	[648] = "Delete IP gag",
	[649] = "Main chat is currently disabled for you.",
	[650] = "Cleared temporary IP gag list.",
	[651] = "Show custom script commands",
	[652] = "Custom script command list",
	[653] = "Custom script command list is empty.",
	[654] = "Script size: %s lines in %s",
	[655] = "Added %s to IP gag list, %s users in total.",
	[656] = "Flood detected from IP %s last known as %s with class %s in MC: %s",
	[657] = "Flood detected from IP %s last known as %s with class %s in PM: %s",
	[658] = "Private chat is currently disabled for you.",
	[659] = "Flood detected from your IP.",
	[660] = "%s users with IP %s dropped due to flood.",
	[661] = "Unable to proceed: %s",
	[662] = "No error message specified.",
	[663] = "Search filter",
	[664] = "MyINFO check",
	[665] = "Authorization",
	[666] = "Ranks",
	[667] = "Welcome messages",
	[668] = "Chatrooms",
	[669] = "Reminders",
	[670] = "Hub news",
	[671] = "Chat responder",
	[672] = "Releases",
	[673] = "Offline messenger",
	[674] = "Chat history",
	[675] = "Commands",
	[676] = "Custom nicks",
	[677] = "Registered users",
	[678] = "Hublist",
	[679] = "Chat",
	[680] = "IP gag",
	[681] = "User logger",
	[682] = "Other",
	[683] = "Configuration",
	[684] = "Clear main chat",
	[685] = "Chat cleanup performed by %s",
	[686] = "Search in registered users list",
	[687] = "Registered users list statistics",
	[688] = "Registered users list results for %s",
	[689] = "Class %s: %s",
	[690] = "Registered users list is empty.",
	[691] = "This feature requires any version of %s installed on your system.",
	[692] = "Configuration directory: %s",
	[693] = "%s with IP %s and class %s stated incorrect IP in connect request to %s: %s",
	[694] = "Top %s search requests",
	[695] = "Search rank list is empty.",
	[696] = "Deleted from search rank list: %s",
	[697] = "Not found in search rank list: %s",
	[698] = "%s with class %s deleted %s search ranks lower than %s.",
	[699] = "Size of search ranks table: %s [ %s: %s @ %s ]",
	[700] = "Size of user location statistics table: %s [ %s: %s ]",
	[701] = "File not found: %s",
	[702] = "Open files limit: %s",
	[703] = "User information",
	[704] = "User not in list: %s",
	[705] = "Nick: %s",
	[706] = "Description: %s",
	[707] = "Tag: %s",
	[708] = "Mode: %s",
	[709] = "Slots: %s",
	[710] = "Hubs: %s",
	[711] = "Limiter: %s KiB/s",
	[712] = "Connection: %s",
	[713] = "Status: %s",
	[714] = "Email: %s",
	[715] = "Share: %s",
	[716] = "Exact share: %s",
	[717] = "Class: %s",
	[718] = "IP: %s",
	[719] = "DNS: %s",
	[720] = "Country: %s",
	[721] = "Client: %s",
	[722] = "Version: %s",
	[723] = "Normal",
	[724] = "Away",
	[725] = "Normal away",
	[726] = "Fileserver",
	[727] = "Normal fileserver",
	[728] = "Away fileserver",
	[729] = "Normal away fileserver",
	[730] = "Fireball",
	[731] = "Normal fireball",
	[732] = "Away fireball",
	[733] = "Normal away fireball",
	[734] = "Fileserver fireball",
	[735] = "Normal fileserver fireball",
	[736] = "Away fileserver fireball",
	[737] = "Normal away fileserver fireball",
	[738] = "TLS",
	[739] = "Normal TLS",
	[740] = "Away TLS",
	[741] = "Normal away TLS",
	[742] = "Fileserver TLS",
	[743] = "Normal fileserver TLS",
	[744] = "Away fileserver TLS",
	[745] = "Normal away fileserver TLS",
	[746] = "Fireball TLS",
	[747] = "Normal fireball TLS",
	[748] = "Away fireball TLS",
	[749] = "Normal away fireball TLS",
	[750] = "Fileserver fireball TLS",
	[751] = "Normal fileserver fireball TLS",
	[752] = "Away fileserver fireball TLS",
	[753] = "Normal away fileserver fireball TLS",
	[754] = "Unable to get bot information: %s",
	[755] = "Bot information",
	[756] = "Owner script: %s",
	[757] = "%s with IP %s and class %s allowed due to forbidden DNS exception: %s",
	[758] = "In order to use this feature you need to enable DNS lookup. Do it by setting hub configuration variable %s to %s. Please note: Enabling DNS lookup might slow your hub performance down.",
	[759] = "Couldn't add forbidden DNS because already exists: %s",
	[760] = "Added forbidden DNS: %s",
	[761] = "Deleted forbidden DNS: %s",
	[762] = "Couldn't delete forbidden DNS because not found: %s",
	[763] = "Forbidden DNS list",
	[764] = "Forbidden DNS list is empty.",
	[765] = "Powered by %s",
	[766] = "Warning: %s",
	[767] = "Open files limit set to %s is smaller than maximum users configuration which is %s. You can correct this by setting %s to %s or higher and restarting the hub.",
	[768] = "Additional help",
	[769] = "Remove all Ledokol tables and files",
	[770] = "No reason specified.",
	[771] = "You can't kick a user whose class is higher or equals your own.",
	[772] = "Your topic contains forbidden characters which can't be used for security reason: %s",
	[773] = "Hub uptime: %s",
	[774] = "User count: %s",
	[775] = "Total share: %s",
	[776] = "%s with IP %s and class %s tries to speak with IP gag in MC: %s",
	[777] = "%s with IP %s and class %s tries to speak with IP gag in PM: %s",
	[778] = "Private message replaced for user: %s",
	[779] = "Command logger",
	[780] = "Showing %s entries from command logger",
	[781] = "Command logger is empty.",
	[782] = "%s with class %s deleted %s command log entries older than %s days.",
	[783] = "Size of command log table: %s [ %s: %s @ %s ]",
	[784] = "password",
	[785] = "Modify IP authorization entry",
	[786] = "Couldn't modify authorization entry because not found: %s",
	[787] = "Uptime: %s",
	[788] = "Enable requested feature and try again.",
	[789] = "cc",
	[790] = "Couldn't add forbidden CC because already exists: %s",
	[791] = "Added forbidden CC: %s",
	[792] = "Deleted forbidden CC: %s",
	[793] = "Couldn't delete forbidden CC because not found: %s",
	[794] = "Forbidden CC list",
	[795] = "Forbidden CC list is empty.",
	[796] = "%s with IP %s and class %s allowed due to forbidden CC exception: %s",
	[797] = "I'm staying idle due to confusion.",
	[798] = "Added chat replacer: %s",
	[799] = "Deleted chat replacer with ID: %s",
	[800] = "Couldn't delete chat replacer because ID not found: %s",
	[801] = "Main chat replacer list",
	[802] = "Main chat replacer list is empty.",
	[803] = "Replace",
	[804] = "Couldn't add chat replacer exception because already exists: %s",
	[805] = "Added chat replacer exception: %s",
	[806] = "Deleted chat replacer exception: %s",
	[807] = "Couldn't delete chat replacer exception because not found: %s",
	[808] = "Chat replacer exception list",
	[809] = "Chat replacer exception list is empty.",
	[810] = "replace",
	[811] = "Add chat replacer",
	[812] = "Delete chat replacer",
	[813] = "Add chat replacer exception",
	[814] = "Delete chat replacer exception",
	[815] = "Chat replacer",
	[816] = "You need to send another %s main chat messages in order to use hub registration.",
	[817] = "Please wait another %s minutes before using hub registration.",
	[818] = "In order to use this feature you need to set %s to: %s",
	[819] = "Please reconnect to gain %s minutes of uptime in order to use hub registration.",
	[820] = "Dropping %s with IP %s and class %s due to protocol flood detection: %s",
	[821] = "Protocol flood detected from your client: %s",
	[822] = "Automatic update detected Ledokol version %s released, to upgrade use: %s",
	[823] = "menu",
	[824] = "Dropping user due to clone detection from IP %s with class %s: %s = %s",
	[825] = "Configuration variable %s must be a valid IP address.",
	[826] = "Average share per user: %s",
	[827] = "Don't be stupid.",
	[828] = "reason",
	[829] = "Add blocked PM entry",
	[830] = "Delete blocked PM entry",
	[831] = "List of blocked PM entries",
	[832] = "Modified blocked PM entry: %s",
	[833] = "Added blocked PM entry: %s",
	[834] = "Deleted blocked PM entry: %s",
	[835] = "Blocked PM list is empty.",
	[836] = "Couldn't delete blocked PM entry because not found: %s",
	[837] = "Reason: %s",
	[838] = "You're not allowed to send PM to this user because: %s",
	[839] = "%s with class %s deleted %s antispam entries with occurrence less than %s.",
	[840] = "%s with class %s deleted %s search filter entries with occurrence less than %s.",
	[841] = "query",
	[842] = "Execute MySQL query",
	[843] = "Execute shell command",
	[844] = "Experts only",
	[845] = "Add hard IP ban entry",
	[846] = "Delete hard IP ban entry",
	[847] = "List of hard IP ban entries",
	[848] = "Modified hard IP ban entry: %s",
	[849] = "Added hard IP ban entry: %s",
	[850] = "Deleted hard IP ban entry: %s",
	[851] = "Hard IP ban list is empty.",
	[852] = "Couldn't delete hard IP ban entry because not found: %s",
	[853] = "Hard IP ban refused connection from IP %s: %s",
	[854] = "Please wait another %s seconds before using hub search engine.",
	[855] = "Loading %s in memory...",
	[856] = "Finished loading %s in memory.",
	[857] = "Unable to locate %s in hub configuration directory.",
	[858] = "Add right click menu item",
	[859] = "Delete right click menu item",
	[860] = "List of right click menu items",
	[861] = "Blacklisted connection from IP %s dropped: %s",
	[862] = "To add multiple entries with this command you need to separate every entry by space.",
	[863] = "Add IP watch entry",
	[864] = "Delete IP watch entry",
	[865] = "List of IP watch entries",
	[866] = "result",
	[867] = "Modified IP watch entry: %s",
	[868] = "Added IP watch entry: %s",
	[869] = "Known results are: %s",
	[870] = "Deleted IP watch entry: %s",
	[871] = "IP watch list is empty.",
	[872] = "Couldn't delete IP watch entry because not found: %s",
	[873] = "IP watch notification from %s with IP %s: %s",
	[874] = "unknown nick",
	[875] = "Either user %s wasn't found in any hubs or target server is down. Please try again later.",
	[876] = "Country code gag",
	[877] = "Add country code gag",
	[878] = "Added country code gag: %s",
	[879] = "Modified country code gag: %s",
	[880] = "Deleted country code gag: %s",
	[881] = "Country code gag not found: %s",
	[882] = "Country code gag list",
	[883] = "Country code gag list is empty.",
	[884] = "Delete country code gag",
	[885] = "Cleared country code gag list.",
	[886] = "%s with IP %s and class %s tries to speak with country code gag in MC: %s",
	[887] = "%s with IP %s and class %s tries to speak with country code gag in PM: %s",
	[888] = "No reason specified",
	[889] = "Automatically deleted %s user log entries older than %s days.",
	[890] = "Main chat message replaced for user: %s",
	[891] = "Unknown protocol command from IP %s before login: %s",
	[892] = "Added %s to hard ban list, %s users in total.",
	[893] = "NMDC version: %s",
	[894] = "Client supports: %s",
	[895] = "Couldn't add forbidden client supports because already exists: %s",
	[896] = "Added forbidden client supports: %s",
	[897] = "Couldn't add forbidden NMDC version because already exists: %s",
	[898] = "Added forbidden NMDC version: %s",
	[899] = "Latest version of %s is required in order to use this feature.",
	[900] = "Deleted forbidden client supports: %s",
	[901] = "Couldn't delete forbidden client supports because not found: %s",
	[902] = "Deleted forbidden NMDC version: %s",
	[903] = "Couldn't delete forbidden NMDC version because not found: %s",
	[904] = "Forbidden client supports list",
	[905] = "Forbidden client supports list is empty.",
	[906] = "Forbidden NMDC version list",
	[907] = "Forbidden NMDC version list is empty.",
	[908] = "%s with IP %s and class %s allowed due to forbidden client supports exception: %s",
	[909] = "%s with IP %s and class %s allowed due to forbidden NMDC version exception: %s",
	[910] = "City: %s",
	[911] = "IP range: %s - %s",
	[912] = "Region: %s",
	[913] = "Time zone: %s",
	[914] = "Continent: %s",
	[915] = "Postal code: %s",
	[916] = "Coordinates: %f %f",
	[917] = "Metro code: %d",
	[918] = "Area code: %d",
	[919] = "Drop users with IP",
	[920] = "No users found with IP: %s",
	[921] = "Dropped %s users with IP: %s",
	[922] = "%s dropped %s users with IP: %s",
	[923] = "Live user location statistics by city",
	[924] = "Live user location statistics by city from %s=%s",
	[925] = "No users in the hub from: %s=%s",
	[926] = "Help notes",
	[927] = "parameter",
	[928] = "Command parameters %s are always required, while %s are optional.",
	[929] = "Quoted parameters %s or %s must be used with quotes.",
	[930] = "IP information",
	[931] = "IP information not available: %s",
	[932] = "Chat message replaced for user with class %s: <%s> %s",
	[933] = "IP %s permanently banned: <%s> %s",
	[934] = "Nick %s permanently banned: <%s> %s",
	[935] = "Range %s permanently banned: <%s> %s",
	[936] = "Host %s permanently banned: <%s> %s",
	[937] = "Share %s permanently banned: <%s> %s",
	[938] = "Prefix %s permanently banned: <%s> %s",
	[939] = "IP %s temporarily banned until %s: <%s> %s",
	[940] = "Nick %s temporarily banned until %s: <%s> %s",
	[941] = "Range %s temporarily banned until %s: <%s> %s",
	[942] = "Host %s temporarily banned until %s: <%s> %s",
	[943] = "Share %s temporarily banned until %s: <%s> %s",
	[944] = "Prefix %s temporarily banned until %s: <%s> %s",
	[945] = "IP %s unbanned: <%s> %s",
	[946] = "Nick %s unbanned: <%s> %s",
	[947] = "Range %s unbanned: <%s> %s",
	[948] = "Host %s unbanned: <%s> %s",
	[949] = "Share %s unbanned: <%s> %s",
	[950] = "Prefix %s unbanned: <%s> %s",
	[951] = "Known contexts are: %s",
	[952] = "Known orders are: %s",
	[953] = "Modified right click menu item: %s",
	[954] = "Added right click menu item: %s",
	[955] = "Deleted right click menu item: %s",
	[956] = "Right click menu item not found: %s",
	[957] = "Right click menu item list is empty.",
	[958] = "Menu item",
	[959] = "Menu command",
	[960] = "Changed right click menu item order: %s",
	[961] = "Separator or eraser",
	[962] = "Nick and IP %s unbanned: <%s> %s",
	[963] = "Other %s unbanned: <%s> %s",
	[964] = "Vote for user to be kicked",
	[965] = "You don't want to vote for kicking an operator.",
	[966] = "User voted kick",
	[967] = "You have already voted for kicking that user.",
	[968] = "%s added vote %s of %s for kicking user with class %s: %s",
	[969] = "There is an error in following antispam entry pattern",
	[970] = "Pattern",
	[971] = "Error",
	[972] = "Solution",
	[973] = "There is an error in following search filter pattern",
	[974] = "There is an error in following search filter exception pattern",
	[975] = "There is an error in following antispam exception entry pattern",
	[976] = "There is an error in following forbidden nick pattern",
	[977] = "There is an error in following MyINFO exception pattern",
	[978] = "There is an error in following forbidden description pattern",
	[979] = "There is an error in following forbidden tag pattern",
	[980] = "There is an error in following forbidden connection type pattern",
	[981] = "There is an error in following forbidden email pattern",
	[982] = "There is an error in following forbidden share size pattern",
	[983] = "There is an error in following forbidden IP address pattern",
	[984] = "There is an error in following forbidden CC pattern",
	[985] = "There is an error in following forbidden DNS pattern",
	[986] = "There is an error in following forbidden client supports pattern",
	[987] = "There is an error in following forbidden NMDC version pattern"
}

---------------------------------------------------------------------
-- default language table <<
---------------------------------------------------------------------

---------------------------------------------------------------------
-- translit table >>
---------------------------------------------------------------------

tbl_cyrlet = {
	{["cyr"] = 224, ["lat"] = "a"},
	{["cyr"] = 192, ["lat"] = "A", ["low"] = 224},
	{["cyr"] = 225, ["lat"] = "b"},
	{["cyr"] = 193, ["lat"] = "B", ["low"] = 225},
	{["cyr"] = 226, ["lat"] = "v"},
	{["cyr"] = 194, ["lat"] = "V", ["low"] = 226},
	{["cyr"] = 227, ["lat"] = "g"},
	{["cyr"] = 195, ["lat"] = "G", ["low"] = 227},
	{["cyr"] = 228, ["lat"] = "d"},
	{["cyr"] = 196, ["lat"] = "D", ["low"] = 228},
	{["cyr"] = 229, ["lat"] = "e"},
	{["cyr"] = 197, ["lat"] = "E", ["low"] = 229},
	{["cyr"] = 184, ["lat"] = "e"},
	{["cyr"] = 168, ["lat"] = "E", ["low"] = 184},
	{["cyr"] = 230, ["lat"] = "zh"},
	{["cyr"] = 198, ["lat"] = "Zh", ["low"] = 230},
	{["cyr"] = 231, ["lat"] = "z"},
	{["cyr"] = 199, ["lat"] = "Z", ["low"] = 231},
	{["cyr"] = 232, ["lat"] = "i"},
	{["cyr"] = 200, ["lat"] = "I", ["low"] = 232},
	{["cyr"] = 233, ["lat"] = "y"},
	{["cyr"] = 201, ["lat"] = "Y", ["low"] = 233},
	{["cyr"] = 234, ["lat"] = "k"},
	{["cyr"] = 202, ["lat"] = "K", ["low"] = 234},
	{["cyr"] = 235, ["lat"] = "l"},
	{["cyr"] = 203, ["lat"] = "L", ["low"] = 235},
	{["cyr"] = 236, ["lat"] = "m"},
	{["cyr"] = 204, ["lat"] = "M", ["low"] = 236},
	{["cyr"] = 237, ["lat"] = "n"},
	{["cyr"] = 205, ["lat"] = "N", ["low"] = 237},
	{["cyr"] = 238, ["lat"] = "o"},
	{["cyr"] = 206, ["lat"] = "O", ["low"] = 238},
	{["cyr"] = 239, ["lat"] = "p"},
	{["cyr"] = 207, ["lat"] = "P", ["low"] = 239},
	{["cyr"] = 240, ["lat"] = "r"},
	{["cyr"] = 208, ["lat"] = "R", ["low"] = 240},
	{["cyr"] = 241, ["lat"] = "s"},
	{["cyr"] = 209, ["lat"] = "S", ["low"] = 241},
	{["cyr"] = 242, ["lat"] = "t"},
	{["cyr"] = 210, ["lat"] = "T", ["low"] = 242},
	{["cyr"] = 243, ["lat"] = "u"},
	{["cyr"] = 211, ["lat"] = "U", ["low"] = 243},
	{["cyr"] = 244, ["lat"] = "f"},
	{["cyr"] = 212, ["lat"] = "F", ["low"] = 244},
	{["cyr"] = 245, ["lat"] = "h"},
	{["cyr"] = 213, ["lat"] = "H", ["low"] = 245},
	{["cyr"] = 246, ["lat"] = "ts"},
	{["cyr"] = 214, ["lat"] = "Ts", ["low"] = 246},
	{["cyr"] = 247, ["lat"] = "ch"},
	{["cyr"] = 215, ["lat"] = "Ch", ["low"] = 247},
	{["cyr"] = 248, ["lat"] = "sh"},
	{["cyr"] = 216, ["lat"] = "Sh", ["low"] = 248},
	{["cyr"] = 249, ["lat"] = "sh'"},
	{["cyr"] = 217, ["lat"] = "Sh'", ["low"] = 249},
	{["cyr"] = 250, ["lat"] = "'"},
	{["cyr"] = 218, ["lat"] = "'", ["low"] = 250},
	{["cyr"] = 251, ["lat"] = "y"},
	{["cyr"] = 219, ["lat"] = "Y", ["low"] = 251},
	{["cyr"] = 252, ["lat"] = "'"},
	{["cyr"] = 220, ["lat"] = "'", ["low"] = 252},
	{["cyr"] = 253, ["lat"] = "e"},
	{["cyr"] = 221, ["lat"] = "E", ["low"] = 253},
	{["cyr"] = 254, ["lat"] = "yu"},
	{["cyr"] = 222, ["lat"] = "Yu", ["low"] = 254},
	{["cyr"] = 255, ["lat"] = "ya"},
	{["cyr"] = 223, ["lat"] = "Ya", ["low"] = 255}
}

---------------------------------------------------------------------
-- translit table <<
---------------------------------------------------------------------

---------------------------------------------------------------------
-- country names by code table >>
---------------------------------------------------------------------

cc_names = {
	["A1"] = "Anonymous Proxy",
	["A2"] = "Satellite Provider",
	["O1"] = "Other Country",
	["EU"] = "European Union",
	["AP"] = "Asia Pacific Region",
	["AD"] = "Andorra",
	["AE"] = "United Arab Emirates",
	["AF"] = "Afghanistan",
	["AG"] = "Antigua and Barbuda",
	["AI"] = "Anguilla",
	["AL"] = "Albania",
	["AM"] = "Armenia",
	["AO"] = "Angola",
	["AP"] = "Asia/Pacific Region",
	["AQ"] = "Antarctica",
	["AR"] = "Argentina",
	["AS"] = "American Samoa",
	["AT"] = "Austria",
	["AU"] = "Australia",
	["AW"] = "Aruba",
	["AX"] = "Aland Islands",
	["AZ"] = "Azerbaijan",
	["BA"] = "Bosnia and Herzegovina",
	["BB"] = "Barbados",
	["BD"] = "Bangladesh",
	["BE"] = "Belgium",
	["BF"] = "Burkina Faso",
	["BG"] = "Bulgaria",
	["BH"] = "Bahrain",
	["BI"] = "Burundi",
	["BJ"] = "Benin",
	["BL"] = "Saint Bartelemey",
	["BM"] = "Bermuda",
	["BN"] = "Brunei Darussalam",
	["BO"] = "Bolivia",
	["BQ"] = "Bonaire, Saint Eustatius and Saba",
	["BR"] = "Brazil",
	["BS"] = "Bahamas",
	["BT"] = "Bhutan",
	["BV"] = "Bouvet Island",
	["BW"] = "Botswana",
	["BY"] = "Belarus",
	["BZ"] = "Belize",
	["CA"] = "Canada",
	["CC"] = "Cocos (Keeling) Islands",
	["CD"] = "Congo, The Democratic Republic of the",
	["CF"] = "Central African Republic",
	["CG"] = "Congo",
	["CH"] = "Switzerland",
	["CI"] = "Cote d'Ivoire",
	["CK"] = "Cook Islands",
	["CL"] = "Chile",
	["CM"] = "Cameroon",
	["CN"] = "China",
	["CO"] = "Colombia",
	["CR"] = "Costa Rica",
	["CU"] = "Cuba",
	["CV"] = "Cape Verde",
	["CW"] = "Curacao",
	["CX"] = "Christmas Island",
	["CY"] = "Cyprus",
	["CZ"] = "Czech Republic",
	["DE"] = "Germany",
	["DJ"] = "Djibouti",
	["DK"] = "Denmark",
	["DM"] = "Dominica",
	["DO"] = "Dominican Republic",
	["DZ"] = "Algeria",
	["EC"] = "Ecuador",
	["EE"] = "Estonia",
	["EG"] = "Egypt",
	["EH"] = "Western Sahara",
	["ER"] = "Eritrea",
	["ES"] = "Spain",
	["ET"] = "Ethiopia",
	["EU"] = "Europe",
	["FI"] = "Finland",
	["FJ"] = "Fiji",
	["FK"] = "Falkland Islands (Malvinas)",
	["FM"] = "Micronesia, Federated States of",
	["FO"] = "Faroe Islands",
	["FR"] = "France",
	["GA"] = "Gabon",
	["GB"] = "United Kingdom",
	["GD"] = "Grenada",
	["GE"] = "Georgia",
	["GF"] = "French Guiana",
	["GG"] = "Guernsey",
	["GH"] = "Ghana",
	["GI"] = "Gibraltar",
	["GL"] = "Greenland",
	["GM"] = "Gambia",
	["GN"] = "Guinea",
	["GP"] = "Guadeloupe",
	["GQ"] = "Equatorial Guinea",
	["GR"] = "Greece",
	["GS"] = "South Georgia and the South Sandwich Islands",
	["GT"] = "Guatemala",
	["GU"] = "Guam",
	["GW"] = "Guinea-Bissau",
	["GY"] = "Guyana",
	["HK"] = "Hong Kong",
	["HM"] = "Heard Island and McDonald Islands",
	["HN"] = "Honduras",
	["HR"] = "Croatia",
	["HT"] = "Haiti",
	["HU"] = "Hungary",
	["ID"] = "Indonesia",
	["IE"] = "Ireland",
	["IL"] = "Israel",
	["IM"] = "Isle of Man",
	["IN"] = "India",
	["IO"] = "British Indian Ocean Territory",
	["IQ"] = "Iraq",
	["IR"] = "Iran, Islamic Republic of",
	["IS"] = "Iceland",
	["IT"] = "Italy",
	["JE"] = "Jersey",
	["JM"] = "Jamaica",
	["JO"] = "Jordan",
	["JP"] = "Japan",
	["KE"] = "Kenya",
	["KG"] = "Kyrgyzstan",
	["KH"] = "Cambodia",
	["KI"] = "Kiribati",
	["KM"] = "Comoros",
	["KN"] = "Saint Kitts and Nevis",
	["KP"] = "Korea, Democratic People's Republic of",
	["KR"] = "Korea, Republic of",
	["KW"] = "Kuwait",
	["KY"] = "Cayman Islands",
	["KZ"] = "Kazakhstan",
	["LA"] = "Lao People's Democratic Republic",
	["LB"] = "Lebanon",
	["LC"] = "Saint Lucia",
	["LI"] = "Liechtenstein",
	["LK"] = "Sri Lanka",
	["LR"] = "Liberia",
	["LS"] = "Lesotho",
	["LT"] = "Lithuania",
	["LU"] = "Luxembourg",
	["LV"] = "Latvia",
	["LY"] = "Libyan Arab Jamahiriya",
	["MA"] = "Morocco",
	["MC"] = "Monaco",
	["MD"] = "Moldova, Republic of",
	["ME"] = "Montenegro",
	["MF"] = "Saint Martin",
	["MG"] = "Madagascar",
	["MH"] = "Marshall Islands",
	["MK"] = "Macedonia",
	["ML"] = "Mali",
	["MM"] = "Myanmar",
	["MN"] = "Mongolia",
	["MO"] = "Macao",
	["MP"] = "Northern Mariana Islands",
	["MQ"] = "Martinique",
	["MR"] = "Mauritania",
	["MS"] = "Montserrat",
	["MT"] = "Malta",
	["MU"] = "Mauritius",
	["MV"] = "Maldives",
	["MW"] = "Malawi",
	["MX"] = "Mexico",
	["MY"] = "Malaysia",
	["MZ"] = "Mozambique",
	["NA"] = "Namibia",
	["NC"] = "New Caledonia",
	["NE"] = "Niger",
	["NF"] = "Norfolk Island",
	["NG"] = "Nigeria",
	["NI"] = "Nicaragua",
	["NL"] = "Netherlands",
	["NO"] = "Norway",
	["NP"] = "Nepal",
	["NR"] = "Nauru",
	["NU"] = "Niue",
	["NZ"] = "New Zealand",
	["OM"] = "Oman",
	["PA"] = "Panama",
	["PE"] = "Peru",
	["PF"] = "French Polynesia",
	["PG"] = "Papua New Guinea",
	["PH"] = "Philippines",
	["PK"] = "Pakistan",
	["PL"] = "Poland",
	["PM"] = "Saint Pierre and Miquelon",
	["PN"] = "Pitcairn",
	["PR"] = "Puerto Rico",
	["PS"] = "Palestinian Territory",
	["PT"] = "Portugal",
	["PW"] = "Palau",
	["PY"] = "Paraguay",
	["QA"] = "Qatar",
	["RE"] = "Reunion",
	["RO"] = "Romania",
	["RS"] = "Serbia",
	["RU"] = "Russian Federation",
	["RW"] = "Rwanda",
	["SA"] = "Saudi Arabia",
	["SB"] = "Solomon Islands",
	["SC"] = "Seychelles",
	["SD"] = "Sudan",
	["SE"] = "Sweden",
	["SG"] = "Singapore",
	["SH"] = "Saint Helena",
	["SI"] = "Slovenia",
	["SJ"] = "Svalbard and Jan Mayen",
	["SK"] = "Slovakia",
	["SL"] = "Sierra Leone",
	["SM"] = "San Marino",
	["SN"] = "Senegal",
	["SO"] = "Somalia",
	["SR"] = "Suriname",
	["SS"] = "South Sudan",
	["ST"] = "Sao Tome and Principe",
	["SV"] = "El Salvador",
	["SX"] = "Sint Maarten",
	["SY"] = "Syrian Arab Republic",
	["SZ"] = "Swaziland",
	["TC"] = "Turks and Caicos Islands",
	["TD"] = "Chad",
	["TF"] = "French Southern Territories",
	["TG"] = "Togo",
	["TH"] = "Thailand",
	["TJ"] = "Tajikistan",
	["TK"] = "Tokelau",
	["TL"] = "Timor-Leste",
	["TM"] = "Turkmenistan",
	["TN"] = "Tunisia",
	["TO"] = "Tonga",
	["TR"] = "Turkey",
	["TT"] = "Trinidad and Tobago",
	["TV"] = "Tuvalu",
	["TW"] = "Taiwan",
	["TZ"] = "Tanzania, United Republic of",
	["UA"] = "Ukraine",
	["UG"] = "Uganda",
	["UM"] = "United States Minor Outlying Islands",
	["US"] = "United States",
	["UY"] = "Uruguay",
	["UZ"] = "Uzbekistan",
	["VA"] = "Holy See (Vatican City State)",
	["VC"] = "Saint Vincent and the Grenadines",
	["VE"] = "Venezuela",
	["VG"] = "Virgin Islands, British",
	["VI"] = "Virgin Islands, U.S.",
	["VN"] = "Vietnam",
	["VU"] = "Vanuatu",
	["WF"] = "Wallis and Futuna",
	["WS"] = "Samoa",
	["YE"] = "Yemen",
	["YT"] = "Mayotte",
	["ZA"] = "South Africa",
	["ZM"] = "Zambia",
	["ZW"] = "Zimbabwe"
}

---------------------------------------------------------------------
-- country names by code table <<
---------------------------------------------------------------------

table_lang = {}
table_resp = {}
table_rcnn = {}
table_faau = {}
table_code = {}
table_room = {}
table_chat = {}
table_mode = {}
table_igag = {}
table_cgag = {}
table_voki = {}
table_flod = {}
table_opks = {}
table_usup = {}
table_cust = {}
table_ctmb = {}
table_regm = {}
table_blst = {}
table_prfl = {["ctm"] = {}}

---------------------------------------------------------------------
-- global storage variables and tables <<
---------------------------------------------------------------------

---------------------------------------------------------------------
-- backward compatibility >>
---------------------------------------------------------------------

if not table.getn then -- lua 5.2.x no longer supports table.getn
	table.getn = function (t)
		local c = 0

		for _, _ in pairs (t) do
			c = c + 1
		end

		return c
	end
end

---------------------------------------------------------------------
-- backward compatibility <<
---------------------------------------------------------------------

---------------------------------------------------------------------
-- verlihub event functions >>
---------------------------------------------------------------------

function Main (file)
	table_othsets ["locked"] = loadcomponents ()

	if table_othsets ["locked"] == true then
		return 1
	end

	-- set up operator and user triggers

	local optrig = getconfig ("cmd_start_op")
	table_othsets ["optrig"] = "["

	for pos = 1, string.len (optrig) do
		table_othsets ["optrig"] = table_othsets ["optrig"] .. "%" .. string.sub (optrig, pos, pos)
	end

	table_othsets ["optrig"] = table_othsets ["optrig"] .. "]"

	local ustrig = getconfig ("cmd_start_user")
	table_othsets ["ustrig"] = "["

	for pos = 1, string.len (ustrig) do
		table_othsets ["ustrig"] = table_othsets ["ustrig"] .. "%" .. string.sub (ustrig, pos, pos)
	end

	table_othsets ["ustrig"] = table_othsets ["ustrig"] .. "]"

	-- update tables according to old version number

	local old = true
	local _, rows = VH:SQLQuery ("select `count` from `" .. tbl_sql ["stat"] .. "` where `type` = 'ver_ledo' limit 1")

	if rows > 0 then
		local _, ver = VH:SQLFetch (0)

		if ver and type (ver) == "string" and string.len (ver) == 5 then
			local _, _, a, b, c = string.find (ver, "^(%d)%.(%d)%.(%d)$")

			if a and b and c then
				ver = tonumber (a .. b .. c)

				if ver and ver > 274 then -- new style since 2.7.5
					if ver <= 275 then
						VH:SQLQuery ("create table if not exists `" .. tbl_sql ["misup"] .. "` (`supports` varchar(255) not null, `time` varchar(10) not null, `occurred` bigint(20) unsigned not null default 0, primary key (`supports`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
						VH:SQLQuery ("create table if not exists `" .. tbl_sql ["miver"] .. "` (`version` varchar(255) not null, `time` varchar(10) not null, `occurred` bigint(20) unsigned not null default 0, primary key (`version`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

						VH:SQLQuery ("alter ignore table `" .. tbl_sql ["anti"] .. "` change column `action` `action` tinyint(2) unsigned not null default 0")

						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["conf"] .. "` (`variable`, `value`) values ('useripsupport', '" .. repsqlchars (table_sets ["useripsupport"]) .. "')")
						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["conf"] .. "` (`variable`, `value`) values ('histautonewlinedel', '" .. repsqlchars (table_sets ["histautonewlinedel"]) .. "')")
						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["conf"] .. "` (`variable`, `value`) values ('unkbeforelogin', '" .. repsqlchars (table_sets ["unkbeforelogin"]) .. "')")
						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["conf"] .. "` (`variable`, `value`) values ('michsup', '" .. repsqlchars (table_sets ["michsup"]) .. "')")
						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["conf"] .. "` (`variable`, `value`) values ('michver', '" .. repsqlchars (table_sets ["michver"]) .. "')")
						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["conf"] .. "` (`variable`, `value`) values ('misupmessage', '" .. repsqlchars (table_sets ["misupmessage"]) .. "')")
						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["conf"] .. "` (`variable`, `value`) values ('mivermessage', '" .. repsqlchars (table_sets ["mivermessage"]) .. "')")
					end

					if ver <= 276 then
						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["ledocmd"] .. "` (`original`, `new`) values ('" .. repsqlchars ("dropip") .. "', '" .. repsqlchars (table_cmnds ["dropip"]) .. "')")
						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["ledocmd"] .. "` (`original`, `new`) values ('" .. repsqlchars ("citylive") .. "', '" .. repsqlchars (table_cmnds ["citylive"]) .. "')")
						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["ledocmd"] .. "` (`original`, `new`) values ('" .. repsqlchars ("ipinfo") .. "', '" .. repsqlchars (table_cmnds ["ipinfo"]) .. "')")

						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["conf"] .. "` (`variable`, `value`) values ('mchistclass', '" .. repsqlchars (table_sets ["mchistclass"]) .. "')")
						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["conf"] .. "` (`variable`, `value`) values ('classnotirepl', '" .. repsqlchars (table_sets ["classnotirepl"]) .. "')")
						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["conf"] .. "` (`variable`, `value`) values ('miclonekicktime', '" .. repsqlchars (table_sets ["miclonekicktime"]) .. "')")
					end

					if ver <= 277 then
						VH:SQLQuery ("create table if not exists `" .. tbl_sql ["rcmenu"] .. "` (`id` bigint(20) unsigned not null auto_increment primary key, `menu` varchar(255) not null, `command` varchar(255) not null, `type` tinyint(3) unsigned not null default 1, `cont` tinyint(2) unsigned not null default 3, `order` smallint(5) unsigned not null default 0, `minclass` tinyint(2) unsigned not null default 0, `maxclass` tinyint(2) unsigned not null default 10) engine = myisam default character set utf8 collate utf8_unicode_ci")

						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["conf"] .. "` (`variable`, `value`) values ('antibelowclass', '" .. repsqlchars (table_sets ["antibelowclass"]) .. "')")
						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["conf"] .. "` (`variable`, `value`) values ('longdateformat', '" .. repsqlchars (table_sets ["longdateformat"]) .. "')")
						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["conf"] .. "` (`variable`, `value`) values ('instrcmenu', '" .. repsqlchars (table_sets ["instrcmenu"]) .. "')")

						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["ledocmd"] .. "` (`original`, `new`) values ('" .. repsqlchars ("rcmenuadd") .. "', '" .. repsqlchars (table_cmnds ["rcmenuadd"]) .. "')")
						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["ledocmd"] .. "` (`original`, `new`) values ('" .. repsqlchars ("rcmenudel") .. "', '" .. repsqlchars (table_cmnds ["rcmenudel"]) .. "')")
						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["ledocmd"] .. "` (`original`, `new`) values ('" .. repsqlchars ("rcmenulist") .. "', '" .. repsqlchars (table_cmnds ["rcmenulist"]) .. "')")
						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["ledocmd"] .. "` (`original`, `new`) values ('" .. repsqlchars ("rcmenuord") .. "', '" .. repsqlchars (table_cmnds ["rcmenuord"]) .. "')")
					end

					if ver <= 278 then
						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["ledocmd"] .. "` (`original`, `new`) values ('" .. repsqlchars ("votekick") .. "', '" .. repsqlchars (table_cmnds ["votekick"]) .. "')")

						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["conf"] .. "` (`variable`, `value`) values ('votekickclass', '" .. repsqlchars (table_sets ["votekickclass"]) .. "')")
						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["conf"] .. "` (`variable`, `value`) values ('votekickcount', '" .. repsqlchars (table_sets ["votekickcount"]) .. "')")
						VH:SQLQuery ("insert ignore into `" .. tbl_sql ["conf"] .. "` (`variable`, `value`) values ('protofloodctmact', '" .. repsqlchars (table_sets ["protofloodctmact"]) .. "')")
					end

					if ver <= 279 then
						-- todo
					end

					-- and so on

					old = false -- update version
					local tm = os.time () + table_sets ["srvtimediff"]
					VH:SQLQuery ("insert into `" .. tbl_sql ["stat"] .. "` (`type`, `time`, `count`) values ('ver_ledo', " .. tm .. ", '" .. ver_ledo .. "') on duplicate key update `time` = " .. tm .. ", `count` = '" .. ver_ledo .. "'")
				end
			end
		end
	end

	if old == true then -- old style or fresh install
		renametables ()
		createtables ()
		altertables ()
		createsettings ()
	end

	loadsettings ()
	loadlangfile (nil, nil)

	table_othsets ["botnick"] = getconfig ("hub_security")
	table_othsets ["opchatnick"] = getconfig ("opchat_name")

	if table_sets ["addledobot"] == 1 then
		addhubrobot (table_sets ["ledobotnick"], table_othsets ["ledobotdesc"]..table_othsets ["ledobottag"], 2, table_sets ["ledobotmail"], getownsize (true, table_sets ["ledobotsize"]))

		if table_sets ["useextrafeed"] == 1 then
			table_othsets ["feednick"] = table_sets ["extrafeednick"]
		else
			table_othsets ["feednick"] = table_sets ["ledobotnick"]
		end

		table_othsets ["sendfrom"] = table_sets ["ledobotnick"]
	else
		if table_sets ["useextrafeed"] == 1 then
			table_othsets ["feednick"] = table_sets ["extrafeednick"]
		else
			table_othsets ["feednick"] = table_othsets ["opchatnick"]
		end

		table_othsets ["sendfrom"] = table_othsets ["botnick"]
	end

	if table_sets ["chatrunning"] == 1 then
		installchatrooms ()
	end

	if table_sets ["timebotint"] > 0 then
		installtimebot ()
	end

	--if lsock and (table_sets ["hublistpingint"] > 0) then -- hublist pinger
		--hublistping ()
	--end

	local ulim = getulimit () -- ulimit warning

	if ulim then
		local umax = getconfig ("max_users")

		if ulim < umax then
			VH:SendDataToAll ("<"..table_othsets ["sendfrom"].."> "..string.format (getlang (766), string.format (getlang (767), ulim, umax, "ulimit -n", umax)).."|", 5, 10)
		end
	end

	if table_sets ["addspecialver"] == 1 then -- special version
		VH:SetConfig ("config", "hub_version_special", string.format (getlang (765), "Ledokol "..ver_ledo))
	end

	math.randomseed (os.time ()) -- randomize
	return 1
end

----- ---- --- -- -

function UnLoad ()
	if table_othsets ["locked"] == true then
		return 1
	end

	if table_othsets ["restart"] == true then -- restart mode
		return 1
	end

	resetcustnicks ()

	if table_sets ["chatrunning"] == 1 then
		uninstallchatrooms ()
	end

	if table_sets ["ccroomrunning"] == 1 then
		uninstallccrooms ()
	end

	if (table_sets ["timebotint"] > 0) and table_othsets ["lasttimenick"] then
		if table_sets ["fasttimebot"] == 1 then
			VH:SendDataToAll ("$Quit "..table_othsets ["lasttimenick"].."|", 0, 10)
		else
			delhubrobot (table_othsets ["lasttimenick"])
		end
	end

	if table_sets ["addledobot"] == 1 then
		delhubrobot (table_sets ["ledobotnick"])
	end

	return 1
end

----- ---- --- -- -

function VH_OnNewConn (ip)
	if table_othsets ["locked"] == true then return 1 end

	if table_sets ["enablehardban"] == 1 then -- hard ban
		if checkhban (ip) == true then return 0 end
	end

	if table_sets ["useblacklist"] == 1 then -- blacklist
		if checkblacklist (ip) == true then return 0 end
	end

	return 1
end

----- ---- --- -- -

function VH_OnCloseConn (ip, nick)
	--if table_othsets ["locked"] == true then
		--return 1
	--end

	--if table_othsets ["restart"] == true then -- restart mode
		--return 1
	--end

	return 1
end

----- ---- --- -- -

function VH_OnOperatorCommand (nick, data)
	if table_othsets ["locked"] then
		return 1
	end

	local ucl = getclass (nick)

	if ucl < 3 then
		return 0
	end

	if checkcmd (nick, ucl, data) == 0 then -- command permissions
		return 0
	end

	savecmdlog (nick, ucl, data, true) -- command logger

	----- ---- --- -- -

	if string.find (data, "^" .. table_othsets ["optrig"] .. "kick%s+%S+%s*.*$") then
		if table_sets ["classnotikick"] == 11 then
			donotifycmd (nick, data, 0, ucl)
		end

	----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["chatadd"].." %S+ .* %d+ %d+ %S+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			addchatroom (nick, string.sub (data, string.len (table_cmnds ["chatadd"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["chatdel"].." %S+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			delchatroom (nick, string.sub (data, string.len (table_cmnds ["chatdel"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["chatlist"].."$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			listchatroom (nick)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["remadd"].." %S+ .+ %d+ %d+ %d %d+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
addreminder (nick, string.sub (data, string.len (table_cmnds ["remadd"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["remdel"].." %S+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
delreminder (nick, string.sub (data, string.len (table_cmnds ["remdel"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["remlist"].."$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
listreminder (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["remshow"].." %S+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
showreminder (nick, string.sub (data, string.len (table_cmnds ["remshow"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["nopmadd"].." %S+ %d %d+ .+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			addnopm (nick, string.sub (data, string.len (table_cmnds ["nopmadd"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["nopmdel"].." %S+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			delnopm (nick, string.sub (data, string.len (table_cmnds ["nopmdel"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["nopmlist"].."$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			listnopm (nick)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["rcmenuadd"] .. " \".+\" \".*\" %d+ %d+ %d+ %d+ %d+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			addrcmenu (nick, data:sub (# table_cmnds ["rcmenuadd"] + 3))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["rcmenudel"] .. " %d+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			delrcmenu (nick, data:sub (# table_cmnds ["rcmenudel"] + 3))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["rcmenulist"] .. "$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			listrcmenu (nick)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["rcmenuord"] .. " %d+ %d+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			ordrcmenu (nick, data:sub (# table_cmnds ["rcmenuord"] + 3))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["ipwatadd"].." %S+ \".+\" %d$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			addipwat (nick, string.sub (data, string.len (table_cmnds ["ipwatadd"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["ipwatdel"].." %S+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			delipwat (nick, string.sub (data, string.len (table_cmnds ["ipwatdel"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["ipwatlist"].."$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			listipwat (nick)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["hban"].." .+ \".+\"$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			addhban (nick, string.sub (data, string.len (table_cmnds ["hban"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["hunban"].." %S+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			delhban (nick, string.sub (data, string.len (table_cmnds ["hunban"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["hbans"].."$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			listhban (nick)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["newsadd"].." .+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
addnews (nick, string.sub (data, string.len (table_cmnds ["newsadd"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["newsdel"].." .+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
delnews (nick, string.sub (data, string.len (table_cmnds ["newsdel"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["reladd"].." \".+\" \".+\"$") or string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["reladd"].." \".+\" \".+\" %S+$") then
		if ucl >= table_sets ["relmodclass"] then
			donotifycmd (nick, data, 0, ucl)
			addrelease (nick, string.sub (data, string.len (table_cmnds ["reladd"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["reldel"].." %S+ .+$") then
		if ucl >= table_sets ["relmodclass"] then
			donotifycmd (nick, data, 0, ucl)
			delrelease (nick, string.sub (data, string.len (table_cmnds ["reldel"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["respadd"].." \".+\" \".+\" %d+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			addresponder (nick, string.sub (data, string.len (table_cmnds ["respadd"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["respdel"].." %d+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			delresponder (nick, string.sub (data, string.len (table_cmnds ["respdel"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["resplist"].."$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			listresponder (nick)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["respexadd"].." %S+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			addrespex (nick, string.sub (data, string.len (table_cmnds ["respexadd"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["respexdel"].." %S+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			delrespex (nick, string.sub (data, string.len (table_cmnds ["respexdel"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["respexlist"].."$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			listrespex (nick)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["repladd"].." \".+\" \".+\" %d+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			addreplacer (nick, string.sub (data, string.len (table_cmnds ["repladd"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["repldel"].." %d+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			delreplacer (nick, string.sub (data, string.len (table_cmnds ["repldel"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["repllist"].."$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			listreplacer (nick)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["replexadd"].." %S+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			addreplex (nick, string.sub (data, string.len (table_cmnds ["replexadd"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["replexdel"].." %S+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			delreplex (nick, string.sub (data, string.len (table_cmnds ["replexdel"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["replexlist"].."$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			listreplex (nick)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["antiadd"] .. " .+ %d %d+ %d$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			addantientry (nick, string.sub (data, string.len (table_cmnds ["antiadd"]) + 3))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["antidel"].." .+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
delantientry (nick, string.sub (data, string.len (table_cmnds ["antidel"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["antilist"].."$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
listantientry (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["antiexadd"].." .+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
addexentry (nick, string.sub (data, string.len (table_cmnds ["antiexadd"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["antiexdel"].." .+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
delexentry (nick, string.sub (data, string.len (table_cmnds ["antiexdel"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["antiexlist"].."$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
listexentry (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["sefiadd"].." .+ %d %d %d$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
addsefientry (nick, string.sub (data, string.len (table_cmnds ["sefiadd"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["sefidel"].." .+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
delsefientry (nick, string.sub (data, string.len (table_cmnds ["sefidel"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["sefilist"].."$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
listsefientry (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["sefiexadd"].." .+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
addsefiexentry (nick, string.sub (data, string.len (table_cmnds ["sefiexadd"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["sefiexdel"].." .+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
delsefiexentry (nick, string.sub (data, string.len (table_cmnds ["sefiexdel"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["sefiexlist"].."$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
listsefiexentry (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["cmndset"].." %S+ %S+$") then
if ucl >= table_sets ["mincommandclass"] then
setledocmd (nick, ucl, string.sub (data, string.len (table_cmnds ["cmndset"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["cmndreset"].."$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
resetledocmd (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["cmndshow"].."$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
showledocmd (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["cmndadd"].." .+ %d+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
addcmdentry (nick, string.sub (data, string.len (table_cmnds ["cmndadd"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["cmnddel"].." .+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
delcmdentry (nick, string.sub (data, string.len (table_cmnds ["cmnddel"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["cmndlist"].."$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
listcmdentry (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["cmndexadd"].." .+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
addcmdexentry (nick, string.sub (data, string.len (table_cmnds ["cmndexadd"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["cmndexdel"].." .+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
delcmdexentry (nick, string.sub (data, string.len (table_cmnds ["cmndexdel"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["cmndexlist"].."$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
listcmdexentry (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["authadd"].." %S+ .+$") then
	if ucl >= table_sets ["mincommandclass"] then
		donotifycmd (nick, data, 0, ucl)
		addauthentry (nick, string.sub (data, string.len (table_cmnds ["authadd"]) + 3, -1))
	else
		commandanswer (nick, getlang (128))
	end

	return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["authmod"].." %d+ .+$") then
	if ucl >= table_sets ["mincommandclass"] then
		donotifycmd (nick, data, 0, ucl)
		modauthentry (nick, string.sub (data, string.len (table_cmnds ["authmod"]) + 3, -1))
	else
		commandanswer (nick, getlang (128))
	end

	return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["authdel"].." %d+$") then
	if ucl >= table_sets ["mincommandclass"] then
		donotifycmd (nick, data, 0, ucl)
		delauthentry (nick, string.sub (data, string.len (table_cmnds ["authdel"]) + 3, -1))
	else
		commandanswer (nick, getlang (128))
	end

	return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["authlist"].."$") then
	if ucl >= table_sets ["mincommandclass"] then
		donotifycmd (nick, data, 0, ucl)
		listauthentry (nick)
	else
		commandanswer (nick, getlang (128))
	end

	return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["wmforce"].." %S+ %S+ .+$") or string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["wmforce"].." %S+ %S+$") then
if ucl >= table_sets ["mincommandclass"] then
if table_sets ["classnotiwelcome"] == 11 then
donotifycmd (nick, data, 0, ucl)
end

forcewelcome (nick, string.sub (data, string.len (table_cmnds ["wmforce"]) + 3, -1), ucl)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["wmlist"].."$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
listwelcome (nick)
else
commandanswer (nick, getlang (128))
end

return 0

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["myhistory"] .. " %d+$") then
		if (ucl >= table_sets ["mchistclass"]) and (table_sets ["histlimit"] > 0) then
			donotifycmd (nick, data, 0, ucl)
			sendownhistory (nick, string.sub (data, string.len (table_cmnds ["myhistory"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["history"] .. " %d+$") then
		if (ucl >= table_sets ["mchistclass"]) and (table_sets ["histlimit"] > 0) then
			donotifycmd (nick, data, 0, ucl)
			sendmchistory (nick, string.sub (data, string.len (table_cmnds ["history"]) + 3, -1), 0)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["hubnews"].." %d+$") then
		if ucl >= table_sets ["newsclass"] then
			donotifycmd (nick, data, 0, ucl)
			sendnews (nick, string.sub (data, string.len (table_cmnds ["hubnews"]) + 3, -1), 0)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["calculate"].." %S+ %S %S+$") then
if ucl >= table_sets ["minusrcommandclass"] then
donotifycmd (nick, data, 0, ucl)
calculate (nick, string.sub (data, string.len (table_cmnds ["calculate"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["showtopic"].."$") then
if ucl >= table_sets ["minusrcommandclass"] then
donotifycmd (nick, data, 0, ucl)
sendtopic (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["offmsg"].." %S+ .+$") then
if ucl >= table_sets ["offmsgclass"] then
sendoffmsg (nick, string.sub (data, string.len (table_cmnds ["offmsg"]) + 3, -1), ucl)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["custlist"].."$") then
		if table_sets ["custnickclass"] < 11 then
			donotifycmd (nick, data, 0, ucl)
			listcustnick (nick)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["realnick"].." %S+$") then
		if table_sets ["custnickclass"] < 11 then
			donotifycmd (nick, data, 0, ucl)
			getrealnick (nick, string.sub (data, string.len (table_cmnds ["realnick"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["nick"].."$") or string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["nick"].." .+$") then
		if ucl >= table_sets ["custnickclass"] then
			setcustnick (nick, string.sub (data, string.len (table_cmnds ["nick"]) + 3, -1), ucl)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["wmshow"].."$") then
if ucl >= table_sets ["welcomeclass"] then
donotifycmd (nick, data, 0, ucl)
showwelcome (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["wmset"].." %S+ .+$") or string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["wmset"].." %S+$") then
if ucl >= table_sets ["welcomeclass"] then
if table_sets ["classnotiwelcome"] == 11 then
donotifycmd (nick, data, 0, ucl)
end

setwelcome (nick, string.sub (data, string.len (table_cmnds ["wmset"]) + 3, -1), ucl)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["relfind"].." .+$") then
		if ucl >= table_sets ["minusrcommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			findrelease (nick, string.sub (data, string.len (table_cmnds ["relfind"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["rellist"].." %S+ %d+$") or string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["rellist"].." %S+ %d+ .+$") then
		if ucl >= table_sets ["minusrcommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			listrelease (nick, string.sub (data, string.len (table_cmnds ["rellist"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["wordranks"].."$") then
if ucl >= table_sets ["wordrankclass"] then
donotifycmd (nick, data, 0, ucl)
wordranksendall (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["searranks"].."$") then
	if ucl >= table_sets ["searrankclass"] then
		donotifycmd (nick, data, 0, ucl)
		searranksendall (nick)
	else
		commandanswer (nick, getlang (128))
	end

	return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["cclive"].."$") then
if ucl >= table_sets ["ccstatsclass"] then
donotifycmd (nick, data, 0, ucl)
sendlivecc (nick)
else
commandanswer (nick, getlang (128))
end

return 0

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["citylive"] .. " [%a%d]+$") then
		if ucl >= table_sets ["ccstatsclass"] then
			donotifycmd (nick, data, 0, ucl)
			sendlivecity (nick, string.sub (data, string.len (table_cmnds ["citylive"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

	return 0

	----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["cchist"].."$") then
if (table_sets ["savecchistory"] == 1) and (ucl >= table_sets ["ccstatsclass"]) then
donotifycmd (nick, data, 0, ucl)
sendhistcc (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["opranks"].."$") then
if ucl >= table_sets ["oprankclass"] then
donotifycmd (nick, data, 0, ucl)
opranksendall (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["shareranks"].."$") then
if ucl >= table_sets ["sharerankclass"] then
donotifycmd (nick, data, 0, ucl)
shareranksendall (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["chatranks"].."$") then
if ucl >= table_sets ["chatrankclass"] then
donotifycmd (nick, data, 0, ucl)
chatranksendall (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["mysharerank"].."$") then
if ucl >= table_sets ["sharerankclass"] then
donotifycmd (nick, data, 0, ucl)
shareranksendown (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["mychatrank"].."$") then
if ucl >= table_sets ["chatrankclass"] then
donotifycmd (nick, data, 0, ucl)
chatranksendown (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["ulog"] .. " %S+ .+ %d+$") then
		if (ucl >= table_sets ["mincommandclass"]) and (table_sets ["enableuserlog"] == 1) then
			donotifycmd (nick, data, 0, ucl)
			showuserlog (nick, string.sub (data, string.len (table_cmnds ["ulog"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["clog"].." %d+$") then
	if (ucl >= table_sets ["mincommandclass"]) and (table_sets ["enablecmdlog"] > 0) then
		donotifycmd (nick, data, 0, ucl)
		showcmdlog (nick, ucl, string.sub (data, string.len (table_cmnds ["clog"]) + 3, -1))
	else
		commandanswer (nick, getlang (128))
	end

	return 0

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["userinfo"] .. " %S+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			showuserinfo (nick, string.sub (data, string.len (table_cmnds ["userinfo"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["ipinfo"] .. " %d+%.%d+%.%d+%.%d+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			showipinfo (nick, string.sub (data, string.len (table_cmnds ["ipinfo"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["seen"].." %S+$") then
	if ucl >= table_sets ["mincommandclass"] then
		donotifycmd (nick, data, 0, ucl)
		seenlookup (nick, string.sub (data, string.len (table_cmnds ["seen"]) + 3, -1))
	else
		commandanswer (nick, getlang (128))
	end

	return 0

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["dropip"] .. " %d+%.%d+%.%d+%.%d+$") then
		if ucl >= table_sets ["mincommandclass"] then
			dropip (nick, string.sub (data, string.len (table_cmnds ["dropip"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["gagipadd"] .. " %S+ %d$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			gagipadd (nick, string.sub (data, string.len (table_cmnds ["gagipadd"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["gagipdel"] .. " %S+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			gagipdel (nick, string.sub (data, string.len (table_cmnds ["gagipdel"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["gagiplist"] .. "$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			gagiplist (nick)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["gagccadd"].." [%a%-][%a%d%-] %d$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			gagccadd (nick, string.sub (data, string.len (table_cmnds ["gagccadd"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["gagccdel"].." [%a%d%-%*]+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			gagccdel (nick, string.sub (data, string.len (table_cmnds ["gagccdel"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["gagcclist"].."$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			gagcclist (nick)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["wmdel"].." %S+$") then
if ucl >= table_sets ["mincommandclass"] then
if table_sets ["classnotiwelcome"] == 11 then
donotifycmd (nick, data, 0, ucl)
end

delwelcome (nick, string.sub (data, string.len (table_cmnds ["wmdel"]) + 3, -1), ucl)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["hubadd"].." %S+ \".+\" \".*\"$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
hublistadd (nick, string.sub (data, string.len (table_cmnds ["hubadd"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["hubdel"].." %S+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
hublistdel (nick, string.sub (data, string.len (table_cmnds ["hubdel"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["showhubs"].."$") then
if ucl >= table_sets ["minusrcommandclass"] then
donotifycmd (nick, data, 0, ucl)
hublistshow (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["regname"].." %S+ %S+$") then
if ucl >= table_sets ["mincommandclass"] then
	if getconfig ("use_reglist_cache") == 1 then -- reglist cache is on
		commandanswer (nick, string.format (getlang (218), "use_reglist_cache", "0"))
	else
		if table_sets ["classnotireg"] == 11 then
			donotifycmd (nick, data, 0, ucl)
		end

		namereg (nick, string.sub (data, string.len (table_cmnds ["regname"]) + 3, -1), ucl)
	end

else
	commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["reglist"].." %d+ %d+x%d+$") or string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["reglist"].." %-%d %d+x%d+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
sendreglist (nick, string.sub (data, string.len (table_cmnds ["reglist"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["regfind"].." %S+$") then
	if ucl >= table_sets ["mincommandclass"] then
		donotifycmd (nick, data, 0, ucl)
		findreglist (nick, string.sub (data, string.len (table_cmnds ["regfind"]) + 3, -1))
	else
		commandanswer (nick, getlang (128))
	end

return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["regstats"].."$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			statsreglist (nick)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["readlog"].." %S+ %d+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
logsread (nick, string.sub (data, string.len (table_cmnds ["readlog"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["randel"].." %S+ %S+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
delrank (nick, string.sub (data, string.len (table_cmnds ["randel"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["ranexadd"].." %S+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
addrankex (nick, string.sub (data, string.len (table_cmnds ["ranexadd"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["ranexdel"].." %S+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
delrankex (nick, string.sub (data, string.len (table_cmnds ["ranexdel"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["ranexlist"].."$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
listrankex (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["ranclean"].." %S+ %d+$") then
if ucl >= table_sets ["mincommandclass"] then
if table_sets ["classnotiledoact"] == 11 then
donotifycmd (nick, data, 0, ucl)
end

cleanupranks (nick, string.sub (data, string.len (table_cmnds ["ranclean"]) + 3, -1), ucl)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["myoprank"].."$") then
if ucl >= table_sets ["oprankclass"] then
donotifycmd (nick, data, 0, ucl)
opranksendown (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["say"].." %S* .*$") then
if ucl >= table_sets ["sayclass"] then
if table_sets ["classnotisay"] == 11 then
donotifycmd (nick, data, 0, ucl)
end

sendsay (nick, string.sub (data, string.len (table_cmnds ["say"]) + 3, -1), ucl)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["clear"].."$") then
		if ucl >= table_sets ["clearclass"] then
			donotifycmd (nick, data, 0, ucl)
			VH:SendDataToAll ("<"..table_othsets ["sendfrom"].."> "..string.rep ("\r\n", 100).." ~ "..string.format (getlang (685), nick).." ~\r\n|", 0, 10)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["mode"].." .+ %S+$") then
	if ucl >= table_sets ["chatmodeclass"] then
		donotifycmd (nick, data, 0, ucl)
		setmode (nick, string.sub (data, string.len (table_cmnds ["mode"]) + 3, -1))
	else
		commandanswer (nick, getlang (128))
	end

	return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["mode"].." %S+$") then
	if ucl >= table_sets ["chatmodeclass"] then
		donotifycmd (nick, data, 0, ucl)
		setmode (nick, reppatchars (tolow (nick)).." "..string.sub (data, string.len (table_cmnds ["mode"]) + 3, -1))
	else
		commandanswer (nick, getlang (128))
	end

	return 0

----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["votekick"] .. " %S+$") then
		if ucl >= table_sets ["votekickclass"] then
			-- donotifycmd (nick, data, 0, ucl)
			votekickuser (nick, string.sub (data, string.len (table_cmnds ["votekick"]) + 3))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["mode"].."$") then
	if ucl >= table_sets ["chatmodeclass"] then
		donotifycmd (nick, data, 0, ucl)
		listmodes (nick)
	else
		commandanswer (nick, getlang (128))
	end

	return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["ledohelp"].."$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
sendhelp (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["ledostats"].."$") then
	if ucl >= table_sets ["mincommandclass"] then
		donotifycmd (nick, data, 0, ucl)
		sendstats (nick)
	else
		commandanswer (nick, getlang (128))
	end

	return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["ledover"].."$") then
	if ucl >= table_sets ["mincommandclass"] then
		donotifycmd (nick, data, 0, ucl)
		updatescript (nick)
	else
		commandanswer (nick, getlang (128))
	end

	return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["ledokoluninstallisconfirmed"].."$") then

-- dont use it unless you know what it does, you can fuck up all ledokol tables in one step
-- this action completely deletes all ledokol tables and files, and locks the script

	if ucl == 10 then
		table_othsets ["locked"] = true -- lock the script
		donotifycmd (nick, data, 10, ucl)
		if table_sets ["chatrunning"] == 1 then uninstallchatrooms () end
		if table_sets ["ccroomrunning"] == 1 then uninstallccrooms () end

		if (table_sets ["timebotint"] > 0) and table_othsets ["lasttimenick"] then
			if table_sets ["fasttimebot"] == 1 then
				VH:SendDataToAll ("$Quit "..table_othsets ["lasttimenick"].."|", 0, 10)
			else
				delhubrobot (table_othsets ["lasttimenick"])
			end

			table_othsets ["lasttimenick"] = nil
		end

		if table_sets ["addledobot"] == 1 then
			delhubrobot (table_sets ["ledobotnick"])
		end

		if table_sets ["addspecialver"] == 1 then
			VH:SetConfig ("config", "hub_version_special", "")
		end

		droptables () -- drop all tables
		local f = io.open (table_othsets ["cfgdir"].."scripts/ledokol.lua", "r") -- open script file

		if f then
			f:close ()
			os.remove (table_othsets ["cfgdir"].."scripts/ledokol.lua") -- delete script file
			os.remove (table_othsets ["cfgdir"].."scripts/ledo_en.txt") -- delete language files
			commandanswer (nick, getlang (428).." "..getlang (431).." "..getlang (430)) -- finish
		else
			commandanswer (nick, getlang (428).." "..getlang (429).." "..getlang (430)) -- finish
		end
	else
		commandanswer (nick, getlang (128))
	end

	return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["ledoset"].." %S+ .*$") then
if ucl >= table_sets ["mincommandclass"] then
if table_sets ["classnoticonfig"] == 11 then
donotifycmd (nick, data, 0, ucl)
end

setledoconf (nick, ucl, string.sub (data, string.len (table_cmnds ["ledoset"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["ledoconf"].."$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
showledoconf (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["ledosql"].." .+$") then

-- dont use it unless you know what it does, you can fuck up your hub database in one step
-- executes any text written after the command as mysql query
-- quotes and backslash characters in your query must be escaped with \ (not mysql syntax itself)

	if (getledoconf ("allow_sql") == 1) and (ucl == 10) then
		donotifycmd (nick, data, 10, ucl)
		local _, rows = VH:SQLQuery (repnmdcinchars (string.sub (data, string.len (table_cmnds ["ledosql"]) + 3, -1)))

		if rows > 0 then
			local anentry = ""

			for x = 0, rows - 1 do
				local res = { VH:SQLFetch (x) }
				anentry = anentry.." "..prezero (string.len (rows), (x + 1)).."."

				for k, v in pairs (res) do
					if k > 1 then
						anentry = anentry.."\t"..repnmdcoutchars (v or "NULL")
					end
				end

				anentry = anentry.."\r\n"
			end

			commandanswer (nick, getlang (305)..":\r\n\r\n"..anentry)
		else
			commandanswer (nick, getlang (282))
		end
	else
		commandanswer (nick, getlang (128))
	end

	return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["ledoshell"].." .+$") then

-- dont use it unless you know what it does, you can fuck up your operating system in one step
-- executes any text written after the command as system shell command

	if (getledoconf ("allow_shell") == 1) and (ucl == 10) then
		donotifycmd (nick, data, 10, ucl)
		local res, err = os.execute (repnmdcinchars (string.sub (data, string.len (table_cmnds ["ledoshell"]) + 3, -1)).." > \""..table_othsets ["cfgdir"]..table_othsets ["tmpfile"].."\" 2>&1")

		if res then
			local f = io.open (table_othsets ["cfgdir"]..table_othsets ["tmpfile"], "r")
			local o = ""

			if f then
				o = f:read ("*all")
				f:close ()
				os.remove (table_othsets ["cfgdir"]..table_othsets ["tmpfile"]) -- delete temporary file
			end

			if f and o and (string.len (o) > 0) then
				commandanswer (nick, getlang (534)..":\r\n\r\n"..repnmdcoutchars (o))
			else
				commandanswer (nick, getlang (533))
			end

			commandanswer (nick, string.format (getlang (308), res))
		else
			commandanswer (nick, string.format (getlang (307), (err or getlang (662))))
		end

	else
		commandanswer (nick, getlang (128))
	end

	return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["cleanup"].." %S+ %d+$") then
		if ucl >= table_sets ["mincommandclass"] then
			if table_sets ["classnotiledoact"] == 11 then
				donotifycmd (nick, data, 0, ucl)
			end

			cleanuptable (nick, string.sub (data, string.len (table_cmnds ["cleanup"]) + 3, -1), ucl)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["cleanup"] .. " %S+ [%d+%*] %d+$") or string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["cleanup"] .. " %S+ [%d+%*] %-%d$") then
		if ucl >= table_sets ["mincommandclass"] then
			if table_sets ["classnotiledoact"] == 11 then
				donotifycmd (nick, data, 0, ucl)
			end

			altcleanuptable (nick, string.sub (data, string.len (table_cmnds ["cleanup"]) + 3, -1), ucl)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["myinfadd"] .. " %S+ .+$")--[[ or string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["myinfadd"] .. " %S+ .+ %d+[%u%l]$")]] then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			addmyinfoentry (nick, string.sub (data, string.len (table_cmnds ["myinfadd"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["myinfdel"] .. " %S+ .+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			delmyinfoentry (nick, string.sub (data, string.len (table_cmnds ["myinfdel"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. table_cmnds ["myinflist"] .. " %S+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			listmyinfoentry (nick, string.sub (data, string.len (table_cmnds ["myinflist"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["protadd"].." .+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
addprotentry (nick, string.sub (data, string.len (table_cmnds ["protadd"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["protdel"].." .+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
delprotentry (nick, string.sub (data, string.len (table_cmnds ["protdel"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["protlist"].."$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
listprotentry (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["custdel"].." %S+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			opdelcustnick (nick, string.sub (data, string.len (table_cmnds ["custdel"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["rename"].." %S+ .+$") then
		if ucl >= table_sets ["mincommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			opforcecustnick (nick, string.sub (data, string.len (table_cmnds ["rename"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["offlist"].."$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
listoffline (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["offdel"].." .+$") then
if ucl >= table_sets ["mincommandclass"] then
donotifycmd (nick, data, 0, ucl)
deloffline (nick, string.sub (data, string.len (table_cmnds ["offdel"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["offclean"].."$") then
if ucl >= table_sets ["mincommandclass"] then
if table_sets ["classnotiledoact"] == 11 then
donotifycmd (nick, data, 0, ucl)
end

cleanoffline (nick, ucl)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["histclean"].."$") then
if ucl >= table_sets ["mincommandclass"] then
if table_sets ["classnotiledoact"] == 11 then
donotifycmd (nick, data, 0, ucl)
end

cleanhistory (nick, 0, 0, ucl)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["ophistory"].." %d+$") then
if (ucl >= 3) and (table_sets ["histlimit"] > 0) then
donotifycmd (nick, data, 0, ucl)
sendophistory (nick, string.sub (data, string.len (table_cmnds ["ophistory"]) + 3, -1), 0, false)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."topic$") or string.find (data, "^"..table_othsets ["optrig"].."hubtopic$") then
	savetopic (nil, nil, ucl)

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."topic .+$") then
	local tpc = string.sub (data, string.len ("topic") + 3, -1)

	if string.find (tpc, "&#124;") then
		commandanswer (nick, string.format (getlang (772), "&#124;"))
		return 0
	else
		savetopic (nick, tpc, ucl)
	end

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."hubtopic .+$") then
	local tpc = string.sub (data, string.len ("hubtopic") + 3, -1)

	if string.find (tpc, "&#124;") then
		commandanswer (nick, string.format (getlang (772), "&#124;"))
		return 0
	else
		savetopic (nick, tpc, ucl)
	end

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."topic $") or string.find (data, "^"..table_othsets ["optrig"].."hubtopic $") then
	if ucl >= getconfig ("topic_mod_class") then
		commandanswer (nick, getlang (55))
		return 0
	end

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."rn%s+%S+.*$") then
if table_sets ["classnotireg"] == 11 then
donotifycmd (nick, data, 0, ucl)
end

donotifyregnew (nick, ucl, string.sub (data, string.len ("rn") + 3, -1))

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."rnew%s+%S+.*$") then
if table_sets ["classnotireg"] == 11 then
donotifycmd (nick, data, 0, ucl)
end

donotifyregnew (nick, ucl, string.sub (data, string.len ("rnew") + 3, -1))

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."regnew%s+%S+.*$") then
if table_sets ["classnotireg"] == 11 then
donotifycmd (nick, data, 0, ucl)
end

donotifyregnew (nick, ucl, string.sub (data, string.len ("regnew") + 3, -1))

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."regn%s+%S+.*$") then
if table_sets ["classnotireg"] == 11 then
donotifycmd (nick, data, 0, ucl)
end

donotifyregnew (nick, ucl, string.sub (data, string.len ("regn") + 3, -1))

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."rdel%s+%S+.*$") then
if table_sets ["classnotireg"] == 11 then
donotifycmd (nick, data, 0, ucl)
end

donotifyregdel (nick, ucl, string.sub (data, string.len ("rdel") + 3, -1))

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."rdelete%s+%S+.*$") then
if table_sets ["classnotireg"] == 11 then
donotifycmd (nick, data, 0, ucl)
end

donotifyregdel (nick, ucl, string.sub (data, string.len ("rdelete") + 3, -1))

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."regdel%s+%S+.*$") then
if table_sets ["classnotireg"] == 11 then
donotifycmd (nick, data, 0, ucl)
end

donotifyregdel (nick, ucl, string.sub (data, string.len ("regdel") + 3, -1))

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."regdelete%s+%S+.*$") then
if table_sets ["classnotireg"] == 11 then
donotifycmd (nick, data, 0, ucl)
end

donotifyregdel (nick, ucl, string.sub (data, string.len ("regdelete") + 3, -1))

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."rclass%s+%S+%s+.+$") then
if table_sets ["classnotireg"] == 11 then
donotifycmd (nick, data, 0, ucl)
end

donotifyregclass (nick, ucl, string.sub (data, string.len ("rclass") + 3, -1))

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."regclass%s+%S+%s+.+$") then
if table_sets ["classnotireg"] == 11 then
donotifycmd (nick, data, 0, ucl)
end

donotifyregclass (nick, ucl, string.sub (data, string.len ("regclass") + 3, -1))

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. "ban") then -- ban%S*%s+%S+%s*.*$
		if table_sets ["classnotiban"] == 11 then
			donotifycmd (nick, data, 0, ucl)
		end

		--donotifyban (nick, ucl, data)

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. "unban") then -- unban%S*%s+%S+%s*.*$
		if table_sets ["classnotiban"] == 11 then
			donotifycmd (nick, data, 0, ucl)
		end

		--donotifyunban (nick, ucl, data)

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."set%s+%[%S+%]%s+%S+ .*$") then
	if ucl >= 5 then
		if table_sets ["classnoticonfig"] == 11 then
			donotifycmd (nick, data, 0, ucl)
		end

		donotifyextconfig (nick, string.sub (data, string.len ("set") + 3, -1), ucl)
	end

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."set%s+%S+ .*$") then
	if ucl >= 5 then
		sethubconf (string.sub (data, string.len ("set") + 3, -1))

		if table_sets ["classnoticonfig"] == 11 then
			donotifycmd (nick, data, 0, ucl)
		end

		donotifyconfig (nick, string.sub (data, string.len ("set") + 3, -1), ucl)
	end

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."=%s+%[%S+%]%s+%S+ .*$") then
	if ucl >= 5 then
		if table_sets ["classnoticonfig"] == 11 then
			donotifycmd (nick, data, 0, ucl)
		end

		donotifyextconfig (nick, string.sub (data, string.len ("=") + 3, -1), ucl)
	end

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."=%s+%S+ .*$") then
	if ucl >= 5 then
		sethubconf (string.sub (data, string.len ("=") + 3, -1))

		if table_sets ["classnoticonfig"] == 11 then
			donotifycmd (nick, data, 0, ucl)
		end

		donotifyconfig (nick, string.sub (data, string.len ("=") + 3, -1), ucl)
	end

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."restart$") or string.find (data, "^"..table_othsets ["optrig"].."restart .*$") then
	if ucl == 10 then
		maintoall (getlang (477), 0, 10)
		donotifycmd (nick, data, 0, ucl)
		table_othsets ["restart"] = true
	else
		commandanswer (nick, getlang (128))
		return 0
	end

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."quit$") or string.find (data, "^"..table_othsets ["optrig"].."quit .*$") then
	if ucl == 10 then
		maintoall (getlang (478), 0, 10)
		donotifycmd (nick, data, 0, ucl)
		table_othsets ["restart"] = true
	else
		commandanswer (nick, getlang (128))
		return 0
	end

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."luaload .*$") or string.find (data, "^"..table_othsets ["optrig"].."luaunload .*$") or string.find (data, "^"..table_othsets ["optrig"].."luareload .*$") then
	if ucl >= getconfig ("plugin_mod_class") then -- use plugin permission for lua scripts too
		donotifycmd (nick, data, 0, ucl)
	else
		commandanswer (nick, getlang (128))
		return 0
	end

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."lualist.*$") or string.find (data, "^"..table_othsets ["optrig"].."luainfo.*$") or string.find (data, "^"..table_othsets ["optrig"].."luaversion.*$") then
	donotifycmd (nick, data, 0, ucl)

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."offplug .*$") or string.find (data, "^"..table_othsets ["optrig"].."onplug .*$") or string.find (data, "^"..table_othsets ["optrig"].."replug .*$") or string.find (data, "^"..table_othsets ["optrig"].."modplug .*$") or string.find (data, "^"..table_othsets ["optrig"].."addplug .*$") or string.find (data, "^"..table_othsets ["optrig"].."delplug .*$") then
	if ucl >= getconfig ("plugin_mod_class") then -- check the permissions
		donotifycmd (nick, data, 0, ucl)
	end

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["optrig"].."lstplug.*$") then
	donotifycmd (nick, data, 0, ucl)

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. "me$") then
		-- do nothing

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["optrig"] .. "me ") then
		-- do nothing

	else -- unknown command
		donotifycmd (nick, data, 0, ucl)
	end

	return 1
end

----- ---- --- -- -

function VH_OnUserCommand (nick, data)
	if table_othsets ["locked"] then
		return 1
	end

	local ucl = getclass (nick)

	if ucl < 0 then
		return 0
	end

	if getconfig ("disable_usr_cmds") ~= 0 then
		return 1
	end

	if checkcmd (nick, ucl, data) == 0 then -- command permissions
		return 0
	end

	local ip = getip (nick)

	if table_sets ["chatfloodcmdgag"] == 1 then -- check ip gag
		if gagipcheck (nick, ip, ucl, nil, data) then
			return 0
		end

		if gagccheck (nick, ip, ucl, nil, data) then
			return 0
		end
	end

	if table_sets ["checkcmdspam"] == 1 and antiscan (nick, ucl, data, 1, nil, nil) == 0 then -- check command spam
		return 0
	end

	savecmdlog (nick, ucl, data, false) -- command logger

	-- kick command for vips

	if string.find (data, "^" .. table_othsets ["ustrig"] .. "kick%s+(%S+)%s*(.*)$") and table_sets ["enablevipkick"] == 1 and ucl == 2 then
		local _, _, usr, rsn = string.find (data, "^" .. table_othsets ["ustrig"] .. "kick%s+(%S+)%s*(.*)$")

		if getstatus (usr) == 1 then
			local ucls = getclass (usr)

			if ucls < 2 then -- only users with lower class
				local uip = getip (usr)

				if not isprotected (usr, uip) then
					if rsn == "" then
						rsn = getlang (770)
					end

					commandanswer (nick, string.format (getlang (147), usr, uip .. tryipcc (uip, usr), ucls, nick, rsn))
					VH:KickUser (nick, usr, rsn) -- kick using vips nick
				else -- protected
					commandanswer (nick, getlang (46))
				end
			else
				commandanswer (nick, getlang (771))
			end
		else -- not in list
			commandanswer (nick, string.format (getlang (704), usr))
		end

		return 0
	end

---------------------------------------------------------------------
-- process +me command >>
---------------------------------------------------------------------

if string.find (data, "^"..table_othsets ["ustrig"].."me .*$") then
if getconfig ("disable_me_cmd") ~= 0 then return 1 end
local msg = string.sub (data, string.len ("me") + 3, -1)

if isprotected (nick, ip) == false then -- protection
	if table_sets ["chatcodeon"] > 0 then -- chatcode
		if ucl <= table_sets ["codemaxclass"] then
			if not table_code [nick] then
				local vcode, code = genchatcode ()
				table_code [nick] = {["vcode"] = vcode, ["code"] = code, ["lock"] = true}
				local txt = string.gsub (table_sets ["codetext"], "<code>", reprexpchars (vcode))
				maintouser (nick, txt)
				return 0
			else
				if table_code [nick]["lock"] == true then
					local rcode = table_code [nick]["code"]
					if table_sets ["chatcodeon"] == 2 then rcode = string.lower (rcode) end -- accept lower case

					if (msg == rcode) or (msg == table_code [nick]["code"]) then
						table_code [nick]["lock"] = false
						maintouser (nick, getlang (606))
					else
						local txt = string.gsub (table_sets ["codetext"], "<code>", reprexpchars (table_code [nick]["vcode"]))
						maintouser (nick, txt)
					end

					return 0
				end
			end
		end
	end

	if detchatflood (nick, ucl, ip, msg, nil) == true then return 0 end -- flood detection

	if table_sets ["chatfloodcmdgag"] == 0 then -- ip gag, dont check twice
		if gagipcheck (nick, ip, ucl, nil, msg) == true then return 0 end
		if gagccheck (nick, ip, ucl, nil, msg) == true then return 0 end
	end

	if table_sets ["checkcmdspam"] == 0 then -- antispam, dont check twice
		if antiscan (nick, ucl, msg, 1, nil, nil) == 0 then return 0 end
	end
end

local fakenick = nick

if table_sets ["funrandomchat"] == 1 then
	fakenick = getrandomnick ()

	if table_sets ["custnickclass"] < 11 then
		fakenick = getcustnick (fakenick) or fakenick -- use custom nick
	end
else
	if table_sets ["custnickclass"] < 11 then
		fakenick = getcustnick (nick) or nick
	end
end

local cvdat = msg
local retval = 1

if table_sets ["translitmode"] > 0 then -- convert translit
	cvdat = convtranslit (cvdat, table_sets ["translitmode"])

	if msg ~= cvdat then -- only when modified
		if antiscan (nick, ucl, cvdat, 1, nil, nil) == 0 then return 0 end -- spam detection after translit conversion
		retval = 0
	end
end

if (table_sets ["tolowcharcase"] == 1) and (ucl < 3) then -- convert char case
	cvdat = convcaps (cvdat, true)
	if msg ~= cvdat then retval = 0 end -- only when modified
end

	cvdat = modusrmode (nick, ip, cvdat) -- chat mode

	if table_sets ["replrunning"] == 1 then -- replacer
		local norepl = cvdat
		cvdat = replchatmsg (nick, ucl, cvdat)

		if norepl ~= cvdat then
			opsnotify (table_sets ["classnotirepl"], string.format (getlang (932), ucl, nick, "+me " .. msg))
		end
	end

	if msg ~= cvdat then
		retval = 0 -- only when modified
	end

if table_sets ["useripinchat"] > 0 then -- ip in chat
	local pfx = ""

	if (table_sets ["useripinchat"] == 2) and (table_othsets ["func_getcc"] == true) then
		local cc = getcc (nick)
		if (not cc) or (cc == "--") then cc = "??" end
		pfx = "[ "..ip.." &#124; "..cc.." ]"
	else
		pfx = "[ "..ip.." ]"
	end

	VH:SendDataToAll ("** "..fakenick.." "..cvdat.."|", 0, 2)
	VH:SendDataToAll (pfx.." ** "..fakenick.." "..cvdat.."|", 3, 10)
	retval = 0
else -- no ip
	if (retval == 0) or (fakenick ~= nick) then -- only when modified
		VH:SendDataToAll ("** "..fakenick.." "..cvdat.."|", 0, 10)
		retval = 0
	end
end

addmchistoryline (fakenick, nick, string.sub (getconfig ("cmd_start_user"), 1, 1).."me "..cvdat)
replyresponder (fakenick, ucl, cvdat)
chatrankaccept (nick, ucl)
wordrankaccept (nick, ucl, cvdat)

return retval

elseif string.find (data, "^"..table_othsets ["ustrig"].."me$") then
if getconfig ("disable_me_cmd") ~= 0 then return 1 end

if isprotected (nick, ip) == false then -- protection
	if table_sets ["chatcodeon"] > 0 then -- chatcode
		if ucl <= table_sets ["codemaxclass"] then
			if not table_code [nick] then
				local vcode, code = genchatcode ()
				table_code [nick] = {["vcode"] = vcode, ["code"] = code, ["lock"] = true}
				local txt = string.gsub (table_sets ["codetext"], "<code>", reprexpchars (vcode))
				maintouser (nick, txt)
				return 0
			else
				if table_code [nick]["lock"] == true then
					local txt = string.gsub (table_sets ["codetext"], "<code>", reprexpchars (table_code [nick]["vcode"]))
					maintouser (nick, txt)
					return 0
				end
			end
		end
	end

	if detchatflood (nick, ucl, ip, data, nil) == true then return 0 end -- flood detection

	if table_sets ["chatfloodcmdgag"] == 0 then -- ip gag, dont check twice
		if gagipcheck (nick, ip, ucl, nil, data) == true then return 0 end
		if gagccheck (nick, ip, ucl, nil, data) == true then return 0 end
	end
end

local fakenick = nick

if table_sets ["funrandomchat"] == 1 then
	fakenick = getrandomnick ()

	if table_sets ["custnickclass"] < 11 then
		fakenick = getcustnick (fakenick) or fakenick -- use custom nick
	end
else
	if table_sets ["custnickclass"] < 11 then
		fakenick = getcustnick (nick) or nick
	end
end

local retval = 1

if table_sets ["useripinchat"] > 0 then -- ip in chat
	local pfx = ""

	if (table_sets ["useripinchat"] == 2) and (table_othsets ["func_getcc"] == true) then
		local cc = getcc (nick)
		if (not cc) or (cc == "--") then cc = "??" end
		pfx = "[ "..ip.." &#124; "..cc.." ]"
	else
		pfx = "[ "..ip.." ]"
	end

	VH:SendDataToAll ("** "..fakenick.."|", 0, 2)
	VH:SendDataToAll (pfx.." ** "..fakenick.."|", 3, 10)
	retval = 0
else -- no ip
	if fakenick ~= nick then -- only when modified
		VH:SendDataToAll ("** "..fakenick.."|", 0, 10)
		retval = 0
	end
end

addmchistoryline (fakenick, nick, data)
chatrankaccept (nick, ucl)

return retval
end

---------------------------------------------------------------------
-- process +me command <<
---------------------------------------------------------------------

	if string.find (data, "^"..table_othsets ["ustrig"].."report .+$") then -- antispam
		if table_sets ["checkcmdspam"] == 0 then -- dont check twice
			local cfg = getconfig ("disable_report_cmd")
			if cfg and (cfg ~= 0) then return 1 end
			if table_sets ["allowspamtoops"] == 1 then return 1 end
			if isprotected (nick, getip (nick)) == true then return 1 end
			return antiscan (nick, ucl, string.sub (data, string.len ("report") + 3, -1), 4, nil, nil)
		end

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["ustrig"] .. table_cmnds ["votekick"] .. " %S+$") then
		if ucl >= table_sets ["votekickclass"] then
			-- donotifycmd (nick, data, 0, ucl)
			votekickuser (nick, string.sub (data, string.len (table_cmnds ["votekick"]) + 3))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["showtopic"].."$") then
if ucl >= table_sets ["minusrcommandclass"] then
donotifycmd (nick, data, 0, ucl)
sendtopic (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["mychatrank"].."$") then
if ucl >= table_sets ["chatrankclass"] then
donotifycmd (nick, data, 0, ucl)
chatranksendown (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["mysharerank"].."$") then
if ucl >= table_sets ["sharerankclass"] then
donotifycmd (nick, data, 0, ucl)
shareranksendown (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["chatranks"].."$") then
if ucl >= table_sets ["chatrankclass"] then
donotifycmd (nick, data, 0, ucl)
chatranksendall (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["shareranks"].."$") then
if ucl >= table_sets ["sharerankclass"] then
donotifycmd (nick, data, 0, ucl)
shareranksendall (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["opranks"].."$") then
if ucl >= table_sets ["oprankclass"] then
donotifycmd (nick, data, 0, ucl)
opranksendall (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["wordranks"].."$") then
if ucl >= table_sets ["wordrankclass"] then
donotifycmd (nick, data, 0, ucl)
wordranksendall (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["searranks"].."$") then
	if ucl >= table_sets ["searrankclass"] then
		donotifycmd (nick, data, 0, ucl)
		searranksendall (nick)
	else
		commandanswer (nick, getlang (128))
	end

	return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["cclive"].."$") then
if ucl >= table_sets ["ccstatsclass"] then
donotifycmd (nick, data, 0, ucl)
sendlivecc (nick)
else
commandanswer (nick, getlang (128))
end

return 0

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["ustrig"] .. table_cmnds ["citylive"] .. " [%a%d]+$") then
		if ucl >= table_sets ["ccstatsclass"] then
			donotifycmd (nick, data, 0, ucl)
			sendlivecity (nick, string.sub (data, string.len (table_cmnds ["citylive"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

	return 0

	----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["cchist"].."$") then
if (table_sets ["savecchistory"] == 1) and (ucl >= table_sets ["ccstatsclass"]) then
donotifycmd (nick, data, 0, ucl)
sendhistcc (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["showhubs"].."$") then
if ucl >= table_sets ["minusrcommandclass"] then
donotifycmd (nick, data, 0, ucl)
hublistshow (nick)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["offmsg"].." %S+ .+$") then
if ucl >= table_sets ["offmsgclass"] then
sendoffmsg (nick, string.sub (data, string.len (table_cmnds ["offmsg"]) + 3, -1), ucl)
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["hubnews"].." %d+$") then
		if ucl >= table_sets ["newsclass"] then
			donotifycmd (nick, data, 0, ucl)
			sendnews (nick, string.sub (data, string.len (table_cmnds ["hubnews"]) + 3, -1), 0)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["calculate"].." %S+ %S %S+$") then
if ucl >= table_sets ["minusrcommandclass"] then
donotifycmd (nick, data, 0, ucl)
calculate (nick, string.sub (data, string.len (table_cmnds ["calculate"]) + 3, -1))
else
commandanswer (nick, getlang (128))
end

return 0

----- ---- --- -- -

elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["mode"].." %S+$") then
	if ucl >= table_sets ["chatmodeclass"] then
		donotifycmd (nick, data, 0, ucl)
		setmode (nick, reppatchars (tolow (nick)).." "..string.sub (data, string.len (table_cmnds ["mode"]) + 3, -1))
	else
		commandanswer (nick, getlang (128))
	end

	return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["rellist"].." %S+ %d+$") or string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["rellist"].." %S+ %d+ .+$") then
		if ucl >= table_sets ["minusrcommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			listrelease (nick, string.sub (data, string.len (table_cmnds ["rellist"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["reladd"].." \".+\" \".+\"$") or string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["reladd"].." \".+\" \".+\" %S+$") then
		if ucl >= table_sets ["relmodclass"] then
			donotifycmd (nick, data, 0, ucl)
			addrelease (nick, string.sub (data, string.len (table_cmnds ["reladd"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["reldel"].." %S+ .+$") then
		if ucl >= table_sets ["relmodclass"] then
			donotifycmd (nick, data, 0, ucl)
			delrelease (nick, string.sub (data, string.len (table_cmnds ["reldel"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["relfind"].." .+$") then
		if ucl >= table_sets ["minusrcommandclass"] then
			donotifycmd (nick, data, 0, ucl)
			findrelease (nick, string.sub (data, string.len (table_cmnds ["relfind"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["ustrig"] .. table_cmnds ["history"] .. " %d+$") then
		if (ucl >= table_sets ["mchistclass"]) and (table_sets ["histlimit"] > 0) then
			donotifycmd (nick, data, 0, ucl)
			sendmchistory (nick, string.sub (data, string.len (table_cmnds ["history"]) + 3, -1), 0)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

	elseif string.find (data, "^" .. table_othsets ["ustrig"] .. table_cmnds ["myhistory"] .. " %d+$") then
		if (ucl >= table_sets ["mchistclass"]) and (table_sets ["histlimit"] > 0) then
			donotifycmd (nick, data, 0, ucl)
			sendownhistory (nick, string.sub (data, string.len (table_cmnds ["myhistory"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

	----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["nick"].."$") or string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["nick"].." .+$") then
		if ucl >= table_sets ["custnickclass"] then
			setcustnick (nick, string.sub (data, string.len (table_cmnds ["nick"]) + 3, -1), ucl)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["realnick"].." %S+$") then
		if table_sets ["custnickclass"] < 11 then
			donotifycmd (nick, data, 0, ucl)
			getrealnick (nick, string.sub (data, string.len (table_cmnds ["realnick"]) + 3, -1))
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["custlist"].."$") then
		if table_sets ["custnickclass"] < 11 then
			donotifycmd (nick, data, 0, ucl)
			listcustnick (nick)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["wmset"].." %S+ .+$") or string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["wmset"].." %S+$") then
		if ucl >= table_sets ["welcomeclass"] then
			if table_sets ["classnotiwelcome"] == 11 then
				donotifycmd (nick, data, 0, ucl)
			end

			setwelcome (nick, string.sub (data, string.len (table_cmnds ["wmset"]) + 3, -1), ucl)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["ustrig"]..table_cmnds ["wmshow"].."$") then
		if ucl >= table_sets ["welcomeclass"] then
			donotifycmd (nick, data, 0, ucl)
			showwelcome (nick)
		else
			commandanswer (nick, getlang (128))
		end

		return 0

----- ---- --- -- -

	elseif string.find (data, "^"..table_othsets ["ustrig"].."regme$") or string.find (data, "^"..table_othsets ["ustrig"].."regme%s+.*$") then
		return checkregmecmd (nick, ucl)

----- ---- --- -- -

	else -- unknown command
		donotifycmd (nick, data, 0, ucl)
	end

	return 1
end

----- ---- --- -- -

function VH_OnParsedMsgMyINFO (nick, data)
	if table_othsets ["locked"] == true then return 1 end
	local _, ip, desc, tag, conn, email, size, hasinfo, gotip = "", "", "", "", "", "", 0, false, false

	--if table_sets ["enableipwatch"] == 1 then -- ip watch, moved to VH_OnUserLogin due to verlihub bug
		--ip, gotip = getip (nick), true
		--checkipwat (nick, ip, data) -- do not return 0, can be a login sequence
	--end

	if (table_sets ["enableuserlog"] == 1) and (table_sets ["logallmyinfos"] == 1) then -- user logger
		if gotip == false then ip, gotip = getip (nick), true end
		desc, tag, conn, _, email, size = parsemyinfo (nick, data)
		hasinfo = true
		VH:SQLQuery ("insert into `"..tbl_sql ["ulog"].."` (`time`, `nick`, `ip`, `desc`, `tag`, `conn`, `email`, `share`) values ("..(os.time () + table_sets ["srvtimediff"])..", '"..repsqlchars (nick).."', '"..repsqlchars (ip).."', '"..repsqlchars (desc).."', '"..repsqlchars (tag).."', '"..repsqlchars (conn).."', '"..repsqlchars (email).."', "..repsqlchars (size)..")")
	end

	if (table_sets ["micheck"] == 0) or (table_sets ["micallall"] == 0) then return 1 end
	local cls = getclass (nick)
	if (cls == -1) or (cls >= table_sets ["scanbelowclass"]) then return 1 end -- dont check pingers but check unknown class -2

	if gotip == false then ip = getip (nick) end
	if isprotected (nick, ip) == true then return 1 end -- skip all checks

	if hasinfo == false then -- prepare
		desc, tag, conn, _, email, size = parsemyinfo (nick, data)
	end

	if checkdesc (nick, desc, cls, ip) == 1 then return 0 end
	if checktag (nick, tag, cls, ip) == 1 then return 0 end
	if checkconn (nick, conn, cls, ip) == 1 then return 0 end
	if checkemail (nick, email, cls, ip) == 1 then return 0 end
	if checkshare (nick, size, cls, ip) == 1 then return 0 end
	if checkfake (nick, size, cls, ip) == 1 then return 0 end
	if checkclone (nick, size, ip, cls) == 1 then return 0 end
	return 1
end

----- ---- --- -- -

function VH_OnUserLogin (nick, uip)
	if table_othsets ["locked"] == true then return 1 end
	local mistr, ip, desc, tag, conn, email, size, prot, hasip, hasinfo, hasprot, hasmistr = "", "", "", "", "", "", 0, false, false, false, false, false

	if table_sets ["enableipwatch"] == 1 then -- ip watch
		mistr, hasmistr = getmyinfo (nick), true
		ip, hasip = getip (nick), true
		checkipwat (nick, ip, mistr) -- do not return 0, is a login sequence
	end

	if table_sets ["enableuserlog"] == 1 then -- user logger
		if hasip == false then ip, hasip = getip (nick), true end
		if hasmistr == false then mistr, hasmistr = getmyinfo (nick), true end
		desc, tag, conn, _, email, size = parsemyinfo (nick, mistr)
		hasinfo = true
		VH:SQLQuery ("insert into `"..tbl_sql ["ulog"].."` (`time`, `nick`, `ip`, `desc`, `tag`, `conn`, `email`, `share`) values ("..(os.time () + table_sets ["srvtimediff"])..", '"..repsqlchars (nick).."', '"..repsqlchars (ip).."', '"..repsqlchars (desc).."', '"..repsqlchars (tag).."', '"..repsqlchars (conn).."', '"..repsqlchars (email).."', "..size..")")
	end

	local cls = getclass (nick)
	if cls < 0 then return 1 end -- dont check pingers

if (table_sets ["ipconantiflint"] > 0) and (cls < table_sets ["scanbelowclass"]) then -- ip connect antiflood
	if hasip == false then ip, hasip = getip (nick), true end
	prot, hasprot = isprotected (nick, ip), true

	if prot == false then -- protection
		if table_rcnn [ip] then
			local dif = os.difftime (os.time (), table_rcnn [ip])

			if dif >= table_sets ["ipconantiflint"] then
				table_rcnn [ip] = nil -- delete
			else
				maintouser (nick, string.format (getlang (306), table_sets ["ipconantiflint"] - dif))
				VH:CloseConnection (nick) -- drop user

				if cls >= table_sets ["welcomeclass"] then -- dont send logout message
					table_faau [nick] = 1
				end

				return 0
			end

		else -- add
			table_rcnn [ip] = os.time ()
		end
	end
end

if table_sets ["authrunning"] == 1 then -- ip authorization
	if hasip == false then ip, hasip = getip (nick), true end

	if authcheck (nick, cls, ip) == true then
		if cls >= table_sets ["welcomeclass"] then -- dont send logout message
			table_faau [nick] = 1
		end

		return 0
	end
end

if (table_sets ["micheck"] == 1) and (cls < table_sets ["scanbelowclass"]) then -- myinfo check
	if hasip == false then ip, hasip = getip (nick), true end
	if hasprot == false then prot = isprotected (nick, ip) end

	if prot == false then -- protection
		if hasinfo == false then
			if hasmistr == false then mistr, hasmistr = getmyinfo (nick), true end
			desc, tag, conn, _, email, size = parsemyinfo (nick, mistr)
			hasinfo = true
		end

		if checknick (nick, cls, ip) == 1 then return 0 end
		if checkdesc (nick, desc, cls, ip) == 1 then return 0 end
		if checktag (nick, tag, cls, ip) == 1 then return 0 end
		if checkconn (nick, conn, cls, ip) == 1 then return 0 end
		if checkemail (nick, email, cls, ip) == 1 then return 0 end
		if checkshare (nick, size, cls, ip) == 1 then return 0 end
		if checkip (nick, ip, cls) == 1 then return 0 end
		if checkcc (nick, cls) == true then return 0 end
		if checkdns (nick, cls, ip) == true then return 0 end
		if checksup (nick, cls, ip) == true then return 0 end
		if checkver (nick, cls, ip) == true then return 0 end
		if checkfake (nick, size, cls, ip) == 1 then return 0 end
		if checkclone (nick, size, ip, cls) == 1 then return 0 end
		if checksameip (nick, ip, cls) == 1 then return 0 end
	end
end

	if table_sets ["showuseruptime"] == 1 then -- user uptime
		table_usup [nick] = os.time ()
	end

if (table_othsets ["func_getcc"] == true) and (table_sets ["savecchistory"] == 1) and (table_sets ["ccstatsclass"] < 11) then -- cc statistics
	if isbot (nick) == false then -- callback used for bots too
		local cc = getcc (nick)

		if cc then
			cc = repsqlchars (cc)
			VH:SQLQuery ("insert into `"..tbl_sql ["ccstat"].."` (`nick`, `cc`) values ('"..repsqlchars (nick).."', '"..cc.."') on duplicate key update `cc` = '"..cc.."'")
		end
	end
end

	if hasinfo == false then
		if hasmistr == false then mistr = getmyinfo (nick) end
		size = parsemyinfoshare (mistr)
	end

	sharerankaccept (nick, size, cls)
	resetrealnick (nick) -- reset custom nick when used by real user

if (cls >= table_sets ["newsclass"]) and (table_sets ["newsautolines"] > 0) then -- hub news
	sendnews (nick, table_sets ["newsautolines"], 1)
end

	if table_sets ["histlimit"] > 0 then
		if (cls >= table_sets ["mchistclass"]) and (table_sets ["histautolines"] > 0) then -- mc history
			sendmchistory (nick, table_sets ["histautolines"], 1)
		end

		if (cls >= 3) and (table_sets ["ophistautolines"] > 0) then -- op history
			sendophistory (nick, table_sets ["ophistautolines"], 1, false)
		end
	end

if hasip == false then ip = getip (nick) end
sendwelcomein (nick, cls)
autosendoffmsg (nick, cls, ip)
addccroommember (nick, cls)

if cls < 3 then -- operator keys
	if cls >= table_sets ["opkeyclass"] then
		table_opks [nick] = 1 -- class
	elseif (table_sets ["opkeyshare"] > 0) and (size >= (table_sets ["opkeyshare"] * 1073741824)) then
		table_opks [nick] = 2 -- share
	elseif cls >= table_sets ["opkeyself"] then -- self
		VH:SendDataToUser ("$OpList "..nick.."|", nick)
	end
end

if (table_sets ["opkeyclass"] < 11) or (table_sets ["opkeyshare"] > 0) then
	local list = ""

	for k, _ in pairs (table_opks) do
		list = list..k.."$$"
	end

	if list ~= "" then
		VH:SendDataToAll ("$OpList "..list.."|", 0, 10)
	end
end

	installusermenu (nick)
	sendrcmenu (nick, cls)
	return 1
end

----- ---- --- -- -

function VH_OnUserLogout (nick, uip)
	if table_othsets ["locked"] == true then return 1 end
	if table_othsets ["restart"] == true then return 1 end -- restart mode
	local cls = getclass (nick)

	if table_sets ["showuseruptime"] == 1 then -- user uptime
		table_usup [nick] = nil
	end

	if table_sets ["regmechatcnt"] > 0 then -- regme limit
		table_regm [nick] = nil
	end

	if table_faau [nick] then -- dont send logout message
		table_faau [nick] = nil
	else
		sendwelcomeout (nick, cls)
	end

	if table_sets ["chatcodeon"] > 0 then -- chatcode
		table_code [nick] = nil
	end

	if table_sets ["savecustnicks"] == 0 then -- only if not saving
		delcustnick (nick, cls, true)
	end

	if (table_sets ["ipconantiflint"] > 0) and (cls < table_sets ["scanbelowclass"]) then -- ip connect antiflood
		local ip = getip (nick)
		if isprotected (nick, ip) == true then return 1 end

		if (not table_rcnn [ip]) or (os.difftime (os.time (), table_rcnn [ip]) >= table_sets ["ipconantiflint"]) then
			table_rcnn [ip] = os.time () -- set delay
		end
	end

	delccroommember (nick)

	if table_sets ["protofloodctmcnt"] > 0 then -- ctm flood
		table_prfl ["ctm"][nick] = nil
	end

	if table_sets ["ctmminclass"] > cls then -- ctm block
		table_ctmb [nick] = nil
	end

	table_opks [nick] = nil -- operator keys
	table_voki [nick] = nil -- vote kicks
	return 1
end

----- ---- --- -- -

function VH_OnParsedMsgSearch (nick, data)
	if table_othsets ["locked"] == true then return 1 end
	local cls, ip, prot, gotcls, gotip, gotprot = 0, "", false, false, false, false

	if table_sets ["enableipwatch"] == 1 then -- ip watch
		ip, gotip = getip (nick), true
		if checkipwat (nick, ip, data) == true then return 0 end
	end

	if (table_sets ["searchuptime"] > 0) and (table_sets ["showuseruptime"] == 1) then
		cls, gotcls = getclass (nick), true

		if cls < table_sets ["scanbelowclass"] then
			if gotip == false then ip, gotip = getip (nick), true end
			prot, gotprot = isprotected (nick, ip), true

			if table_usup [nick] then
				local dif = os.time () - table_usup [nick]

				if dif < table_sets ["searchuptime"] then
					if table_sets ["searuptimeact"] == 0 then -- message
						maintouser (nick, string.format (getlang (854), (table_sets ["searchuptime"] - dif)))
					elseif table_sets ["searuptimeact"] == 1 then -- drop
						VH:CloseConnection (nick)
					end

					return 0
				end
			end
		end
	end

	if table_sets ["enablesearfilt"] == 1 then
		if gotcls == false then cls, gotcls = getclass (nick), true end

		if cls < table_sets ["scanbelowclass"] then
			if gotip == false then ip = getip (nick) end
			if gotprot == false then prot = isprotected (nick, ip) end

			if (prot == false) and (sefiscan (nick, data, cls, ip) == 0) then -- search filter
				return 0
			end
		end
	end

	if gotcls == false then cls = getclass (nick) end
	searrankaccept (nick, cls, data)
	return 1
end

----- ---- --- -- -

function VH_OnParsedMsgSR (nick, data)
	if table_othsets ["locked"] == true then return 1 end

	if table_sets ["enableipwatch"] == 1 then -- ip watch
		if checkipwat (nick, getip (nick), data) == true then return 0 end
	end

	-- add srfi - search result filter
	return 1
end

----- ---- --- -- -

function VH_OnParsedMsgValidateNick (ip, data)
	if table_othsets ["locked"] == true then return 1 end

	if table_sets ["enableipwatch"] == 1 then -- ip watch
		checkipwat (nil, ip, data) -- do not return 0, is a login sequence
	end

	-- move ip autorization here when callback is fixed
	-- move ip connect antiflood
	-- move nick and ip myinfo checks
	return 1
end

----- ---- --- -- -

function VH_OnParsedMsgSupport (ip, data)
	if table_othsets ["locked"] == true then return 1 end

	if table_sets ["enableipwatch"] == 1 then -- ip watch
		checkipwat (nil, ip, data) -- do not return 0, is a login sequence
	end

	return 1
end

----- ---- --- -- -

function VH_OnNewReg (nick, class)
	--if table_othsets ["locked"] == true then return 1 end
	-- use registration notification from here in future
	return 1
end

----- ---- --- -- -

function VH_OnDelReg (nick, class)
	--if table_othsets ["locked"] == true then return 1 end
	-- use registration notification from here in future
	return 1
end

----- ---- --- -- -

function VH_OnUpdateClass (nick, oldclass, newclass)
	--if table_othsets ["locked"] == true then return 1 end
	-- use registration notification from here in future
	return 1
end

----- ---- --- -- -

function VH_OnHubName (nick, name)
	--if table_othsets ["locked"] == true then return 1 end
	-- use this for rolling topic in future
	return 1
end

----- ---- --- -- -

function VH_OnTimer (msec)
	if table_othsets ["locked"] == true then return 1 end
	local st = os.time () -- current time

	if table_sets ["remrunning"] == 1 then -- reminder
		if os.difftime (st, table_othsets ["remseconds"]) >= 60 then
			table_othsets ["remseconds"] = st
			sendreminder ()
		end
	end

	if table_sets ["timebotint"] > 0 then -- time bot
		if os.difftime (st, table_othsets ["timebotseconds"]) >= table_sets ["timebotint"] then
			installtimebot ()
		end
	end

	if table_sets ["rolltopicint"] > 0 then -- rolling topic
		if (not table_othsets ["topicvalue"]) and (table_othsets ["func_gettopic"] == true) then
			table_othsets ["topicvalue"] = VH:GetTopic ()
		end

		if table_othsets ["topicvalue"] and (table_othsets ["topicvalue"] ~= "") and (os.difftime (st, table_othsets ["rolltopicsecs"]) >= table_sets ["rolltopicint"]) then
			rolltopic ()
		end
	end

	if table_sets ["resprunning"] == 1 then -- chat responder
		for k, v in pairs (table_resp) do
			for t, s in pairs (v) do
				if os.difftime (st, t) >= table_sets ["respdelay"] then
					maintoall (s, 0, 10) -- finally send the message
					table_resp [k] = nil -- free up queue
					break
				end
			end
		end
	end

	--if lsock and (table_sets ["hublistpingint"] > 0) then -- hublist pinger
		--if os.difftime (st, table_othsets ["hubpingmins"]) >= (table_sets ["hublistpingint"] * 60) then
			--hublistping ()
			--table_othsets ["hubpingmins"] = st -- reset
		--end
	--end

	if table_sets ["statscollint"] > 0 then -- statistics
		if os.difftime (st, table_othsets ["statscollmins"]) >= (table_sets ["statscollint"] * 60) then
			collectstats ()
			table_othsets ["statscollmins"] = st -- reset
		end
	end

	if (table_sets ["enableuserlog"] == 1) and (table_sets ["ulogautoclean"] > 0) then -- clean up user logger
		if os.difftime (st, table_othsets ["ulogcleanmins"]) >= 86400 then -- every 24 hours
			local secs = os.difftime (st, (table_sets ["ulogautoclean"] * 24 * 60 * 60))
			local _, rows = VH:SQLQuery ("select `id` from `" .. tbl_sql ["ulog"] .. "` where `time` < " .. secs)

			if rows > 0 then
				VH:SQLQuery ("delete from `" .. tbl_sql ["ulog"] .. "` where `time` < " .. secs)
				opsnotify (table_sets ["classnotiledoact"], string.format (getlang (889), rows, table_sets ["ulogautoclean"]))
				local tdiff = st + table_sets ["srvtimediff"]
				VH:SQLQuery ("insert into `" .. tbl_sql ["conf"] .. "` (`variable`, `value`) values ('lastcleanulog', " .. tdiff .. ") on duplicate key update `value` = " .. tdiff)
				VH:SQLQuery ("insert into `" .. tbl_sql ["conf"] .. "` (`variable`, `value`) values ('limcleanulog', " .. table_sets ["ulogautoclean"] .. ") on duplicate key update `value` = " .. table_sets ["ulogautoclean"])
			end

			table_othsets ["ulogcleanmins"] = st
		end
	end

	if (table_sets ["autoupdcheck"] > 0) and table_othsets ["ver_curl"] and (table_sets ["classnotiledoact"] ~= 11) and (os.difftime (st, table_othsets ["lastupdcheck"]) >= (table_sets ["autoupdcheck"] * 3600)) then -- automatic update check
		autoupdatecheck ()
		table_othsets ["lastupdcheck"] = st -- reset
	end

	if os.difftime (st, table_othsets ["collgarb"]) >= 900 then -- collect garbage every 15 minutes
		if string.sub (table_othsets ["ver_lua"], 1, 3) == "5.0" then collectgarbage () else collectgarbage ("collect") end
		table_othsets ["collgarb"] = st -- reset
	end

	return 1
end

----- ---- --- -- -

function VH_OnUnknownMsg (nick, data, isnick, ipaddr)
	if table_othsets ["locked"] == true then
		return 1
	end

	if string.len (data) == 0 then -- skip pings
		return 1
	elseif string.sub (data, 1, 7) == "$UserIP" then -- userip support
		if table_sets ["useripsupport"] == 1 and getclass (nick) >= 3 then
			local nl, il = string.sub (data, 9), ""
			local len = string.len (nl)

			if len > 0 then
				if string.sub (nl, len - 1) ~= "$$" then -- modify
					nl = nl .. "$$"
				end

				for user in string.gmatch (nl, "([^$]+)%$%$") do
					if getstatus (user) == 1 and isbot (user) == false then
						local ip = getip (user)

						if ip ~= "[unknown]" then
							il = il .. user .. " " .. ip .. "$$"
						end
					end
				end

				if string.len (il) > 0 then
					VH:SendDataToUser ("$UserIP " .. il .. "|", nick)
				end
			end
		end

		return 1
	end

	-- unknown command

	if (not isnick) or (isnick and tonumber (isnick) == 1) then -- old version or new version with nick
		local ip = ""

		if ipaddr and ipaddr ~= "" then
			ip = ipaddr
		else
			ip = getip (nick)
		end

		local class = getclass (nick)
		opsnotify (table_sets ["classnotiunk"], string.format (getlang (153), nick, ip .. tryipcc (ip, nick), class, repnmdcoutchars (data)))

		if table_sets ["kickunkusers"] == 1 and class < table_sets ["scanbelowclass"] and isprotected (nick, ip) == false then -- kick
			local rsn = string.gsub (table_sets ["unkkickreason"], "%*", reprexpchars (repnmdcoutchars (data)))
			VH:KickUser (table_othsets ["sendfrom"], nick, rsn .. "     #_ban_" .. table_sets ["unktbantime"])
			return 0
		end
	elseif table_sets ["unkbeforelogin"] == 1 then -- new version with ip
		opsnotify (table_sets ["classnotiunk"], string.format (getlang (891), nick .. tryipcc (nick), repnmdcoutchars (data)))

		if table_sets ["kickunkusers"] == 1 and isprotected (nil, nick) == false then -- drop
			local rsn = string.gsub (table_sets ["unkkickreason"], "%*", reprexpchars (repnmdcoutchars (data)))
			return {"<" .. table_othsets ["sendfrom"] .. "> " .. rsn .. "|", 0, 0}
		end
	end

	return 1
end

----- ---- --- -- -

function VH_OnParsedMsgAnyEx (ip, data)
	--if table_othsets ["locked"] == true then
		--return 1
	--end

	-- patch
	return 1
end

----- ---- --- -- -

function VH_OnParsedMsgAny (nick, data)
	if table_othsets ["locked"] == true then return 1 end

	if string.find (data, "^<") then -- main chat
		local _, _, cmd = string.find (data, "^<"..reppatchars (nick).."> ("..table_othsets ["optrig"]..".+)$")

		if cmd then
			local cls = getclass (nick)

			if cls >= 3 then
				if string.find (cmd, "^"..table_othsets ["optrig"].."luaload .*$") or string.find (cmd, "^"..table_othsets ["optrig"].."luaunload .*$") or string.find (cmd, "^"..table_othsets ["optrig"].."luareload .*$") then
					if cls >= getconfig ("plugin_mod_class") then -- use plugin permission for lua scripts too
						donotifycmd (nick, cmd, 0, cls)
						savecmdlog (nick, cls, cmd, true)
					else
						commandanswer (nick, getlang (128))
						return 0
					end

				elseif string.find (cmd, "^"..table_othsets ["optrig"].."lualist.*$") or string.find (cmd, "^"..table_othsets ["optrig"].."luainfo.*$") or string.find (cmd, "^"..table_othsets ["optrig"].."luaversion.*$") then
					donotifycmd (nick, cmd, 0, cls)
					savecmdlog (nick, cls, cmd, true)

				elseif string.find (cmd, "^"..table_othsets ["optrig"].."offplug .*$") or string.find (cmd, "^"..table_othsets ["optrig"].."onplug .*$") or string.find (cmd, "^"..table_othsets ["optrig"].."replug .*$") or string.find (cmd, "^"..table_othsets ["optrig"].."modplug .*$") or string.find (cmd, "^"..table_othsets ["optrig"].."addplug .*$") or string.find (cmd, "^"..table_othsets ["optrig"].."delplug .*$") then
					if cls >= getconfig ("plugin_mod_class") then -- check the permissions
						donotifycmd (nick, cmd, 0, cls)
						savecmdlog (nick, cls, cmd, true)
					end

				elseif string.find (cmd, "^"..table_othsets ["optrig"].."lstplug.*$") then
					donotifycmd (nick, cmd, 0, cls)
					savecmdlog (nick, cls, cmd, true)
				end
			end
		end

	elseif string.find (data, "^%$OpForceMove ") then -- opforcemove
		local cls = getclass (nick)
		if cls < getconfig ("min_class_redir") then return 0 end
		local _, _, who, where, msg = string.find (data, "%$Who:(.+)%$Where:(.+)%$Msg:(.+)$")
		if (not who) or (not where) or (not msg) then return 0 end
		if getstatus (who) == 0 then return 0 end
		local ip = getip (who)

		if isprotected (who, ip) == true then
			commandanswer (nick, getlang (46))
			return 0
		else
			opsnotify (table_sets ["classnotiredir"], string.format (getlang (152), who, ip .. tryipcc (ip, who), getclass (who), where, nick, msg))
			oprankaccept (nick, cls)
		end

	elseif string.find (data, "^%$ConnectToMe ") then -- connecttome
		if table_sets ["classnotibadctm"] < 11 then -- bad ctm notification
			local _, _, othernick, ctm = string.find (data, "^%$ConnectToMe (%S+) (.+)$")

			if othernick and ctm then
				local rip = getip (nick)

				if rip ~= "[unknown]" then
					local _, _, ip, port = string.find (ctm, "^(.*):(.*)$")

					if ip and port then
						if ip ~= rip then -- either ctm exploitation or incorrect ip in client settings
							opsnotify (table_sets ["classnotibadctm"], string.format (getlang (693), nick, rip .. tryipcc (rip, nick), getclass (nick), othernick, repnmdcoutchars (ip..":"..port)))
						end
					else
						if ctm ~= rip then
							opsnotify (table_sets ["classnotibadctm"], string.format (getlang (693), nick, rip .. tryipcc (rip, nick), getclass (nick), othernick, repnmdcoutchars (ctm)))
						end
					end
				end
			end
		end

		if detprotoflood ("ctm", true, nick, getip (nick), getclass (nick)) == true then return 0 end -- protocol flood
	end

	return 1
end

----- ---- --- -- -

function VH_OnParsedMsgConnectToMe (nick, othernick, ip, port)
	if table_othsets ["locked"] == true then return 1 end

	if table_sets ["enableipwatch"] == 1 then -- ip watch
		if checkipwat (nick, getip (nick), "$ConnectToMe "..othernick.." "..ip..":"..port) == true then return 0 end
	end

	--if (table_sets ["addledobot"] == 1) and (othernick == table_sets ["ledobotnick"]) then
		--maintouser (nick, string.format (getlang (358), "http://ledo.feardc.net/"))
		--return 0
	--else

	if table_sets ["ctmminclass"] > getclass (nick) then
		if table_ctmb [nick] then
			if os.difftime (os.time (), table_ctmb [nick]) >= table_sets ["ctmmsginterval"] then
				table_ctmb [nick] = os.time () -- reset
				maintouser (nick, table_sets ["ctmblockmsg"])
			end
		else
			table_ctmb [nick] = os.time () -- add
			maintouser (nick, table_sets ["ctmblockmsg"])
		end

		return 0
	end

	return 1
end

----- ---- --- -- -

function VH_OnParsedMsgRevConnectToMe (nick, othernick)
	if table_othsets ["locked"] == true then return 1 end

	if table_sets ["enableipwatch"] == 1 then -- ip watch
		if checkipwat (nick, getip (nick), "$RevConnectToMe "..othernick.." "..nick) == true then return 0 end
	end

	--if (table_sets ["addledobot"] == 1) and (othernick == table_sets ["ledobotnick"]) then
		--maintouser (nick, string.format (getlang (358), "http://ledo.feardc.net/"))
		--return 0
	--else

	if table_sets ["ctmminclass"] > getclass (nick) then
		if table_ctmb [nick] then
			if os.difftime (os.time (), table_ctmb [nick]) >= table_sets ["ctmmsginterval"] then
				table_ctmb [nick] = os.time () -- reset
				maintouser (nick, table_sets ["ctmblockmsg"])
			end
		else
			table_ctmb [nick] = os.time () -- add
			maintouser (nick, table_sets ["ctmblockmsg"])
		end

		return 0
	end

	return 1
end

----- ---- --- -- -

function VH_OnNewBan (ip, nick, host, share, ran_min, ran_max, bype, bate, why, op)
	if table_othsets ["locked"] or table_sets ["classnotiban"] == 11 then
		return 1
	end

	local banshare = tonumber (share) or 0
	local bantype = tonumber (bype) or 0 -- we dont use ban type here because miltiple parts might be banned
	local bandate = tonumber (bate) or 0
	local banwhy = why

	if not banwhy or string.len (banwhy) == 0 then
		banwhy = getlang (888)
	end

	if bandate == 0 then
		if bantype ~= 3 and bantype ~= 4 and bantype ~= 5 and bantype ~= 6 and bantype ~= 9 and ip and string.len (ip) > 0 then
			opsnotify (table_sets ["classnotiban"], string.format (getlang (933), ip, op, banwhy))
		end

		if nick and string.len (nick) > 0 then
			if bantype == 8 then
				opsnotify (table_sets ["classnotiban"], string.format (getlang (938), nick, op, banwhy))
			else
				opsnotify (table_sets ["classnotiban"], string.format (getlang (934), nick, op, banwhy))
			end
		end

		if host and string.len (host) > 0 then
			opsnotify (table_sets ["classnotiban"], string.format (getlang (936), host, op, banwhy))
		end

		if banshare > 0 then
			opsnotify (table_sets ["classnotiban"], string.format (getlang (937), tostring (banshare), op, banwhy))
		end

		if ran_min and ran_max and string.len (ran_min) > 0 and string.len (ran_max) > 0 then
			opsnotify (table_sets ["classnotiban"], string.format (getlang (935), ran_min .. " - " .. ran_max, op, banwhy))
		end
	else
		if bantype ~= 3 and ip and string.len (ip) > 0 then
			opsnotify (table_sets ["classnotiban"], string.format (getlang (939), ip, os.date (table_sets ["dateformat"] .. " " .. table_sets ["timeformat"], bandate), op, banwhy))
		end

		if nick and string.len (nick) > 0 then
			if bantype == 8 then
				opsnotify (table_sets ["classnotiban"], string.format (getlang (944), nick, os.date (table_sets ["dateformat"] .. " " .. table_sets ["timeformat"], bandate), op, banwhy))
			else
				opsnotify (table_sets ["classnotiban"], string.format (getlang (940), nick, os.date (table_sets ["dateformat"] .. " " .. table_sets ["timeformat"], bandate), op, banwhy))
			end
		end

		if host and string.len (host) > 0 then
			opsnotify (table_sets ["classnotiban"], string.format (getlang (942), host, os.date (table_sets ["dateformat"] .. " " .. table_sets ["timeformat"], bandate), op, banwhy))
		end

		if banshare > 0 then
			opsnotify (table_sets ["classnotiban"], string.format (getlang (943), tostring (banshare), os.date (table_sets ["dateformat"] .. " " .. table_sets ["timeformat"], bandate), op, banwhy))
		end

		if ran_min and ran_max and string.len (ran_min) > 0 and string.len (ran_max) > 0 then
			opsnotify (table_sets ["classnotiban"], string.format (getlang (941), ran_min .. " - " .. ran_max, os.date (table_sets ["dateformat"] .. " " .. table_sets ["timeformat"], bandate), op, banwhy))
		end
	end

	oprankaccept (op, getclass (op))
	return 1
end

----- ---- --- -- -

function VH_OnUnBan (what, op, why)
	if table_othsets ["locked"] or table_sets ["classnotiban"] == 11 then
		return 1
	end

	local repwhat = repsqlchars (what)
	local _, rows = VH:SQLQuery ("select `ban_type` from `banlist` where `ip` = '" .. repwhat .. "' or `nick` = '" .. repwhat .. "' or `host` = '" .. repwhat .. "' or `share_size` = '" .. repwhat .. "' limit 1")

	if rows > 0 then
		local _, bantype = VH:SQLFetch (0)
		bantype = tonumber (bantype) or -1
		local banwhy = why

		if not banwhy or string.len (banwhy) == 0 then
			banwhy = getlang (888)
		end

		if bantype == 0 then -- nick + ip
			opsnotify (table_sets ["classnotiban"], string.format (getlang (962), what, op, banwhy))
		elseif bantype == 1 then -- ip
			opsnotify (table_sets ["classnotiban"], string.format (getlang (945), what, op, banwhy))
		elseif bantype == 2 then -- nick
			opsnotify (table_sets ["classnotiban"], string.format (getlang (946), what, op, banwhy))
		elseif bantype == 3 then -- range
			opsnotify (table_sets ["classnotiban"], string.format (getlang (947), what, op, banwhy))
		elseif bantype == 4 or bantype == 5 or bantype == 6 or bantype == 9 then -- host
			opsnotify (table_sets ["classnotiban"], string.format (getlang (948), what, op, banwhy))
		elseif bantype == 7 then -- share
			opsnotify (table_sets ["classnotiban"], string.format (getlang (949), what, op, banwhy))
		elseif bantype == 8 then -- prefix
			opsnotify (table_sets ["classnotiban"], string.format (getlang (950), what, op, banwhy))
		else -- other
			opsnotify (table_sets ["classnotiban"], string.format (getlang (963), what, op, banwhy))
		end

		oprankaccept (op, getclass (op))
	end

	return 1
end

----- ---- --- -- -

function VH_OnOperatorKicks (op, nick, data)
if table_othsets ["locked"] == true then return 1 end
local ip = getip (nick)

if isprotected (nick, ip) == true then -- protected
	commandanswer (op, getlang (46))
	return 0
end

local ucl = getclass (nick)
opsnotify (table_sets ["classnotikick"], string.format (getlang (147), nick, ip .. tryipcc (ip, nick), ucl, op, data))
oprankaccept (op, getclass (op))

if (ucl > 0) and (ucl < table_sets ["scanbelowclass"]) then
	if table_sets ["regkickaction"] == 1 then
		local rucl = getregclass (nick)

		if rucl then -- check if physically registered
			opsnotify (table_sets ["classnotikick"], string.format (getlang (281), nick, rucl))
		end

	elseif table_sets ["regkickaction"] == 2 then
		rucl = getregclass (nick)

		if rucl then -- only if registered
			delledouser (nick)
			VH:SQLQuery ("delete from `reglist` where `nick` = '"..repsqlchars (nick).."' limit 1")
			opsnotify (table_sets ["classnotikick"], string.format (getlang (359), nick, rucl))
		end
	end
end

return 1
end

----- ---- --- -- -

function VH_OnOperatorDrops (op, nick)
if table_othsets ["locked"] == true then return 1 end

if isprotected (nick, getip (nick)) == true then -- protected
	commandanswer (op, getlang (46))
	return 0
end

oprankaccept (op, getclass (op))

return 1
end

----- ---- --- -- -

function VH_OnParsedMsgPM (from, data, to)
	if table_othsets ["locked"] == true then
		return 1
	end

	local ip = getip (from)
	local prot = isprotected (from, ip)
	local fcls = getclass (from)

	if prot == false then -- protection
		if (fcls < table_sets ["pmminclass"]) and (to ~= table_othsets ["botnick"]) then
			pmtouser (from, to, getlang (183))
			return 0
		end

		if table_sets ["chatcodeon"] > 0 then -- chatcode
			if fcls <= table_sets ["codemaxclass"] then
				if not table_code [from] then
					local vcode, code = genchatcode ()
					table_code [from] = {["vcode"] = vcode, ["code"] = code, ["lock"] = true}
					local txt = string.gsub (table_sets ["codetext"], "<code>", reprexpchars (vcode))
					pmtouser (from, to, txt)
					return 0
				else
					if table_code [from]["lock"] == true then
						local rcode = table_code [from]["code"]

						if table_sets ["chatcodeon"] == 2 then -- accept lower case
							rcode = string.lower (rcode)
						end

						if (data == rcode) or (data == table_code [from]["code"]) then
							table_code [from]["lock"] = false
							pmtouser (from, to, getlang (606))
						else
							local txt = string.gsub (table_sets ["codetext"], "<code>", reprexpchars (table_code [from]["vcode"]))
							pmtouser (from, to, txt)
						end

						return 0
					end
				end
			end
		end

		if detchatflood (from, fcls, ip, data, to) == true then -- flood detection
			return 0
		end

		if gagipcheck (from, ip, fcls, to, data) == true then
			return 0
		end

		if gagccheck (from, ip, fcls, to, data) == true then
			return 0
		end
	end

	----- ---- --- -- -

	if to == table_othsets ["opchatnick"] then -- operator chat
		if fcls >= 3 then
			if string.find (data, "^"..table_othsets ["optrig"]..table_cmnds ["ophistory"].." %d+$") then
				if table_sets ["histlimit"] > 0 then
					donotifycmd (from, data, 0, fcls)
					sendophistory (from, string.sub (data, string.len (table_cmnds ["ophistory"]) + 3, -1), 0, true)
				else
					pmtouser (from, table_othsets ["opchatnick"], getlang (128))
				end

				return 0
			else
				addophistoryline (from, data) -- log operators chat
			end
		else
			opsnotify (table_sets ["classnotibotpm"], string.format (getlang (432), from, ip .. tryipcc (ip, from), fcls, table_othsets ["opchatnick"], data))
		end

	----- ---- --- -- -

	elseif to == table_othsets ["botnick"] then -- hub security
		if string.find (string.sub (data, 1, 1), table_othsets ["optrig"]) then
			if fcls >= 3 then -- operator command
				if string.find (data, "^"..table_othsets ["optrig"].."luaload .*$") or string.find (data, "^"..table_othsets ["optrig"].."luaunload .*$") or string.find (data, "^"..table_othsets ["optrig"].."luareload .*$") then
					if fcls >= getconfig ("plugin_mod_class") then -- use plugin permission for lua scripts too
						donotifycmd (from, data, 0, fcls)
						savecmdlog (from, fcls, data, true)
					else
						commandanswer (from, getlang (128))
						return 0
					end
				elseif string.find (data, "^"..table_othsets ["optrig"].."lualist.*$") or string.find (data, "^"..table_othsets ["optrig"].."luainfo.*$") or string.find (data, "^"..table_othsets ["optrig"].."luaversion.*$") then
					donotifycmd (from, data, 0, fcls)
					savecmdlog (from, fcls, data, true)
				elseif string.find (data, "^"..table_othsets ["optrig"].."offplug .*$") or string.find (data, "^"..table_othsets ["optrig"].."onplug .*$") or string.find (data, "^"..table_othsets ["optrig"].."replug .*$") or string.find (data, "^"..table_othsets ["optrig"].."modplug .*$") or string.find (data, "^"..table_othsets ["optrig"].."addplug .*$") or string.find (data, "^"..table_othsets ["optrig"].."delplug .*$") then
					if fcls >= getconfig ("plugin_mod_class") then -- check the permissions
						donotifycmd (from, data, 0, fcls)
						savecmdlog (from, fcls, data, true)
					end
				elseif string.find (data, "^"..table_othsets ["optrig"].."lstplug.*$") then
					donotifycmd (from, data, 0, fcls)
					savecmdlog (from, fcls, data, true)
				end
			else
				opsnotify (table_sets ["classnotibotpm"], string.format (getlang (432), from, ip .. tryipcc (ip, from), fcls, table_othsets ["botnick"], data))
			end
		elseif string.find (string.sub (data, 1, 1), table_othsets ["ustrig"]) then
			-- skip
		else
			opsnotify (table_sets ["classnotibotpm"], string.format (getlang (432), from, ip .. tryipcc (ip, from), fcls, table_othsets ["botnick"], data))
		end

	----- ---- --- -- -

	elseif to == table_sets ["ledobotnick"] then -- ledokol bot
		if table_sets ["addledobot"] == 1 then
			if fcls == 10 then
				if string.find (string.sub (data, 1, 1), table_othsets ["optrig"]) then -- accept operator command
					VH_OnOperatorCommand (from, data)
				else
					for x in string.gmatch (getnicklist (), "([^$]+)%$%$") do
						if isbot (x) == false then
							local cl = getclass (x)

							if (x ~= from) and (cl == 10) then -- class 10 only
								VH:SendDataToUser ("$To: "..x.." From: "..to.." $<"..from.."> "..data.."|", x)
							end
						end
					end
				end
			elseif fcls >= 3 then
				if string.find (string.sub (data, 1, 1), table_othsets ["optrig"]) then -- accept operator command
					VH_OnOperatorCommand (from, data)
				end
			else
				opsnotify (table_sets ["classnotibotpm"], string.format (getlang (432), from, ip .. tryipcc (ip, from), fcls, table_sets ["ledobotnick"], data))
				VH:SendDataToUser ("$To: "..from.." From: "..table_sets ["ledobotnick"].." $<"..table_sets ["ledobotnick"].."> "..getlang (9).."|", from)
			end
		end

	----- ---- --- -- -

	elseif table_othsets ["lasttimenick"] and (to == table_othsets ["lasttimenick"]) then -- time bot
		if table_sets ["timebotint"] > 0 then
			opsnotify (table_sets ["classnotibotpm"], string.format (getlang (432), from, ip .. tryipcc (ip, from), fcls, table_othsets ["lasttimenick"], data))
			VH:SendDataToUser ("$To: "..from.." From: "..table_othsets ["lasttimenick"].." $<"..table_othsets ["lasttimenick"].."> "..getlang (9).."|", from)
		end

	----- ---- --- -- -

	else -- other
		if prot == false then -- protection
			if antiscan (from, fcls, data, 2, to, nil) == 0 then -- scan before broadcasting
				return 0
			end
		end

		if broadcastchatroom (to, from, data, fcls) == true then -- check chatrooms
			return 0
		end

		if broadcastccroom (to, from, data, fcls) == true then
			return 0
		end

		-- todo: i dont remember what this is
		--if broadcastcustnick (to, from, data) == true then -- check custom nicks
			--return 0
		--end

		if checknopm (from, fcls, to) == true then -- no pm
			return 0
		end

		if table_sets ["custnickclass"] < 11 then -- use custom nick for sender in receivers message
			local custnick = getcustnick (from)

			if custnick then
				VH:SendDataToUser ("$To: " .. to .. " From: " .. from .. " $<" .. custnick .. "> " .. data .. "|", to)
				return 0
			end
		end
	end

	return 1
end

----- ---- --- -- -

function VH_OnParsedMsgChat (nick, data)
if table_othsets ["locked"] == true then return 1 end
local ucl = getclass (nick)
if ucl < getconfig ("mainchat_class") then return 1 end
local ip = getip (nick)

if isprotected (nick, ip) == false then -- protection
	if table_sets ["chatcodeon"] > 0 then -- chatcode
		if ucl <= table_sets ["codemaxclass"] then
			if not table_code [nick] then
				local vcode, code = genchatcode ()
				table_code [nick] = {["vcode"] = vcode, ["code"] = code, ["lock"] = true}
				local txt = string.gsub (table_sets ["codetext"], "<code>", reprexpchars (vcode))
				maintouser (nick, txt)
				return 0
			else
				if table_code [nick]["lock"] == true then
					local rcode = table_code [nick]["code"]
					if table_sets ["chatcodeon"] == 2 then rcode = string.lower (rcode) end -- accept lower case

					if (data == rcode) or (data == table_code [nick]["code"]) then
						table_code [nick]["lock"] = false
						maintouser (nick, getlang (606))
					else
						local txt = string.gsub (table_sets ["codetext"], "<code>", reprexpchars (table_code [nick]["vcode"]))
						maintouser (nick, txt)
					end

					return 0
				end
			end
		end
	end

	if detchatflood (nick, ucl, ip, data, nil) == true then return 0 end -- flood detection
	if gagipcheck (nick, ip, ucl, nil, data) == true then return 0 end
	if gagccheck (nick, ip, ucl, nil, data) == true then return 0 end
	if antiscan (nick, ucl, data, 1, nil, nil) == 0 then return 0 end -- antispam
end

local fakenick = nick

if table_sets ["funrandomchat"] == 1 then
	fakenick = getrandomnick ()

	if table_sets ["custnickclass"] < 11 then
		fakenick = getcustnick (fakenick) or fakenick -- use custom nick
	end
else
	if table_sets ["custnickclass"] < 11 then
		fakenick = getcustnick (nick) or nick
	end
end

local cvdat = data
local retval = 1

if table_sets ["translitmode"] > 0 then -- convert translit
	cvdat = convtranslit (cvdat, table_sets ["translitmode"])

	if data ~= cvdat then -- only when modified
		if antiscan (nick, ucl, cvdat, 1, nil, nil) == 0 then return 0 end -- spam detection after translit conversion
		retval = 0
	end
end

if (table_sets ["tolowcharcase"] == 1) and (ucl < 3) then -- convert char case
	cvdat = convcaps (cvdat, true)
	if data ~= cvdat then retval = 0 end -- only when modified
end

	cvdat = modusrmode (nick, ip, cvdat) -- chat mode

	if table_sets ["replrunning"] == 1 then -- replacer
		local norepl = cvdat
		cvdat = replchatmsg (nick, ucl, cvdat)

		if norepl ~= cvdat then
			opsnotify (table_sets ["classnotirepl"], string.format (getlang (932), ucl, nick, data))
		end
	end

	if data ~= cvdat then
		retval = 0 -- only when modified
	end

if table_sets ["useripinchat"] > 0 then -- ip in chat
	local pfx = ""

	if (table_sets ["useripinchat"] == 2) and (table_othsets ["func_getcc"] == true) then
		local cc = getcc (nick)
		if (not cc) or (cc == "--") then cc = "??" end
		pfx = "[ "..ip.." &#124; "..cc.." ]"
	else
		pfx = "[ "..ip.." ]"
	end

	VH:SendDataToAll ("<"..fakenick.."> "..cvdat.."|", 0, 2)
	VH:SendDataToAll (pfx.." <"..fakenick.."> "..cvdat.."|", 3, 10)
	retval = 0
else -- no ip
	if (retval == 0) or (fakenick ~= nick) then -- only when modified
		VH:SendDataToAll ("<"..fakenick.."> "..cvdat.."|", 0, 10)
		retval = 0
	end
end

addmchistoryline (fakenick, nick, cvdat)
replyresponder (fakenick, ucl, cvdat)
chatrankaccept (nick, ucl)
wordrankaccept (nick, ucl, cvdat)

return retval
end

---------------------------------------------------------------------
-- verlihub event functions <<
---------------------------------------------------------------------

---------------------------------------------------------------------
-- ledokol functions >>
---------------------------------------------------------------------

function forcewelcome (nick, item, cls)
if string.find (item, "^%S+ %S+ .+$") then
local _, _, stype = string.find (item, "^(%S+) %S+ .+$")

if (stype == "in") or (stype == "out") then
local _, _, user, item = string.find (item, "^%S+ (%S+) (.+)$")

if (getstatus (user) == 1) and ((table_sets ["welcomeclass"] == 11) or (getclass (user) < table_sets ["welcomeclass"])) then
commandanswer (nick, getlang (469))
else
local auser = repsqlchars (user)
local _, rows = VH:SQLQuery ("select `nick` from `"..tbl_sql ["wm"].."` where `nick` = '"..auser.."' limit 1")

if rows > 0 then
VH:SQLQuery ("update `"..tbl_sql ["wm"].."` set `"..stype.."` = '"..repsqlchars (item).."' where `nick` = '"..auser.."' limit 1")
else
VH:SQLQuery ("insert into `"..tbl_sql ["wm"].."` (`nick`, `"..stype.."`) values ('"..auser.."', '"..repsqlchars (item).."')")
end

item = string.gsub (item, "%*", reprexpchars (user))

if stype == "in" then
commandanswer (nick, string.format (getlang (485), user, item))
opsnotify (table_sets ["classnotiwelcome"], string.format (getlang (496), nick, cls, user, item))
elseif stype == "out" then
commandanswer (nick, string.format (getlang (495), user, item))
opsnotify (table_sets ["classnotiwelcome"], string.format (getlang (497), nick, cls, user, item))
end
end

else -- unknown type
commandanswer (nick, string.format (getlang (100), "in "..getlang (70).." out"))
end

else -- deleting
local _, _, stype = string.find (item, "^(%S+) %S+$")

if stype == "in" then
local _, _, user = string.find (item, "^%S+ (%S+)$")

if (getstatus (user) == 1) and ((table_sets ["welcomeclass"] == 11) or (getclass (user) < table_sets ["welcomeclass"])) then
commandanswer (nick, getlang (469))
else
local anick = repsqlchars (user)
VH:SQLQuery ("update `"..tbl_sql ["wm"].."` set `in` = '' where `nick` = '"..anick.."' limit 1")
VH:SQLQuery ("delete from `"..tbl_sql ["wm"].."` where `nick` = '"..anick.."' and `out` = '' limit 1")
commandanswer (nick, string.format (getlang (498), user))
opsnotify (table_sets ["classnotiwelcome"], string.format (getlang (500), nick, cls, user))
end

elseif stype == "out" then
local _, _, user = string.find (item, "^%S+ (%S+)$")

if (getstatus (user) == 1) and ((table_sets ["welcomeclass"] == 11) or (getclass (user) < table_sets ["welcomeclass"])) then
commandanswer (nick, getlang (469))
else
local anick = repsqlchars (user)
VH:SQLQuery ("update `"..tbl_sql ["wm"].."` set `out` = '' where `nick` = '"..anick.."' limit 1")
VH:SQLQuery ("delete from `"..tbl_sql ["wm"].."` where `nick` = '"..anick.."' and `in` = '' limit 1")
commandanswer (nick, string.format (getlang (499), user))
opsnotify (table_sets ["classnotiwelcome"], string.format (getlang (501), nick, cls, user))
end

else -- unknown type
commandanswer (nick, string.format (getlang (100), "in "..getlang (70).." out"))
end
end
end

----- ---- --- -- -

function listwelcome (nick)
local _, rows = VH:SQLQuery ("select `nick`, `in`, `out` from `"..tbl_sql ["wm"].."` order by `nick` asc")

if rows > 0 then
local anentry = ""

for x = 0, rows - 1 do
local _, user, inm, outm = VH:SQLFetch (x)
inm = string.gsub (inm, "%*", reprexpchars (user))
outm = string.gsub (outm, "%*", reprexpchars (user))
anentry = anentry.."\r\n "..getlang (254)..": "..user.."\r\n "..getlang (255)..": "..inm.."\r\n "..getlang (256)..": "..outm.."\r\n"
end

commandanswer (nick, getlang (252)..":\r\n"..anentry)
else
commandanswer (nick, getlang (257))
end
end

----- ---- --- -- -

function delwelcome (nick, item, cls)
local aitem = repsqlchars (item)
local _, rows = VH:SQLQuery ("select `nick` from `"..tbl_sql ["wm"].."` where `nick` = '"..aitem.."' limit 1")

if rows > 0 then
VH:SQLQuery ("delete from `"..tbl_sql ["wm"].."` where `nick` = '"..aitem.."' limit 1")
commandanswer (nick, string.format (getlang (258), item))
opsnotify (table_sets ["classnotiwelcome"], string.format (getlang (502), nick, cls, item))
else
commandanswer (nick, string.format (getlang (259), item))
end
end

----- ---- --- -- -

function setwelcome (nick, item, cls)
if string.find (item, "^%S+ .+$") then
local _, _, stype = string.find (item, "^(%S+) .+$")

if (stype == "in") or (stype == "out") then
local _, _, item = string.find (item, "^%S+ (.+)$")
local anick = repsqlchars (nick)
local _, rows = VH:SQLQuery ("select `nick` from `"..tbl_sql ["wm"].."` where `nick` = '"..anick.."' limit 1")

if rows > 0 then
VH:SQLQuery ("update `"..tbl_sql ["wm"].."` set `"..stype.."` = '"..repsqlchars (item).."' where `nick` = '"..anick.."' limit 1")
else
VH:SQLQuery ("insert into `"..tbl_sql ["wm"].."` (`nick`, `"..stype.."`) values ('"..anick.."', '"..repsqlchars (item).."')")
end

item = string.gsub (item, "%*", reprexpchars (nick))

if stype == "in" then
commandanswer (nick, string.format (getlang (260), item))
opsnotify (table_sets ["classnotiwelcome"], string.format (getlang (261), nick, cls, item))
elseif stype == "out" then
commandanswer (nick, string.format (getlang (262), item))
opsnotify (table_sets ["classnotiwelcome"], string.format (getlang (263), nick, cls, item))
end

else -- unknown type
commandanswer (nick, string.format (getlang (100), "in "..getlang (70).." out"))
end

else -- deleting
local stype = item

if stype == "in" then
local anick = repsqlchars (nick)
VH:SQLQuery ("update `"..tbl_sql ["wm"].."` set `in` = '' where `nick` = '"..anick.."' limit 1")
VH:SQLQuery ("delete from `"..tbl_sql ["wm"].."` where `nick` = '"..anick.."' and `out` = '' limit 1")
commandanswer (nick, getlang (491))
opsnotify (table_sets ["classnotiwelcome"], string.format (getlang (493), nick, cls))

elseif stype == "out" then
local anick = repsqlchars (nick)
VH:SQLQuery ("update `"..tbl_sql ["wm"].."` set `out` = '' where `nick` = '"..anick.."' limit 1")
VH:SQLQuery ("delete from `"..tbl_sql ["wm"].."` where `nick` = '"..anick.."' and `in` = '' limit 1")
commandanswer (nick, getlang (492))
opsnotify (table_sets ["classnotiwelcome"], string.format (getlang (494), nick, cls))

else -- unknown type
commandanswer (nick, string.format (getlang (100), "in "..getlang (70).." out"))
end
end
end

----- ---- --- -- -

function showwelcome (nick)
local _, rows = VH:SQLQuery ("select `in`, `out` from `"..tbl_sql ["wm"].."` where `nick` = '"..repsqlchars (nick).."' limit 1")

if rows > 0 then
local _, inm, outm = VH:SQLFetch (0)
inm = string.gsub (inm, "%*", reprexpchars (nick))
commandanswer (nick, string.format (getlang (265), inm))
outm = string.gsub (outm, "%*", reprexpchars (nick))
commandanswer (nick, string.format (getlang (483), outm))
else
commandanswer (nick, getlang (264))
end
end

----- ---- --- -- -

function sendwelcomein (nick, ucl)
	if ucl < table_sets ["welcomeclass"] then return nil end
	local _, rows = VH:SQLQuery ("select `in` from `"..tbl_sql ["wm"].."` where `nick` = '"..repsqlchars (nick).."' and `in` != '' limit 1")

	if rows > 0 then
		local _, cmsg = VH:SQLFetch (0)

		if table_sets ["custnickclass"] < 11 then
			cmsg = string.gsub (cmsg, "%*", reprexpchars (getcustnick (nick) or nick))
		else
			cmsg = string.gsub (cmsg, "%*", reprexpchars (nick))
		end

		maintoall (cmsg, 0, 10)
	end
end

----- ---- --- -- -

function sendwelcomeout (nick, ucl)
	if ucl < table_sets ["welcomeclass"] then return nil end
	local _, rows = VH:SQLQuery ("select `out` from `"..tbl_sql ["wm"].."` where `nick` = '"..repsqlchars (nick).."' and `out` != '' limit 1")

	if rows > 0 then
		local _, cmsg = VH:SQLFetch (0)

		if table_sets ["custnickclass"] < 11 then
			cmsg = string.gsub (cmsg, "%*", reprexpchars (getcustnick (nick) or nick))
		else
			cmsg = string.gsub (cmsg, "%*", reprexpchars (nick))
		end

		maintoall (cmsg, 0, 10)
	end
end

----- ---- --- -- -

function addchatroom (nick, item)
	local _, _, room, desc, minc, maxc, cc = string.find (item, "^(%S+) (.*) (%d+) (%d+) (%S+)$")
	minc, maxc = tonumber (minc), tonumber (maxc)

	if ((minc > 5) and (minc < 10)) or (minc > 10) or ((maxc > 5) and (maxc < 10)) or (maxc > 10) then -- invalid class
		commandanswer (nick, string.format (getlang (143), "0, 1, 2, 3, 4, 5 "..getlang (70).." 10"))
	else
		local entry = repsqlchars (room)
		local _, rows = VH:SQLQuery ("select `minclass` from `"..tbl_sql ["chat"].."` where `room` = '"..entry.."' limit 1")

		if rows > 0 then
			VH:SQLQuery ("update `"..tbl_sql ["chat"].."` set `description` = '"..repsqlchars (desc).."', `minclass` = "..minc..", `maxclass` = "..maxc..", `cc` = '"..repsqlchars (string.upper (cc)).."' where `room` = '"..entry.."' limit 1")
			commandanswer (nick, string.format (getlang (272), room))
		else
			if getstatus (room) == 0 then
				VH:SQLQuery ("insert into `"..tbl_sql ["chat"].."` (`room`, `description`, `minclass`, `maxclass`, `cc`) values ('"..entry.."', '"..repsqlchars (desc).."', "..minc..", "..maxc..", '"..repsqlchars (string.upper (cc)).."')")
				if table_sets ["chatrunning"] == 1 then addhubrobot (room, desc, 1, "", 0) end
				commandanswer (nick, string.format (getlang (273), room))
			else -- nick is already in use
				commandanswer (nick, string.format (getlang (304), room))
			end
		end
	end
end

----- ---- --- -- -

function delchatroom (nick, item)
	local aitem = repsqlchars (item)
	local _, rows = VH:SQLQuery ("select `minclass` from `"..tbl_sql ["chat"].."` where `room` = '"..aitem.."' limit 1")

	if rows > 0 then
		VH:SQLQuery ("delete from `"..tbl_sql ["chat"].."` where `room` = '"..aitem.."' limit 1")
		if table_sets ["chatrunning"] == 1 then delhubrobot (item) end
		table_chat [item] = nil -- delete ignore list
		commandanswer (nick, string.format (getlang (274), item))
	else
		commandanswer (nick, string.format (getlang (275), item))
	end
end

----- ---- --- -- -

function listchatroom (nick)
	local _, rows = VH:SQLQuery ("select `room`, `description`, `minclass`, `maxclass`, `cc` from `"..tbl_sql ["chat"].."` order by `minclass` asc, `maxclass` desc")

	if rows > 0 then
		local anentry = ""

		for x = 0, rows - 1 do
			local _, room, desc, minc, maxc, cc = VH:SQLFetch (x)
			anentry = anentry.."\r\n "..getlang (276)..": "..room.." [ "..minc.." / "..maxc.." / "..cc.." ]\r\n "..getlang (277)..": "..desc.."\r\n"
		end

		commandanswer (nick, getlang (267)..":\r\n"..anentry)
	else
		commandanswer (nick, getlang (278))
	end
end

----- ---- --- -- -

function installchatrooms ()
	local _, rows = VH:SQLQuery ("select `room`, `description` from `"..tbl_sql ["chat"].."`")

	for x = 0, rows - 1 do
		local _, room, desc = VH:SQLFetch (x)
		addhubrobot (room, desc, 1, "", 0)
	end
end

----- ---- --- -- -

function uninstallchatrooms ()
	local _, rows = VH:SQLQuery ("select `room` from `"..tbl_sql ["chat"].."`")

	for x = 0, (tonumber (rows) or 0) - 1 do -- verlihub bug
		local _, room = VH:SQLFetch (x)
		delhubrobot (room)
	end

	table_chat = {} -- clear ignore list
end

----- ---- --- -- -

function uninstallccrooms ()
	for k, _ in pairs (table_room) do
		local robot = string.gsub (table_sets ["ccroomstyle"], "<cc>", reprexpchars (k))
		robot = string.gsub (robot, "<cn>", reprexpchars (cc_names [k] or getlang (516)))
		robot = string.gsub (robot, string.char (32), string.char (160)) -- space to non-breaking space
		delhubrobot (robot)
		table_room [k] = nil
	end
end

----- ---- --- -- -

function getccroommember (nick, cc)
	for k, v in pairs (table_room [cc]) do
		if nick == v then
			return k
		end
	end

	return 0
end

----- ---- --- -- -

function getchatroomignore (nick, room)
	if table_chat [room] then
		for k, v in pairs (table_chat [room]) do
			if nick == v then
				return k
			end
		end
	end

	return 0
end

----- ---- --- -- -

function addccroommember (nick, class)
	if table_othsets ["func_getcc"] == false then return nil end
	if table_sets ["ccroomrunning"] == 0 then return nil end
	if isbot (nick) == true then return nil end
	if class < table_sets ["ccroomautocls"] then return nil end -- auto class condition
	local cc = getcc (nick)
	if not cc then return nil end
	if cc == "--" then return nil end
	local robot = string.gsub (table_sets ["ccroomstyle"], "<cc>", reprexpchars (cc)) -- create robot nick
	robot = string.gsub (robot, "<cn>", reprexpchars (cc_names [cc] or getlang (516)))
	robot = string.gsub (robot, string.char (32), string.char (160)) -- space to non-breaking space

	if table_room [cc] then -- room exists
		if getccroommember (nick, cc) == 0 then -- add user to member list
			table.insert (table_room [cc], nick)
			edithubrobot (robot, string.format (getlang (614), (cc_names [cc] or getlang (516))), 1, "", table.getn (table_room [cc]))
		end
	else -- create new room
		table_room [cc] = {nick}
		addhubrobot (robot, string.format (getlang (614), (cc_names [cc] or getlang (516))), 1, "", 1)
	end
end

----- ---- --- -- -

function chatroomhelp ()
	local ustrig = string.sub (getconfig ("cmd_start_user"), 1, 1)
	local txt = " "..ustrig..table_cmnds ["chatenter"].." - "..getlang (627).."\r\n"
	txt = txt.." "..ustrig..table_cmnds ["chatleave"].." - "..getlang (628).."\r\n"
	txt = txt.." "..ustrig..table_cmnds ["chatusers"].." - "..getlang (621).."\r\n"
	txt = txt.." "..ustrig..table_cmnds ["chathelp"].." - "..getlang (179).."\r\n"
	return txt
end

----- ---- --- -- -

function broadcastccroom (to, nick, data, class) -- cc based chatroom
if table_othsets ["func_getcc"] == false then return false end
if table_sets ["ccroomrunning"] == 0 then return false end

for k, v in pairs (table_room) do
	local robot = string.gsub (table_sets ["ccroomstyle"], "<cc>", reprexpchars (k))
	robot = string.gsub (robot, "<cn>", reprexpchars (cc_names [k] or getlang (516)))
	robot = string.gsub (robot, string.char (32), string.char (160)) -- space to non-breaking space

	if robot == to then -- room match
		local mem = getccroommember (nick, k)
		local _, _, cmd = string.find (data, "^"..table_othsets ["ustrig"].."(%S+).*$")

		if mem > 0 then -- is member
			if cmd then -- user command
				if cmd == table_cmnds ["chatenter"] then
					VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..getlang (623).."|", nick)

				elseif cmd == table_cmnds ["chatleave"] then
					table.remove (table_room [k], mem)
					VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..getlang (615).."|", nick)

					if table_sets ["roomusernotify"] == 1 then -- notification
						for _, x in pairs (v) do
							if x ~= nick then -- skip self
								VH:SendDataToUser ("$To: "..x.." From: "..to.." $<"..to.."> "..string.format (getlang (616), nick).."|", x)
							end
						end
					end

				elseif cmd == table_cmnds ["chatusers"] then
					local list = ""
					for c, x in pairs (v) do list = list.." "..c..". "..x.."\r\n" end
					VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..getlang (621)..":\r\n\r\n"..list.."|", nick)

				elseif cmd == table_cmnds ["chathelp"] then
					VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..getlang (624)..":\r\n\r\n"..chatroomhelp ().."|", nick)

				else -- unknown command
					VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..string.format (getlang (626), string.sub (getconfig ("cmd_start_user"), 1, 1)..table_cmnds ["chathelp"]).."|", nick)
				end

			else -- regular message
				for _, x in pairs (v) do
					if x ~= nick then -- skip self
						VH:SendDataToUser ("$To: "..x.." From: "..to.." $<"..nick.."> "..data.."|", x)
					end
				end
			end

		else -- not member
			if class < table_sets ["ccroommancls"] then
				local mtip = getip (nick)
				opsnotify (table_sets ["classnotibotpm"], string.format (getlang (432), nick, mtip .. tryipcc (mtip, nick), class, to, data))
				VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..getlang (620).."|", nick)
			else
				if cmd then -- user command
					if cmd == table_cmnds ["chatenter"] then
						table.insert (table_room [k], nick)
						VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..string.format (getlang (618), k).."|", nick)

						if table_sets ["roomusernotify"] == 1 then -- notification
							for _, x in pairs (v) do
								if x ~= nick then -- skip self
									VH:SendDataToUser ("$To: "..x.." From: "..to.." $<"..to.."> "..string.format (getlang (617), nick).."|", x)
								end
							end
						end

					elseif cmd == table_cmnds ["chatleave"] then
						VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..getlang (619).."|", nick)

					elseif cmd == table_cmnds ["chatusers"] then
						local list = ""
						for c, x in pairs (v) do list = list.." "..c..". "..x.."\r\n" end

						if list == "" then
							VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..getlang (622).."|", nick)
						else
							VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..getlang (621)..":\r\n\r\n"..list.."|", nick)
						end

					elseif cmd == table_cmnds ["chathelp"] then
						VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..getlang (624)..":\r\n\r\n"..chatroomhelp ().."|", nick)

					else -- unknown command
						VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..string.format (getlang (626), string.sub (getconfig ("cmd_start_user"), 1, 1)..table_cmnds ["chathelp"]).."|", nick)
					end

				else -- regular message
					VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..getlang (619).."|", nick)
				end
			end
		end

	return true
	end
end

return false
end

----- ---- --- -- -

function broadcastcustnick (to, nick, data)
	if table_sets ["custnickclass"] == 11 then return false end
	local rnick = findcustnick (to)

	if rnick then -- match
		VH:SendDataToUser ("$To: "..rnick.." From: "..nick.." $<"..nick.."> "..data.."|", rnick)
		return true
	end

	return false
end

----- ---- --- -- -

function broadcastchatroom (to, nick, data, ucl) -- class based chatroom
	if table_sets ["chatrunning"] == 0 then return false end
	local _, rows = VH:SQLQuery ("select `room`, `minclass`, `maxclass`, `cc` from `"..tbl_sql ["chat"].."`")
	if rows == 0 then return false end

	for x = 0, rows - 1 do
		local _, room, minc, maxc, cc = VH:SQLFetch (x)

		if room == to then -- room match
			minc, maxc = tonumber (minc), tonumber (maxc)

			if (ucl >= minc) and (ucl <= maxc) and ((table_othsets ["func_getcc"] == false) or (cc == "*") or (cc == getcc (nick))) then -- is member
				local ign = getchatroomignore (nick, to)
				local _, _, cmd = string.find (data, "^"..table_othsets ["ustrig"].."(%S+).*$")

				if cmd then -- user command
					if cmd == table_cmnds ["chatenter"] then
						if ign > 0 then -- remove from ignore list
							table.remove (table_chat [to], ign)
							VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..string.format (getlang (618), to).."|", nick)

							if table_sets ["roomusernotify"] == 1 then -- notification
								for x in string.gmatch (getnicklist (), "([^$]+)%$%$") do
									if isbot (x) == false then
										local cl = getclass (x)

										if (x ~= nick) and (cl >= minc) and (cl <= maxc) and ((table_othsets ["func_getcc"] == false) or (cc == "*") or (cc == getcc (x))) and (getchatroomignore (x, to) == 0) then -- skip self
											VH:SendDataToUser ("$To: "..x.." From: "..to.." $<"..to.."> "..string.format (getlang (617), nick).."|", x)
										end
									end
								end
							end
						else -- not ignoring
							VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..getlang (623).."|", nick)
						end

					elseif cmd == table_cmnds ["chatleave"] then
						if ign > 0 then -- already ignoring
							VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..getlang (619).."|", nick)
						else -- add to ignore list
							if table_chat [to] then -- ignore list exists
								table.insert (table_chat [to], nick)
							else -- create ignore list
								table_chat [to] = {nick}
							end

							VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..getlang (615).."|", nick)

							if table_sets ["roomusernotify"] == 1 then -- notification
								for x in string.gmatch (getnicklist (), "([^$]+)%$%$") do
									if isbot (x) == false then
										local cl = getclass (x)

										if (x ~= nick) and (cl >= minc) and (cl <= maxc) and ((table_othsets ["func_getcc"] == false) or (cc == "*") or (cc == getcc (x))) and (getchatroomignore (x, to) == 0) then -- skip self
											VH:SendDataToUser ("$To: "..x.." From: "..to.." $<"..to.."> "..string.format (getlang (616), nick).."|", x)
										end
									end
								end
							end
						end

					elseif cmd == table_cmnds ["chatusers"] then
						local list = ""
						local c = 1

						for x in string.gmatch (getnicklist (), "([^$]+)%$%$") do
							if isbot (x) == false then
								local cl = getclass (x)

								if (cl >= minc) and (cl <= maxc) and ((table_othsets ["func_getcc"] == false) or (cc == "*") or (cc == getcc (x))) and (getchatroomignore (x, to) == 0) then
									list = list.." "..c..". "..x.."\r\n"
									c = c + 1
								end
							end
						end

						if list == "" then
							VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..getlang (622).."|", nick)
						else
							VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..getlang (621)..":\r\n\r\n"..list.."|", nick)
						end

					elseif cmd == table_cmnds ["chathelp"] then
						VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..getlang (624)..":\r\n\r\n"..chatroomhelp ().."|", nick)

					else -- unknown command
						VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..string.format (getlang (626), string.sub (getconfig ("cmd_start_user"), 1, 1)..table_cmnds ["chathelp"]).."|", nick)
					end

				else -- regular message
					if ign > 0 then -- ignoring
						VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..getlang (619).."|", nick)
					else -- broadcast
						for x in string.gmatch (getnicklist (), "([^$]+)%$%$") do
							if isbot (x) == false then
								local cl = getclass (x)

								if (x ~= nick) and (cl >= minc) and (cl <= maxc) and ((table_othsets ["func_getcc"] == false) or (cc == "*") or (cc == getcc (x))) and (getchatroomignore (x, to) == 0) then -- skip self
									VH:SendDataToUser ("$To: "..x.." From: "..to.." $<"..nick.."> "..data.."|", x)
								end
							end
						end
					end
				end

			else -- not member
				local mtip = getip (nick)
				opsnotify (table_sets ["classnotibotpm"], string.format (getlang (432), nick, mtip .. tryipcc (mtip, nick), ucl, to, data))
				VH:SendDataToUser ("$To: "..nick.." From: "..to.." $<"..to.."> "..getlang (620).."|", nick)
			end

			return true
		end
	end

	return false
end

----- ---- --- -- -

function delccroommember (nick)
if table_othsets ["func_getcc"] == false then return nil end
if table_sets ["ccroomrunning"] == 0 then return nil end
if isbot (nick) == true then return nil end

for k, _ in pairs (table_room) do -- remove user from all rooms
	local mem = getccroommember (nick, k)

	if mem > 0 then
		table.remove (table_room [k], mem)
		local robot = string.gsub (table_sets ["ccroomstyle"], "<cc>", reprexpchars (k)) -- create robot nick
		robot = string.gsub (robot, "<cn>", reprexpchars (cc_names [k] or getlang (516)))
		robot = string.gsub (robot, string.char (32), string.char (160)) -- space to non-breaking space

		if table.getn (table_room [k]) == 0 then -- remove the room itself when empty
			delhubrobot (robot)
			table_room [k] = nil
		else -- modify room
			edithubrobot (robot, string.format (getlang (614), (cc_names [k] or getlang (516))), 1, "", table.getn (table_room [k]))
		end
	end
end
end

----- ---- --- -- -

function ischatroom (nick)
	local _, rows = VH:SQLQuery ("select `room` from `"..tbl_sql ["chat"].."` where `room` = '"..repsqlchars (nick).."'")

	if rows > 0 then
		return true
	end

	return false
end

----- ---- --- -- -

function getcustnick (nick)
	local _, rows = VH:SQLQuery ("select `custom` from `" .. tbl_sql ["cust"] .. "` where `nick` = '" .. repsqlchars (nick) .. "' limit 1")

	if rows > 0 then
		local _, value = VH:SQLFetch (0)
		return value
	else
		local lownick = tolow (nick)

		for key, value in pairs (table_cust) do
			if tolow (key) == lownick then
				return value
			end
		end
	end

	return nil
end

----- ---- --- -- -

function getrealnick (nick, custom)
	local rnick = findcustnick (custom)

	if not rnick then
		if getstatus (custom) == 1 then
			commandanswer (nick, getlang (424))
		else
			commandanswer (nick, getlang (368))
		end
	else
		local stsword = ""

		if getstatus (rnick) == 1 then
			stsword = getlang (371)
		else
			stsword = getlang (370)
		end

		commandanswer (nick, string.format (getlang (369), stsword, rnick))
	end
end

----- ---- --- -- -

function findcustnick (nick)
	local _, rows = VH:SQLQuery ("select `nick` from `"..tbl_sql ["cust"].."` where `custom` = '"..repsqlchars (nick).."'")

	if rows > 0 then
		local _, val = VH:SQLFetch (0)
		return val
	else
		local lnick = tolow (nick)

		for k, v in pairs (table_cust) do
			if tolow (v) == lnick then
				return k
			end
		end

		return nil
	end
end

----- ---- --- -- -

function addcustnick (nick, custom)
	local nnick = repsqlchars (nick)
	local _, rows = VH:SQLQuery ("select `custom` from `"..tbl_sql ["cust"].."` where `nick` = '"..nnick.."'")

	if rows > 0 then
		local _, old = VH:SQLFetch (0)
		VH:SendDataToAll ("$Quit "..old.."|", 0, 10)
		VH:SQLQuery ("update `"..tbl_sql ["cust"].."` set `custom` = '"..repsqlchars (custom).."' where `nick` = '"..nnick.."'")
	else
		VH:SQLQuery ("insert into `"..tbl_sql ["cust"].."` (`nick`, `custom`) values ('"..nnick.."', '"..repsqlchars (custom).."')")
	end

	--if getconfig ("send_user_ip") == 1 then
		--local ip = getip (nick)

		--if ip ~= "[unknown]" then
			--VH:SendDataToAll ("$UserIP "..custom.." "..ip.."$$|", 3, 10)
		--end
	--end
end

----- ---- --- -- -

function cleancustnick (limit, byclass)
	local _, rows = VH:SQLQuery ("select `nick`, `custom` from `"..tbl_sql ["cust"].."`")

	if rows > 0 then
		local table_delete = {}

		for x = 0, rows - 1 do
			local _, nick, custom = VH:SQLFetch (x)

			if byclass == 0 then
				if string.len (custom) > limit then
					table_delete [nick] = custom
				end
			else
				if getclass (nick) < limit then
					table_delete [nick] = custom
				end
			end
		end

		for k, v in pairs (table_delete) do
			VH:SQLQuery ("delete from `"..tbl_sql ["cust"].."` where `nick` = '"..repsqlchars (k).."'")

			if getstatus (k) == 1 then
				if table_sets ["classnoticust"] ~= 11 then
					maintoall (string.format (getlang (20), v, k), table_sets ["classnoticust"], 10)
				end
			end

			VH:SendDataToAll ("$Quit "..v.."|", 0, 10)
		end
	end
end

----- ---- --- -- -

function delcustnick (nick, cls, quit)
	local lnick = tolow (nick)

	for k, v in pairs (table_cust) do
		if (tolow (k) == lnick) or (tolow (v) == lnick) then
			table_cust [k] = nil

			if quit == true then
				VH:SendDataToAll ("$Quit "..v.."|", 0, 10)
			end

			return v
		end
	end

	if cls >= table_sets ["custnickclass"] then
		lnick = repsqlchars (nick)
		local _, rows = VH:SQLQuery ("select `custom` from `"..tbl_sql ["cust"].."` where `nick` = '"..lnick.."' or `custom` = '"..lnick.."'")

		if rows > 0 then
			local _, cust = VH:SQLFetch (0)
			VH:SQLQuery ("delete from `"..tbl_sql ["cust"].."` where `custom` = '"..repsqlchars (cust).."'")

			if quit == true then
				VH:SendDataToAll ("$Quit "..cust.."|", 0, 10)
			end

			return cust
		end
	end

	return nil
end

----- ---- --- -- -

function resetrealnick (nick)
	local lnick = tolow (nick)

	for k, v in pairs (table_cust) do
		if tolow (v) == lnick then
			maintoall (string.format (getlang (280), nick, k), 0, 10)
			table_cust [k] = nil
			return nil
		end
	end

	if table_sets ["custnickclass"] ~= 11 then -- might be enabled after user login, results a conflict
		local _, rows = VH:SQLQuery ("select `nick` from `"..tbl_sql ["cust"].."` where `custom` = '"..repsqlchars (nick).."' limit 1")

		if rows > 0 then
			local _, cust = VH:SQLFetch (0)
			VH:SQLQuery ("delete from `"..tbl_sql ["cust"].."` where `nick` = '"..repsqlchars (cust).."' limit 1")
			maintoall (string.format (getlang (280), nick, cust), 0, 10)
		end
	end
end

----- ---- --- -- -

function opforcecustnick (nick, line)
	local _, _, onick, ncust = string.find (line, "^(%S+) (.+)$")

	if table_sets ["custnickclass"] == 11 then
		commandanswer (nick, getlang (788))
	elseif getstatus (onick) == 0 then
		commandanswer (nick, string.format (getlang (468), onick))
	elseif string.len (ncust) > table_sets ["custmaxlen"] then
		commandanswer (nick, string.format (getlang (328), table_sets ["custmaxlen"]))
	else
		local oldcust = getcustnick (onick)
		ncust = repnickchars (ncust)

		if (getstatus (ncust) == 0) and (not getregclass (ncust)) and (not findcustnick (ncust)) then
			if getclass (onick) < table_sets ["custnickclass"] then -- temporary nick
				table_cust [onick] = ncust

				if oldcust then
					VH:SendDataToAll ("$Quit "..oldcust.."|", 0, 10)
				end

				--if getconfig ("send_user_ip") == 1 then
					--local ip = getip (onick)

					--if ip ~= "[unknown]" then
						--VH:SendDataToAll ("$UserIP "..ncust.." "..ip.."$$|", 3, 10)
					--end
				--end
			else
				addcustnick (onick, ncust)
			end

			if table_sets ["classnoticust"] == 11 then
				commandanswer (nick, string.format (getlang (539), (oldcust or getcsnick (onick) or onick), ncust))
			else
				maintoall (string.format (getlang (535), (getcustnick (nick) or nick), (oldcust or getcsnick (onick) or onick), ncust), table_sets ["classnoticust"], 10)
			end
		else -- nick already exists in list
			commandanswer (nick, string.format (getlang (248), ncust))
		end
	end
end

----- ---- --- -- -

function opdelcustnick (nick, user)
	local luser, orig, cust, ok = repsqlchars (user), "", "", false
	local _, rows = VH:SQLQuery ("select `nick`, `custom` from `"..tbl_sql ["cust"].."` where `nick` = '"..luser.."' or `custom` = '"..luser.."'")

	if rows > 0 then
		_, orig, cust = VH:SQLFetch (0)
		VH:SQLQuery ("delete from `"..tbl_sql ["cust"].."` where `nick` = '"..repsqlchars (orig).."'")
		ok = true
	else
		luser = tolow (user)

		for k, v in pairs (table_cust) do
			if (tolow (k) == luser) or (tolow (v) == luser) then
				orig = k
				cust = v
				table_cust [k] = nil
				ok = true
				break
			end
		end
	end

	if ok == true then
		if getstatus (orig) == 1 then
			if table_sets ["classnoticust"] == 11 then
				commandanswer (nick, string.format (getlang (20), cust, (getcsnick (orig) or orig)))
			else
				maintoall (string.format (getlang (20), cust, (getcsnick (orig) or orig)), table_sets ["classnoticust"], 10)
			end
		else
			commandanswer (nick, string.format (getlang (330), orig))
		end

		VH:SendDataToAll ("$Quit "..cust.."|", 0, 10)
	else
		commandanswer (nick, string.format (getlang (331), user))
	end
end

----- ---- --- -- -

function resetcustnicks ()
	if table_sets ["custnickclass"] == 11 then return nil end
	if table_sets ["savecustnicks"] == 1 then return nil end
	local _, rows = VH:SQLQuery ("select `nick`, `custom` from `"..tbl_sql ["cust"].."`")
	if type (rows) ~= "number" then return nil end

	if rows > 0 then
		local table_delete = {}

		for x = 0, rows - 1 do
			local _, nick, custom = VH:SQLFetch (x)
			table_delete [nick] = custom
		end

		for k, v in pairs (table_delete) do
			VH:SQLQuery ("delete from `"..tbl_sql ["cust"].."` where `nick` = '"..repsqlchars (k).."'")

			if getstatus (k) == 1 then
				if table_sets ["classnoticust"] ~= 11 then
					maintoall (string.format (getlang (20), v, k), table_sets ["classnoticust"], 10)
				end
			end
		end
	end
end

----- ---- --- -- -

function setcustnick (nick, custom, ucl)
if isprotected (nick, getip (nick)) == false then -- protection
	if table_sets ["chatcodeon"] > 0 then -- chatcode
		if ucl <= table_sets ["codemaxclass"] then
			if not table_code [nick] then
				local vcode, code = genchatcode ()
				table_code [nick] = {["vcode"] = vcode, ["code"] = code, ["lock"] = true}
				local txt = string.gsub (table_sets ["codetext"], "<code>", reprexpchars (vcode))
				maintouser (nick, txt)
				return nil
			else
				if table_code [nick]["lock"] == true then
					local txt = string.gsub (table_sets ["codetext"], "<code>", reprexpchars (table_code [nick]["vcode"]))
					maintouser (nick, txt)
					return nil
				end
			end
		end
	end
end

if string.len (custom) == 0 then -- user is resetting his nick
	local oldcust = getcustnick (nick)

	if oldcust then
		delcustnick (nick, ucl, true)

		if table_sets ["classnoticust"] == 11 then
			commandanswer (nick, string.format (getlang (538), nick))
		else
			maintoall (string.format (getlang (20), oldcust, nick), table_sets ["classnoticust"], 10)
		end
	else
		commandanswer (nick, getlang (797))
	end

elseif string.len (custom) > table_sets ["custmaxlen"] then
	commandanswer (nick, string.format (getlang (328), table_sets ["custmaxlen"]))
else
	if antiscan (nick, ucl, custom, 1, nil, nil) == 0 then return nil end -- scan for spam
	local custom = repnickchars (custom)

	if (string.lower (nick) == string.lower (custom)) or ((getstatus (custom) == 0) and (not getregclass (custom)) and (not findcustnick (custom))) then
		local oldcust = getcustnick (nick)

		if nick == custom then -- resetting
			delcustnick (nick, ucl, true)
		else
			addcustnick (nick, custom)
		end

		if table_sets ["classnoticust"] == 11 then
			commandanswer (nick, string.format (getlang (538), custom))
		else
			maintoall (string.format (getlang (20), (oldcust or nick), custom), table_sets ["classnoticust"], 10)
		end

	else -- nick already used
		commandanswer (nick, string.format (getlang (248), custom))
	end
end
end

----- ---- --- -- -

function listcustnick (nick)
	local t = {}
	local _, rows = VH:SQLQuery ("select `nick`, `custom` from `"..tbl_sql ["cust"].."`")

	if rows > 0 then
		for x = 0, rows - 1 do
			local _, usr, cust = VH:SQLFetch (x)
			t [usr] = cust
		end
	end

	for k, v in pairs (table_cust) do
		t [k] = v
	end

	local list, x = "", 1

	for k, v in pairs (t) do
		list = list.." "..x..". [ O: "..getstatus (k).." ] "..k.." @ "..v.."\r\n"
		x = x + 1
	end

	if list ~= "" then
		commandanswer (nick, getlang (154)..":\r\n\r\n"..list)
	else
		commandanswer (nick, getlang (112))
	end
end

----- ---- --- -- -

function logsread (nick, item)
	local _, _, logfile, lnnum = string.find (item, "^(%S+) (%d+)$")
	lnnum = tonumber (lnnum)
	if lnnum < 1 then lnnum = 1 end

	if (logfile == "log") or (logfile == "log.old") or (logfile == "err") or (logfile == "err.old") or (logfile == "net_out.log") then
		local cnt = 0
		local lfl = io.open (table_othsets ["cfgdir"]..logfile, "r")

		if lfl then
			lfl:close ()

			for line in io.lines (table_othsets ["cfgdir"]..logfile) do
				cnt = cnt + 1
			end

			local diff, showcnt = 0, 0

			if cnt > 0 then
				if cnt > lnnum then
					diff = cnt - lnnum + 1
					showcnt = lnnum
				else
					diff = 1
					showcnt = cnt
				end

				local numlen, aline = string.len (cnt), ""
				cnt = 0

				for line in io.lines (table_othsets ["cfgdir"]..logfile) do
					cnt = cnt + 1

					if cnt >= diff then
						aline = aline.." "..prezero (numlen, cnt)..": "..repnmdcoutchars (line).."\r\n"
					end
				end

				commandanswer (nick, string.format (getlang (157), showcnt, cnt, logfile)..":\r\n\r\n"..aline)
			else -- empty file
				commandanswer (nick, getlang (295))
			end
		else -- file not found
			commandanswer (nick, getlang (295))
		end
	else -- invalid file
		commandanswer (nick, string.format (getlang (294), "log, err, log.old, err.old "..getlang (70).." net_out.log"))
	end
end

----- ---- --- -- -

function checkcmd (nick, class, cmd)
	local _, rows = VH:SQLQuery ("select `command`, `class` from `"..tbl_sql ["cmd"].."` order by `occurred` desc")

	if rows > 0 then
		local rcmd = repnmdcinchars (cmd)

		for x = 0, rows - 1 do
			local _, entry, cls = VH:SQLFetch (x)

			if string.find (rcmd, entry) and (class < tonumber (cls)) then
				VH:SQLQuery ("update `"..tbl_sql ["cmd"].."` set `occurred` = `occurred` + 1 where `command` = '"..repsqlchars (entry).."' limit 1")
				commandanswer (nick, getlang (128))
				return 0
			end
		end
	end

	return 1
end

----- ---- --- -- -

function addcmdentry (nick, item)
local _, _, class = string.find (item, "^.+ (%d+)$")
class = tonumber (class)

if (class == 11) or (class == 10) or (class == 5) or (class == 4) or (class == 3) or (class == 2) or (class == 1) then -- only if valid class
local _, _, entry = string.find (item, "^(.+) %d+$")
local str = repsqlchars (repnmdcinchars (entry))
local _, rows = VH:SQLQuery ("select `class` from `"..tbl_sql ["cmd"].."` where `command` = '"..str.."' limit 1")

if rows > 0 then
VH:SQLQuery ("update `"..tbl_sql ["cmd"].."` set `class` = "..class.." where `command` = '"..str.."' limit 1")
commandanswer (nick, string.format (getlang (339), class, entry))
else
VH:SQLQuery ("insert into `"..tbl_sql ["cmd"].."` (`command`, `class`) values ('"..str.."', "..class..")")
commandanswer (nick, string.format (getlang (340), class, entry))
end

else
commandanswer (nick, string.format (getlang (143), "1, 2, 3, 4, 5, 10 "..getlang (70).." 11"))
end
end

----- ---- --- -- -

function delcmdentry (nick, item)
local aitem = repsqlchars (repnmdcinchars (item))
local _, rows = VH:SQLQuery ("select `class` from `"..tbl_sql ["cmd"].."` where `command` = '"..aitem.."' limit 1")

if rows > 0 then
VH:SQLQuery ("delete from `"..tbl_sql ["cmd"].."` where `command` = '"..aitem.."' limit 1")
commandanswer (nick, string.format (getlang (341), item))
else
commandanswer (nick, string.format (getlang (342), item))
end
end

----- ---- --- -- -

function listcmdentry (nick)
local _, rows = VH:SQLQuery ("select `command`, `class`, `occurred` from `"..tbl_sql ["cmd"].."` order by `occurred` desc")

if rows > 0 then
local anentry, len = "", 0

for x = 0, rows - 1 do
local _, entry, class, occurred = VH:SQLFetch (x)
if x == 0 then len = string.len (occurred) end
anentry = anentry.." "..prezero (string.len (rows), (x + 1))..". [ O: "..prezero (len, occurred).." ] "..repnmdcoutchars (entry).." ["..class.."]\r\n"
end

commandanswer (nick, getlang (338)..":\r\n\r\n"..anentry)
else
commandanswer (nick, getlang (343))
end
end

----- ---- --- -- -

function addcmdexentry (nick, item)
local entry = repsqlchars (repnmdcinchars (item))
local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["cmdex"].."` where `exception` = '"..entry.."' limit 1")

if rows > 0 then
commandanswer (nick, string.format (getlang (300), item))
else
VH:SQLQuery ("insert into `"..tbl_sql ["cmdex"].."` (`exception`) values ('"..entry.."')")
commandanswer (nick, string.format (getlang (299), item))
end
end

----- ---- --- -- -

function delcmdexentry (nick, item)
local aitem = repsqlchars (repnmdcinchars (item))
local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["cmdex"].."` where `exception` = '"..aitem.."' limit 1")

if rows > 0 then
VH:SQLQuery ("delete from `"..tbl_sql ["cmdex"].."` where `exception` = '"..aitem.."' limit 1")
commandanswer (nick, string.format (getlang (301), item))
else
commandanswer (nick, string.format (getlang (302), item))
end
end

----- ---- --- -- -

function listcmdexentry (nick)
local _, rows = VH:SQLQuery ("select `exception`, `occurred` from `"..tbl_sql ["cmdex"].."` order by `occurred` desc")

if rows > 0 then
local anentry, len = "", 0

for x = 0, rows - 1 do
local _, entry, occurred = VH:SQLFetch (x)
if x == 0 then len = string.len (occurred) end
anentry = anentry.." "..prezero (string.len (rows), (x + 1))..". [ O: "..prezero (len, occurred).." ] "..repnmdcoutchars (entry).."\r\n"
end

commandanswer (nick, getlang (298)..":\r\n\r\n"..anentry)
else
commandanswer (nick, getlang (303))
end
end

----- ---- --- -- -

function installtimebot ()
	table_othsets ["timebotseconds"] = os.time ()
	local bottime = table_othsets ["timebotseconds"] + table_sets ["srvtimediff"] -- current time
	bottime = os.date (table_sets ["timebotnick"], bottime)

	if table_sets ["fasttimebot"] == 1 then
		if table_othsets ["lasttimenick"] then
			VH:SendDataToAll ("$Quit "..table_othsets ["lasttimenick"].."|", 0, 10)
		end

		VH:SendDataToAll ("$OpList "..bottime.."$$|", 0, 10)
	else
		if table_othsets ["lasttimenick"] then
			delhubrobot (table_othsets ["lasttimenick"])
		end

		addhubrobot (bottime, table_othsets ["timebotdesc"], 2, "", 0)
	end

	table_othsets ["lasttimenick"] = bottime
end

----- ---- --- -- -

function addreminder (nick, item)
	local _, _, ident, cntnt, minc, maxc, dest, intv = string.find (item, "^(%S+) (.+) (%d+) (%d+) (%d) (%d+)$")
	minc, maxc, dest, intv = tonumber (minc), tonumber (maxc), tonumber (dest), tonumber (intv)

	if ((minc > 5) and (minc < 10)) or (minc > 10) or ((maxc > 5) and (maxc < 10)) or (maxc > 10) then -- invalid class
		commandanswer (nick, string.format (getlang (143), "0, 1, 2, 3, 4, 5 "..getlang (70).." 10"))
	elseif dest > 3 then -- invalid destination
		commandanswer (nick, string.format (getlang (387), "0, 1, 2 "..getlang (70).." 3"))
	elseif (intv < 1) or (intv > 10080) then -- invalid interval
		commandanswer (nick, string.format (getlang (388), "1 "..getlang (199).." 10080"))
	else
		if (dest == 3) and string.find (cntnt, string.char (67, 111, 110, 110, 101, 99, 116, 84, 111, 77, 101)) then
			commandanswer (nick, getlang (827))
		else
			local entry = repsqlchars (ident)
			local _, rows = VH:SQLQuery ("select `dest` from `"..tbl_sql ["rem"].."` where `id` = '"..entry.."' limit 1")

			if rows > 0 then
				VH:SQLQuery ("update `"..tbl_sql ["rem"].."` set `content` = '"..repsqlchars (cntnt).."', `minclass` = "..minc..", `maxclass` = "..maxc..", `dest` = "..dest..", `interval` = "..intv.." where `id` = '"..entry.."' limit 1")
				commandanswer (nick, string.format (getlang (389), ident))
			else
				VH:SQLQuery ("insert into `"..tbl_sql ["rem"].."` (`id`, `content`, `minclass`, `maxclass`, `dest`, `interval`) values ('"..entry.."', '"..repsqlchars (cntnt).."', "..minc..", "..maxc..", "..dest..", "..intv..")")
				commandanswer (nick, string.format (getlang (390), ident))
			end
		end
	end
end

----- ---- --- -- -

function delreminder (nick, item)
	local aitem = repsqlchars (item)
	local _, rows = VH:SQLQuery ("select `dest` from `"..tbl_sql ["rem"].."` where `id` = '"..aitem.."' limit 1")

	if rows > 0 then
		VH:SQLQuery ("delete from `"..tbl_sql ["rem"].."` where `id` = '"..aitem.."' limit 1")
		commandanswer (nick, string.format (getlang (391), item))
	else
		commandanswer (nick, string.format (getlang (392), item))
	end
end

----- ---- --- -- -

function showreminder (nick, id)
	local _, rows = VH:SQLQuery ("select `content` from `"..tbl_sql ["rem"].."` where `id` = '"..repsqlchars (id).."' limit 1")

	if rows > 0 then
		local _, contn = VH:SQLFetch (0)
		commandanswer (nick, string.format (getlang (510), id, reptextvars (contn, nil, nil)))
	else
		commandanswer (nick, string.format (getlang (392), id))
	end
end

----- ---- --- -- -

function listreminder (nick)
local _, rows = VH:SQLQuery ("select `id`, `content`, `minclass`, `maxclass`, `dest`, `interval`, `timer` from `"..tbl_sql ["rem"].."` order by `minclass` asc, `maxclass` desc")

if rows > 0 then
	local anentry = ""

	for x = 0, rows - 1 do
		local _, ident, cntnt, minc, maxc, dest, intv, timr = VH:SQLFetch (x)
		dest = tonumber (dest)

		if dest == 0 then
			dest = getlang (399)
		elseif dest == 1 then
			dest = getlang (398)
		elseif dest == 3 then
			dest = getlang (397)
		else -- 2
			dest = getlang (219)
		end

		anentry = anentry.."\r\n "..string.format (getlang (393), ident).."\r\n "..string.format (getlang (396), dest).." [ C: "..minc.."-"..maxc.." ]\r\n "..string.format (getlang (395), timr, intv).."\r\n "..string.format (getlang (394), cntnt).."\r\n"
	end

	commandanswer (nick, getlang (385)..":\r\n"..anentry)
else
	commandanswer (nick, getlang (386))
end
end

----- ---- --- -- -

function sendreminder ()
	local _, rows = VH:SQLQuery ("select `id`, `interval`, `timer` from `"..tbl_sql ["rem"].."`")
	if rows == 0 then return nil end
	local t = {}

	for x = 0, rows - 1 do
		local _, idnt, intrv, tmer = VH:SQLFetch (x)
		tmer = tonumber (tmer) + 1

		if tmer >= tonumber (intrv) then
			t [idnt] = 0
		else
			t [idnt] = tmer
		end
	end

	for k, v in pairs (t) do
		local repk = repsqlchars (k)

		if v == 0 then -- send the reminder
			local _, rows = VH:SQLQuery ("select `content`, `minclass`, `maxclass`, `dest` from `"..tbl_sql ["rem"].."` where `id` = '"..repk.."' limit 1")

			if rows > 0 then
				local _, contn, mincl, maxcl, pmf = VH:SQLFetch (0)
				local repdvars = reptextvars (contn, nil, nil)
				pmf = tonumber (pmf)

				if pmf == 0 then -- mc
					maintoall (repdvars, mincl, maxcl)
				elseif pmf == 1 then -- pm
					VH:SendPMToAll (repdvars, table_othsets ["sendfrom"], mincl, maxcl)
				elseif pmf == 3 then -- raw
					VH:SendDataToAll (repnmdcinchars (repdvars), mincl, maxcl)
				else -- 2, mc + pm
					maintoall (repdvars, mincl, maxcl)
					VH:SendPMToAll (repdvars, table_othsets ["sendfrom"], mincl, maxcl)
				end
			end
		end

		VH:SQLQuery ("update `"..tbl_sql ["rem"].."` set `timer` = "..v.." where `id` = '"..repk.."' limit 1")
	end
end

----- ---- --- -- -

function addnopm (nick, line)
	local _, _, lre, act, cls, rsn = string.find (line, "^(%S+) (%d) (%d+) (.+)$")

	if tonumber (act) > 1 then -- invalid action
		commandanswer (nick, string.format (getlang (227), "0 "..getlang (70).." 1"))
	elseif ((tonumber (cls) > 5) and (tonumber (cls) < 10)) or (tonumber (cls) > 11) then -- invalid class
		commandanswer (nick, string.format (getlang (143), "0, 1, 2, 3, 4, 5, 10 "..getlang (70).." 11"))
	else
		local rlre = repsqlchars (repnmdcinchars (lre))
		local _, rows = VH:SQLQuery ("select `action` from `"..tbl_sql ["nopm"].."` where `nick` = '"..rlre.."' limit 1")

		if rows > 0 then -- update
			VH:SQLQuery ("update `"..tbl_sql ["nopm"].."` set `action` = "..act..", `maxclass` = "..cls..", `reason` = '"..repsqlchars (rsn).."' where `nick` = '"..rlre.."' limit 1")
			commandanswer (nick, string.format (getlang (832), lre))
		else -- add
			VH:SQLQuery ("insert into `"..tbl_sql ["nopm"].."` (`nick`, `action`, `maxclass`, `reason`) values ('"..rlre.."', "..act..", "..cls..", '"..repsqlchars (rsn).."')")
			commandanswer (nick, string.format (getlang (833), lre))
		end
	end
end

----- ---- --- -- -

function checkipwat (nick, ip, data)
	-- affected areas so far: supports, validatenick, myinfo, search, sr, ctm, rctm
	local _, rows = VH:SQLQuery ("select `ip`, `reason`, `result` from `"..tbl_sql ["ipwa"].."`")

	if rows > 0 then
		for x = 0, rows - 1 do
			local _, lre, rsn, res = VH:SQLFetch (x)

			if string.find (ip, "^"..lre) then
				opsnotify (table_sets ["classnotiipwatch"], string.format (getlang (873), (nick or getlang (874)), ip .. tryipcc (ip, nick), rsn).."\r\n\r\n "..repnmdcoutchars (data).."\r\n") -- notify

				if tonumber (res) == 0 then
					return true
				else
					return false
				end
			end
		end
	end

	return false
end

----- ---- --- -- -

function addipwat (nick, line)
	local _, _, lre, rsn, res = string.find (line, "^(%S+) \"(.+)\" (%d)$")

	if (tonumber (res) < 0) or (tonumber (res) > 1) then
		commandanswer (nick, string.format (getlang (869), "0 "..getlang (70).." 1"))
	else
		local rlre = repsqlchars (repnmdcinchars (lre))
		local _, rows = VH:SQLQuery ("select `result` from `"..tbl_sql ["ipwa"].."` where `ip` = '"..rlre.."' limit 1")

		if rows > 0 then -- update
			VH:SQLQuery ("update `"..tbl_sql ["ipwa"].."` set `reason` = '"..repsqlchars (rsn).."', `result` = "..res.." where `ip` = '"..rlre.."' limit 1")
			commandanswer (nick, string.format (getlang (867), lre))
		else -- add
			VH:SQLQuery ("insert into `"..tbl_sql ["ipwa"].."` (`ip`, `reason`, `result`) values ('"..rlre.."', '"..repsqlchars (rsn).."', "..res..")")
			commandanswer (nick, string.format (getlang (868), lre))
		end
	end
end

----- ---- --- -- -

function delipwat (nick, line)
	local rlre = repsqlchars (repnmdcinchars (line))
	local _, rows = VH:SQLQuery ("select `result` from `"..tbl_sql ["ipwa"].."` where `ip` = '"..rlre.."' limit 1")

	if rows > 0 then -- delete
		VH:SQLQuery ("delete from `"..tbl_sql ["ipwa"].."` where `ip` = '"..rlre.."' limit 1")
		commandanswer (nick, string.format (getlang (870), line))
	else -- not in list
		commandanswer (nick, string.format (getlang (872), line))
	end
end

----- ---- --- -- -

function listipwat (nick)
	local _, rows = VH:SQLQuery ("select `ip`, `reason`, `result` from `"..tbl_sql ["ipwa"].."`")

	if rows > 0 then -- ok
		local iwlist = ""

		for x = 0, rows - 1 do
			local _, lre, rsn, res = VH:SQLFetch (x)
			iwlist = iwlist.." "..prezero (string.len (rows), (x + 1))..". "..repnmdcoutchars (lre).." [ R: "..rsn.." ] [ R: "..res.." ]\r\n"
		end

		commandanswer (nick, getlang (865)..":\r\n\r\n"..iwlist)
	else -- empty
		commandanswer (nick, getlang (871))
	end
end

----- ---- --- -- -

function addrcmenu (nick, line)
	local _, _, menu, cmnd, cype, cont, ord, minc, maxc = line:find ("^\"(.+)\" \"(.*)\" (%d+) (%d+) (%d+) (%d+) (%d+)$")
	cype = tonumber (cype)

	if (cype >= 0 and cype <= 2) or cype == 255 then
		cont = tonumber (cont)

		if cont >= 1 and cont <= 15 then
			ord = tonumber (ord)

			if ord >= 0 and ord <= 65535 then
				minc = tonumber (minc)

				if (minc >= 0 and minc <= 5) or minc == 10 or minc == 11 then
					maxc = tonumber (maxc)

					if (maxc >= 0 and maxc <= 5) or maxc == 10 then
						local repmenu = repsqlchars (repnmdcoutchars (menu))
						local repcmnd = repsqlchars (repnmdcoutchars (cmnd))
						local _, rows = VH:SQLQuery ("select `id` from `" .. tbl_sql ["rcmenu"] .. "` where `menu` = '" .. repmenu .. "' limit 1")

						if rows > 0 then -- update
							local _, id = VH:SQLFetch (0)
							VH:SQLQuery ("update `" .. tbl_sql ["rcmenu"] .. "` set `command` = '" .. repcmnd .."', `type` = " .. tostring (cype) .. ", `cont` = " .. tostring (cont) .. ", `order` = " .. tostring (ord) .. ", `minclass` = " .. tostring (minc) .. ", `maxclass` = " .. tostring (maxc) .. " where `id` = " .. tostring (id) .. " limit 1")
							commandanswer (nick, getlang (953):format (menu))
						else -- add
							VH:SQLQuery ("insert into `" .. tbl_sql ["rcmenu"] .. "` (`menu`, `command`, `type`, `cont`, `order`, `minclass`, `maxclass`) values ('" .. repmenu .. "', '" .. repcmnd .. "', " .. tostring (cype) .. ", " .. tostring (cont) .. ", " .. tostring (ord) .. ", " .. tostring (minc) .. ", " .. tostring (maxc) .. ")")
							commandanswer (nick, getlang (954):format (menu))
						end
					else -- unknown maximum class
						commandanswer (nick, getlang (143):format ("0, 1, 2, 3, 4, 5 " .. getlang (70) .. " 10"))
					end
				else -- unknown minimum class
					commandanswer (nick, getlang (143):format ("0, 1, 2, 3, 4, 5, 10 " .. getlang (70) .. " 11"))
				end
			else -- unknown order
				commandanswer (nick, getlang (952):format ("0 " .. getlang (199) .. " 65535"))
			end
		else -- unknown context
			commandanswer (nick, getlang (951):format ("1 " .. getlang (199) .. " 15"))
		end
	else -- unknown type
		commandanswer (nick, getlang (100):format ("0, 1, 2, " .. getlang (70) .. " 255"))
	end
end

----- ---- --- -- -

function delrcmenu (nick, id)
	local _, rows = VH:SQLQuery ("select `menu` from `" .. tbl_sql ["rcmenu"] .. "` where `id` = " .. id .. " limit 1")

	if rows > 0 then
		local _, menu = VH:SQLFetch (0)
		VH:SQLQuery ("delete from `" .. tbl_sql ["rcmenu"] .. "` where `id` = " .. id .. " limit 1")
		commandanswer (nick, getlang (955):format (menu))
	else
		commandanswer (nick, getlang (956):format (id))
	end
end

----- ---- --- -- -

function listrcmenu (nick)
	local _, rows = VH:SQLQuery ("select * from `" .. tbl_sql ["rcmenu"] .. "` order by `order` asc, `id` asc")

	if rows > 0 then
		local list = ""

		for x = 0, rows - 1 do
			local _, id, menu, cmnd, cype, cont, ord, minc, maxc = VH:SQLFetch (x)
			list = list .. "\r\n " .. getlang (958) .. ": " .. menu .. "\r\n"

			if cmnd == "" then
				list = list .. " " .. getlang (959) .. ": " .. getlang (961) .. "\r\n"
			else
				list = list .. " " .. getlang (959) .. ": " .. cmnd .. "\r\n"
			end

			list = list .. " [ I: " .. tostring (id) .. " ] [ T: " .. tostring (cype) .. " ] [ C: " .. tostring (cont) .. " ] [ O: " .. tostring (ord) .. " ] [ MIC: " .. tostring (minc) .. " ] [ MAC: " .. tostring (maxc) .. " ]\r\n"
		end

		commandanswer (nick, getlang (860) .. ":\r\n" .. list)
	else
		commandanswer (nick, getlang (957))
	end
end

----- ---- --- -- -

function ordrcmenu (nick, line)
	local _, _, id, ord = line:find ("^(%d+) (%d+)$")
	ord = tonumber (ord)

	if ord >= 0 and ord <= 65535 then
		local _, rows = VH:SQLQuery ("select `menu` from `" .. tbl_sql ["rcmenu"] .. "` where `id` = " .. id .. " limit 1")

		if rows > 0 then
			local _, menu = VH:SQLFetch (0)
			VH:SQLQuery ("update `" .. tbl_sql ["rcmenu"] .. "` set `order` = " .. tostring (ord) .. " where `id` = " .. tostring (id) .. " limit 1")
			commandanswer (nick, getlang (960):format (menu))
		else
			commandanswer (nick, getlang (956):format (id))
		end
	else -- unknown order
		commandanswer (nick, getlang (952):format ("0 " .. getlang (199) .. " 65535"))
	end
end

----- ---- --- -- -

function sendrcmenu (nick, class)
	if table_sets ["instrcmenu"] == 0 or class < 0 then
		return
	end

	local _, rows = VH:SQLQuery ("select `menu`, `command`, `type`, `cont` from `" .. tbl_sql ["rcmenu"] .. "` where `minclass` <= " .. tostring (class) .. " and `maxclass` >= " .. tonumber (class) .. " order by `order` asc, `id` asc")

	if rows > 0 then
		for x = 0, rows - 1 do
			local _, menu, cmnd, cype, cont = VH:SQLFetch (x)

			if cmnd == "" then
				VH:SendDataToUser ("$UserCommand " .. tostring (cype) .. " " .. tostring (cont) .. "|", nick)
			else
				VH:SendDataToUser ("$UserCommand " .. tostring (cype) .. " " .. tostring (cont) .. " " .. menu .. "$<%[mynick]> " .. cmnd .. "&#124;|", nick)
			end
		end
	end
end

----- ---- --- -- -

function delnopm (nick, line)
	local rlre = repsqlchars (repnmdcinchars (line))
	local _, rows = VH:SQLQuery ("select `action` from `"..tbl_sql ["nopm"].."` where `nick` = '"..rlre.."' limit 1")

	if rows > 0 then -- delete
		VH:SQLQuery ("delete from `"..tbl_sql ["nopm"].."` where `nick` = '"..rlre.."' limit 1")
		commandanswer (nick, string.format (getlang (834), line))
	else -- not in list
		commandanswer (nick, string.format (getlang (836), line))
	end
end

----- ---- --- -- -

function listnopm (nick)
	local _, rows = VH:SQLQuery ("select `nick`, `action`, `maxclass`, `reason` from `"..tbl_sql ["nopm"].."` order by `action` asc")

	if rows > 0 then -- ok
		local nplist = ""

		for x = 0, rows - 1 do
			local _, lre, act, cls, rsn = VH:SQLFetch (x)
			nplist = nplist.."\r\n "..prezero (string.len (rows), (x + 1))..". "..repnmdcoutchars (lre).." [ A: "..act.." ] [ C: "..cls.." ]\r\n "..string.format (getlang (837), rsn).."\r\n"
		end

		commandanswer (nick, getlang (831)..":\r\n"..nplist)
	else -- empty
		commandanswer (nick, getlang (835))
	end
end

----- ---- --- -- -

function checknopm (from, cls, to)
	-- fixme: confrontation with antispam, actions that forwards the message, such as replace
	local _, rows = VH:SQLQuery ("select `nick`, `action`, `maxclass`, `reason` from `"..tbl_sql ["nopm"].."`")

	if rows > 0 then
		for x = 0, rows - 1 do
			local _, lre, act, mcl, rsn = VH:SQLFetch (x)

			if string.find (tolow (to), lre) then
				if cls <= tonumber (mcl) then
					pmtouser (from, to, string.format (getlang (838), rsn))

					if tonumber (act) == 1 then -- drop
						VH:CloseConnection (from)
					end

					return true
				end

				break
			end
		end
	end

	return false
end

----- ---- --- -- -

function addhban (nick, line)
	local _, _, lst, rsn = string.find (line, "^(.+) \"(.+)\"$")
	local cnt = 0

	for lre in string.gmatch (lst, "%S+") do
		cnt = cnt + 1
		local rlre = repsqlchars (repnmdcinchars (lre))
		local _, rows = VH:SQLQuery ("select `ip` from `" .. tbl_sql ["hban"] .. "` where `ip` = '" .. rlre .. "' limit 1")

		if rows > 0 then -- update
			VH:SQLQuery ("update `" .. tbl_sql ["hban"] .. "` set `reason` = '" .. repsqlchars (rsn) .. "' where `ip` = '" .. rlre .. "' limit 1")

			if nick then
				commandanswer (nick, string.format (getlang (848), lre))
			end
		else -- add
			VH:SQLQuery ("insert into `" .. tbl_sql ["hban"] .. "` (`ip`, `reason`) values ('" .. rlre .. "', '" .. repsqlchars (rsn) .. "')")

			if nick then
				commandanswer (nick, string.format (getlang (849), lre))
			end
		end
	end

	if (cnt == 0) and nick then
		commandanswer (nick, getlang (862))
	end
end

----- ---- --- -- -

function delhban (nick, line)
	local rlre = repsqlchars (repnmdcinchars (line))
	local _, rows = VH:SQLQuery ("select `ip` from `"..tbl_sql ["hban"].."` where `ip` = '"..rlre.."' limit 1")

	if rows > 0 then -- delete
		VH:SQLQuery ("delete from `"..tbl_sql ["hban"].."` where `ip` = '"..rlre.."' limit 1")
		commandanswer (nick, string.format (getlang (850), line))
	else -- not in list
		commandanswer (nick, string.format (getlang (852), line))
	end
end

----- ---- --- -- -

function listhban (nick)
	local _, rows = VH:SQLQuery ("select `ip`, `reason` from `"..tbl_sql ["hban"].."`")

	if rows > 0 then -- ok
		local hblist = ""

		for x = 0, rows - 1 do
			local _, lre, rsn = VH:SQLFetch (x)
			hblist = hblist.." "..prezero (string.len (rows), (x + 1))..". "..repnmdcoutchars (lre).." [ R: "..rsn.." ]\r\n"
		end

		commandanswer (nick, getlang (847)..":\r\n\r\n"..hblist)
	else -- empty
		commandanswer (nick, getlang (851))
	end
end

----- ---- --- -- -

function checkhban (ip)
	local _, rows = VH:SQLQuery ("select `ip`, `reason` from `"..tbl_sql ["hban"].."`")

	if rows > 0 then
		for x = 0, rows - 1 do
			local _, lre, rsn = VH:SQLFetch (x)

			if string.find (ip, "^"..lre) then
				opsnotify (table_sets ["classnotihardban"], string.format (getlang (853), ip .. tryipcc (ip), rsn)) -- notify
				return true
			end
		end
	end

	return false
end

----- ---- --- -- -

function addnews (nick, item)
	local ndate = os.time () + table_sets ["srvtimediff"] -- current time
	VH:SQLQuery ("insert into `"..tbl_sql ["news"].."` (`date`, `by`, `item`) values ("..ndate..", '"..repsqlchars (nick).."', '"..repsqlchars (item).."')")
	commandanswer (nick, string.format (getlang (456), os.date (table_sets ["dateformat"].." "..table_sets ["timeformat"], ndate)))
end

----- ---- --- -- -

function delnews (nick, adate)
	local _, rows = VH:SQLQuery ("select `date` from `"..tbl_sql ["news"].."`")
	local t = {}

	if rows > 0 then
		for x = 0, rows - 1 do
			local _, zdate = VH:SQLFetch (x)

			if string.find (os.date (table_sets ["dateformat"].." "..table_sets ["timeformat"], zdate), repdatechars (adate)) then
				table.insert (t, zdate)
			end
		end
	else
		commandanswer (nick, getlang (457))
		return nil
	end

	for _, v in pairs (t) do
		-- items might have same timestamp, dont delete duplicates
		-- or create other way for deletion, for example by id
		VH:SQLQuery ("delete from `"..tbl_sql ["news"].."` where `date` = "..v.." limit 1")
	end

	local num = table.getn (t)

	if num > 0 then
		commandanswer (nick, string.format (getlang (458), num))
	else
		commandanswer (nick, string.format (getlang (459), adate))
	end
end

----- ---- --- -- -

function sendnews (nick, lnnum, autosend)
	local lns = tonumber (lnnum)
	if lns < 1 then lns = 1 end
	local _, rows = VH:SQLQuery ("select `date`, `by`, `item` from `"..tbl_sql ["news"].."` order by `date` desc, `id` desc limit "..lns)

	if rows > 0 then
		local aentry = ""

		for x = 0, rows - 1 do
			local _, adate, user, msg = VH:SQLFetch (x)
			aentry = " "..string.format (getlang (461), user, os.date (table_sets ["dateformat"].." "..table_sets ["timeformat"], adate), msg).."\r\n"..aentry
		end

		if autosend == 0 then
			commandanswer (nick, string.format (getlang (460), rows)..":\r\n\r\n"..aentry)
		else
			maintouser (nick, string.format (getlang (460), rows)..":\r\n\r\n"..aentry)
		end
	else
		if autosend == 0 then -- only if sending manually
			commandanswer (nick, getlang (457))
		end
	end
end

----- ---- --- -- -

function addresponder (nick, item)
	local _, _, msg, rpl, maxc = string.find (item, "^\"(.+)\" \"(.+)\" (%d+)$")
	maxc = tonumber (maxc)

	if (maxc >= 0) and (maxc <= 5) or (maxc == 10) then
		VH:SQLQuery ("insert into `"..tbl_sql ["mcresp"].."` (`message`, `reply`, `maxclass`) values ('"..repsqlchars (repnmdcinchars (msg)).."', '"..repsqlchars (rpl).."', "..maxc..")")
		commandanswer (nick, string.format (getlang (407), msg))
	else
		commandanswer (nick, string.format (getlang (143), "0, 1, 2, 3, 4, 5 "..getlang (70).." 10"))
	end
end

----- ---- --- -- -

function delresponder (nick, id)
	local _, rows = VH:SQLQuery ("select `maxclass` from `"..tbl_sql ["mcresp"].."` where `id` = "..id)

	if rows > 0 then
		VH:SQLQuery ("delete from `"..tbl_sql ["mcresp"].."` where `id` = "..id)
		commandanswer (nick, string.format (getlang (408), id))
	else
		commandanswer (nick, string.format (getlang (409), id))
	end
end

----- ---- --- -- -

function listresponder (nick)
	local _, rows = VH:SQLQuery ("select `id`, `message`, `reply`, `maxclass`, `occurred` from `"..tbl_sql ["mcresp"].."` order by `occurred` desc, `id` desc")

	if rows > 0 then
		local anentry = ""

		for x = 0, rows - 1 do
			local _, id, msg, repl, maxc, occur = VH:SQLFetch (x)
			anentry = anentry.."\r\n "..getlang (410)..": "..repnmdcoutchars (msg).."\r\n "..getlang (411)..": "..repl.."\r\n [ I: "..id.." ] [ C: "..maxc.." ] [ O: "..occur.." ]\r\n"
		end

		commandanswer (nick, getlang (403)..":\r\n"..anentry)
	else
		commandanswer (nick, getlang (404))
	end
end

----- ---- --- -- -

function addrespex (nick, item)
	local entry = repsqlchars (item)
	local _, rows = VH:SQLQuery ("select `exception` from `"..tbl_sql ["respex"].."` where `exception` = '"..entry.."'")

	if rows > 0 then
		commandanswer (nick, string.format (getlang (416), item))
	else
		VH:SQLQuery ("insert into `"..tbl_sql ["respex"].."` (`exception`) values ('"..entry.."')")
		commandanswer (nick, string.format (getlang (417), item))
	end
end

----- ---- --- -- -

function delrespex (nick, item)
	local aitem = repsqlchars (item)
	local _, rows = VH:SQLQuery ("select `exception` from `"..tbl_sql ["respex"].."` where `exception` = '"..aitem.."'")

	if rows > 0 then
		VH:SQLQuery ("delete from `"..tbl_sql ["respex"].."` where `exception` = '"..aitem.."'")
		commandanswer (nick, string.format (getlang (418), item))
	else
		commandanswer (nick, string.format (getlang (419), item))
	end
end

----- ---- --- -- -

function listrespex (nick)
	local _, rows = VH:SQLQuery ("select `exception`, `occurred` from `"..tbl_sql ["respex"].."` order by `occurred` desc")

	if rows > 0 then
		local anentry, len = "", 0

		for x = 0, rows - 1 do
			local _, entry, occurred = VH:SQLFetch (x)
			if x == 0 then len = string.len (occurred) end
			anentry = anentry.." "..prezero (string.len (rows), (x + 1))..". [ O: "..prezero (len, occurred).." ] "..entry.."\r\n"
		end

		commandanswer (nick, getlang (414)..":\r\n\r\n"..anentry)
	else
		commandanswer (nick, getlang (415))
	end
end

----- ---- --- -- -

function replyresponder (nick, cls, msg)
	if table_sets ["resprunning"] == 0 then return nil end
	local _, rows = VH:SQLQuery ("select `exception` from `"..tbl_sql ["respex"].."` where `exception` = '"..repsqlchars (nick).."' or `exception` = '"..repsqlchars (getip (nick)).."'")

	if rows > 0 then
		local _, ex = VH:SQLFetch (0)
		VH:SQLQuery ("update `"..tbl_sql ["respex"].."` set `occurred` = `occurred` + 1 where `exception` = '"..repsqlchars (ex).."'")
		return nil
	end

	local _, rows = VH:SQLQuery ("select `id`, `message`, `reply`, `maxclass` from `"..tbl_sql ["mcresp"].."`")

	if rows > 0 then
		local txt = tolow (repnmdcinchars (msg))
		local respsel = {}

		for x = 0, rows - 1 do
			local _, id, ent, repl, maxc = VH:SQLFetch (x)
			id = tonumber (id)

			if (cls <= tonumber (maxc)) and string.find (txt, ent) then
				table.insert (respsel, {[id] = repl})
			end
		end

		local cnt = table.getn (respsel)

		if cnt > 0 then
			for k, v in pairs (respsel [math.random (cnt)]) do
				table.insert (table_resp, {[os.time ()] = reptextvars (v, nick, msg)})
				VH:SQLQuery ("update `"..tbl_sql ["mcresp"].."` set `occurred` = `occurred` + 1 where `id` = "..k)
			end
		end
	end
end

----- ---- --- -- -

function addreplacer (nick, item)
	local _, _, msg, rpl, maxc = string.find (item, "^\"(.+)\" \"(.+)\" (%d+)$")
	maxc = tonumber (maxc)

	if (maxc >= 0) and (maxc <= 5) or (maxc == 10) then
		VH:SQLQuery ("insert into `"..tbl_sql ["mcrepl"].."` (`message`, `replace`, `maxclass`) values ('"..repsqlchars (repnmdcinchars (msg)).."', '"..repsqlchars (rpl).."', "..maxc..")")
		commandanswer (nick, string.format (getlang (798), msg))
	else
		commandanswer (nick, string.format (getlang (143), "0, 1, 2, 3, 4, 5 "..getlang (70).." 10"))
	end
end

----- ---- --- -- -

function delreplacer (nick, id)
	local _, rows = VH:SQLQuery ("select `maxclass` from `"..tbl_sql ["mcrepl"].."` where `id` = "..id)

	if rows > 0 then
		VH:SQLQuery ("delete from `"..tbl_sql ["mcrepl"].."` where `id` = "..id)
		commandanswer (nick, string.format (getlang (799), id))
	else
		commandanswer (nick, string.format (getlang (800), id))
	end
end

----- ---- --- -- -

function listreplacer (nick)
	local _, rows = VH:SQLQuery ("select `id`, `message`, `replace`, `maxclass`, `occurred` from `"..tbl_sql ["mcrepl"].."` order by `occurred` desc, `id` desc")

	if rows > 0 then
		local anentry = ""

		for x = 0, rows - 1 do
			local _, id, msg, repl, maxc, occur = VH:SQLFetch (x)
			anentry = anentry.."\r\n "..getlang (605)..": "..repnmdcoutchars (msg).."\r\n "..getlang (803)..": "..repl.."\r\n [ I: "..id.." ] [ C: "..maxc.." ] [ O: "..occur.." ]\r\n"
		end

		commandanswer (nick, getlang (801)..":\r\n"..anentry)
	else
		commandanswer (nick, getlang (802))
	end
end

----- ---- --- -- -

function addreplex (nick, item)
	local entry = repsqlchars (item)
	local _, rows = VH:SQLQuery ("select `exception` from `"..tbl_sql ["replex"].."` where `exception` = '"..entry.."'")

	if rows > 0 then
		commandanswer (nick, string.format (getlang (804), item))
	else
		VH:SQLQuery ("insert into `"..tbl_sql ["replex"].."` (`exception`) values ('"..entry.."')")
		commandanswer (nick, string.format (getlang (805), item))
	end
end

----- ---- --- -- -

function delreplex (nick, item)
	local aitem = repsqlchars (item)
	local _, rows = VH:SQLQuery ("select `exception` from `"..tbl_sql ["replex"].."` where `exception` = '"..aitem.."'")

	if rows > 0 then
		VH:SQLQuery ("delete from `"..tbl_sql ["replex"].."` where `exception` = '"..aitem.."'")
		commandanswer (nick, string.format (getlang (806), item))
	else
		commandanswer (nick, string.format (getlang (807), item))
	end
end

----- ---- --- -- -

function listreplex (nick)
	local _, rows = VH:SQLQuery ("select `exception`, `occurred` from `"..tbl_sql ["replex"].."` order by `occurred` desc")

	if rows > 0 then
		local anentry, len = "", 0

		for x = 0, rows - 1 do
			local _, entry, occurred = VH:SQLFetch (x)
			if x == 0 then len = string.len (occurred) end
			anentry = anentry.." "..prezero (string.len (rows), (x + 1))..". [ O: "..prezero (len, occurred).." ] "..entry.."\r\n"
		end

		commandanswer (nick, getlang (808)..":\r\n\r\n"..anentry)
	else
		commandanswer (nick, getlang (809))
	end
end

----- ---- --- -- -

function replchatmsg (nick, cls, msg)
	local _, rows = VH:SQLQuery ("select `exception` from `"..tbl_sql ["replex"].."` where `exception` = '"..repsqlchars (nick).."' or `exception` = '"..repsqlchars (getip (nick)).."'")

	if rows > 0 then
		local _, ex = VH:SQLFetch (0)
		VH:SQLQuery ("update `"..tbl_sql ["replex"].."` set `occurred` = `occurred` + 1 where `exception` = '"..repsqlchars (ex).."'")
		return msg
	end

	local _, rows = VH:SQLQuery ("select `id`, `message`, `replace`, `maxclass` from `"..tbl_sql ["mcrepl"].."`")

	if rows > 0 then
		local txt = tolow (repnmdcinchars (msg))
		local replsel = {}

		for x = 0, rows - 1 do
			local _, id, ent, repl, maxc = VH:SQLFetch (x)
			id = tonumber (id)

			if (cls <= tonumber (maxc)) and string.find (txt, ent) then
				table.insert (replsel, {[id] = {["m"] = ent, ["r"] = repl}})
			end
		end

		local cnt = table.getn (replsel)

		if cnt > 0 then
			for k, v in pairs (replsel [math.random (cnt)]) do
				VH:SQLQuery ("update `"..tbl_sql ["mcrepl"].."` set `occurred` = `occurred` + 1 where `id` = "..k)
				local repl = reptextvars (v ["r"], (getcustnick (nick) or nick), msg)
				repl = string.gsub (tolow (msg), v ["m"], repl) -- dont replace % here
				return repl
			end
		end
	end

	return msg
end

----- ---- --- -- -

function addrelease (nick, line)
	local _, rel, cat, tth = 0, "", "", ""

	if string.find (line, "^\".+\" \".+\" %S+$") then
		_, _, rel, cat, tth = string.find (line, "^\"(.+)\" \"(.+)\" (%S+)$")
	else
		_, _, rel, cat = string.find (line, "^\"(.+)\" \"(.+)\"$")
	end

	local arel = repsqlchars (rel)
	local _, rows = VH:SQLQuery ("select `date` from `"..tbl_sql ["rel"].."` where `release` = '"..arel.."' limit 1")
	local ndate = os.time () + table_sets ["srvtimediff"] -- current time

	if rows > 0 then
		VH:SQLQuery ("update `"..tbl_sql ["rel"].."` set `category` = '"..repsqlchars (cat).."', `tth` = '"..repsqlchars (tth).."', `date` = '"..ndate.."' where `release` = '"..arel.."' limit 1")
		commandanswer (nick, string.format (getlang (505), rel))
	else
		VH:SQLQuery ("insert into `"..tbl_sql ["rel"].."` (`release`, `category`, `tth`, `by`, `date`) values ('"..arel.."', '"..repsqlchars (cat).."', '"..repsqlchars (tth).."', '"..repsqlchars (nick).."', '"..ndate.."')")
		commandanswer (nick, string.format (getlang (506), rel))
	end
end

----- ---- --- -- -

function delrelease (nick, line)
local _, _, stype = string.find (line, "^(%S+) .+$")

if stype == "rel" then
local _, _, rel = string.find (line, "^%S+ (.+)$")
local arel = repsqlchars (rel)
local _, rows = VH:SQLQuery ("select `date` from `"..tbl_sql ["rel"].."` where `release` = '"..arel.."' limit 1")

if rows > 0 then
VH:SQLQuery ("delete from `"..tbl_sql ["rel"].."` where `release` = '"..arel.."' limit 1")
commandanswer (nick, string.format (getlang (507), rel))
else
commandanswer (nick, string.format (getlang (508), rel))
end

elseif stype == "cat" then
local _, _, cat = string.find (line, "^%S+ (.+)$")
local acat = repsqlchars (cat)
local _, rows = VH:SQLQuery ("select `date` from `"..tbl_sql ["rel"].."` where `category` = '"..acat.."'")

if rows > 0 then
VH:SQLQuery ("delete from `"..tbl_sql ["rel"].."` where `category` = '"..acat.."'") -- no limit
commandanswer (nick, string.format (getlang (54), rows ,cat))
else
commandanswer (nick, string.format (getlang (355), cat))
end

else -- unknown type
commandanswer (nick, string.format (getlang (100), "rel "..getlang (70).." cat"))
end
end

----- ---- --- -- -

function listrelease (nick, line)
local _, stype, lnnum, catst = 0, "", 0, ""

if string.find (line, "^%S+ %d+ .+$") then
_, _, stype, lnnum, catst = string.find (line, "^(%S+) (%d+) (.+)$")
else
_, _, stype, lnnum = string.find (line, "^(%S+) (%d+)$")
catst = nil
end

lnnum = tonumber (lnnum)
if lnnum < 1 then lnnum = 1 end

if stype == "cat" then
if not catst then
commandanswer (nick, getlang (332))
else
local _, rows = VH:SQLQuery ("select `release`, `tth`, `by`, `date` from `"..tbl_sql ["rel"].."` where `category` = '"..repsqlchars (catst).."' order by `date` desc limit "..lnnum)

if rows > 0 then
local anentry = ""

for x = 0, rows - 1 do
local _, rel, tth, auth, adate = VH:SQLFetch (x)

if string.len (tth) > 0 then
tth = "\r\n "..string.format (getlang (224), "magnet:?xt=urn:tree:tiger:"..tth)
end

anentry = anentry.."\r\n "..prezero (string.len (rows), (x + 1))..". "..rel.."\r\n "..string.format (getlang (309), auth).."\r\n "..string.format (getlang (283), os.date (table_sets ["dateformat"].." "..table_sets ["timeformat"], adate))..tth.."\r\n"
end

commandanswer (nick, string.format (getlang (316), rows, catst)..":\r\n"..anentry)
else
commandanswer (nick, string.format (getlang (315), catst))
end
end

elseif stype == "pub" then
if not catst then
commandanswer (nick, getlang (332))
else
local _, rows = VH:SQLQuery ("select `release`, `category`, `tth`, `date` from `"..tbl_sql ["rel"].."` where `by` = '"..repsqlchars (catst).."' order by `date` desc limit "..lnnum)

if rows > 0 then
local anentry = ""

for x = 0, rows - 1 do
local _, rel, cat, tth, adate = VH:SQLFetch (x)

if string.len (tth) > 0 then
tth = "\r\n "..string.format (getlang (224), "magnet:?xt=urn:tree:tiger:"..tth)
end

anentry = anentry.."\r\n "..prezero (string.len (rows), (x + 1))..". "..rel.."\r\n "..string.format (getlang (246), cat).."\r\n "..string.format (getlang (283), os.date (table_sets ["dateformat"].." "..table_sets ["timeformat"], adate))..tth.."\r\n"
end

commandanswer (nick, string.format (getlang (314), rows, catst)..":\r\n"..anentry)
else
commandanswer (nick, string.format (getlang (313), catst))
end
end

elseif stype == "all" then
local _, rows = VH:SQLQuery ("select `release`, `category`, `tth`, `by`, `date` from `"..tbl_sql ["rel"].."` order by `date` desc limit "..lnnum)

if rows > 0 then
local anentry = ""

for x = 0, rows - 1 do
local _, rel, cat, tth, auth, adate = VH:SQLFetch (x)

if string.len (tth) > 0 then
tth = "\r\n "..string.format (getlang (224), "magnet:?xt=urn:tree:tiger:"..tth)
end

anentry = anentry.."\r\n "..prezero (string.len (rows), (x + 1))..". "..rel.."\r\n "..string.format (getlang (246), cat).."\r\n "..string.format (getlang (309), auth).."\r\n "..string.format (getlang (283), os.date (table_sets ["dateformat"].." "..table_sets ["timeformat"], adate))..tth.."\r\n"
end

commandanswer (nick, string.format (getlang (312), rows)..":\r\n"..anentry)
else
commandanswer (nick, getlang (311))
end

else -- unknown type
commandanswer (nick, string.format (getlang (100), "cat, pub "..getlang (70).." all"))
end
end

----- ---- --- -- -

function findrelease (nick, line)
	local spat = string.gsub (line, "%%", "\\%%")
	spat = string.gsub (spat, string.char (32), "%%") -- space to match any characters as word delimiter
	spat = repsqlchars (spat)
	local _, rows = VH:SQLQuery ("select `release`, `category`, `tth`, `by`, `date` from `"..tbl_sql ["rel"].."` where `release` like '%"..spat.."%' or `category` like '%"..spat.."%' order by `date` desc")

	if rows > 0 then
		local anentry = ""

		for x = 0, rows - 1 do
			local _, rel, cat, tth, auth, adate = VH:SQLFetch (x)

			if string.len (tth) > 0 then
				tth = "\r\n "..string.format (getlang (224), "magnet:?xt=urn:tree:tiger:"..tth)
			end

			anentry = anentry.."\r\n "..prezero (string.len (rows), (x + 1))..". "..rel.."\r\n "..string.format (getlang (246), cat).."\r\n "..string.format (getlang (309), auth).."\r\n "..string.format (getlang (283), os.date (table_sets ["dateformat"].." "..table_sets ["timeformat"], adate))..tth.."\r\n"
		end

		commandanswer (nick, string.format (getlang (504), rows, line)..":\r\n"..anentry)
	else
		commandanswer (nick, string.format (getlang (317), line))
	end
end

----- ---- --- -- -

function seenlookup (nick, user)
	if not table_othsets ["ver_curl"] then
		commandanswer (nick, string.format (getlang (691), "cURL"))
	else
		commandanswer (nick, string.format (getlang (638), "http://www.te-home.net/?do=hublist", user))
		local res, err = os.execute ("curl -L -G --retry 3 --connect-timeout 5 -m 15 -A \"Verlihub\" -s -o \""..table_othsets ["cfgdir"]..table_othsets ["tmpfile"].."\" \""..table_othsets ["seenurl"]..encodeurl (user).."\"")

		if res then
			local f = io.open (table_othsets ["cfgdir"]..table_othsets ["tmpfile"], "r")

			if f then
				local seen = f:read ("*all")
				f:close ()

				if not seen then
					commandanswer (nick, string.format (getlang (19), "index.php"))
				elseif seen == "" then
					commandanswer (nick, string.format (getlang (640), user))
				else
					local list, c = "", 1

					for x in io.lines (table_othsets ["cfgdir"]..table_othsets ["tmpfile"]) do
						if string.len (x) > 0 then
							local _, _, u, h = string.find (x, "^(%S+)|(%S+)$")

							if u and h then
								list = list.." "..c..". "..u.." @ dchub://"..h.."/\r\n"
								c = c + 1
							end
						end
					end

					if list == "" then
						commandanswer (nick, string.format (getlang (640), user))
					else
						commandanswer (nick, string.format (getlang (639), user)..":\r\n\r\n"..list)
					end
				end

				os.remove (table_othsets ["cfgdir"]..table_othsets ["tmpfile"])
			else
				commandanswer (nick, string.format (getlang (875), user))
			end
		else
			commandanswer (nick, string.format (getlang (661), (err or getlang (662))))
		end
	end
end

----- ---- --- -- -

function dropip (nick, ip)
	local num = dropallbyip (ip)

	if num == 0 then
		commandanswer (nick, string.format (getlang (920), ip))
	else
		commandanswer (nick, string.format (getlang (921), num, ip))
		opsnotify (table_sets ["classnotikick"], string.format (getlang (922), nick, num, ip))
	end
end

----- ---- --- -- -

function showuserinfo (nick, usr)
local user = getcsnick (usr)

if not user then -- not in list
	commandanswer (nick, string.format (getlang (704), usr))
elseif isbot (user) == true then -- bot
	if table_othsets ["func_getbots"] == true then
		local bots = VH:GetBots ()
		local info = ""

		if bots then
			for _, v in pairs (bots) do
				if user == v ["sNick"] then
					info = info.." "..string.format (getlang (705), user).."\r\n" -- nick

					if v ["iClass"] then -- class
						info = info.." "..string.format (getlang (717), v ["iClass"]).."\r\n"
					end

					if v ["sScriptname"] then -- script
						info = info.." "..string.format (getlang (756), v ["sScriptname"]).."\r\n"
					end

					if v ["sMyINFO"] then -- myinfo
						local desc, tag, conn, sts, email, share = parsemyinfo (user, v ["sMyINFO"])
						info = info.." "..string.format (getlang (706), desc).."\r\n" -- description
						info = info.." "..string.format (getlang (707), tag).."\r\n" -- tag

						if string.len (tag) > 0 then -- tag information
							local _, _, cl, ver, mode, hubs, slots = string.find (tag, "^<(.+) V:(.+),M:(%S+),H:(%S+),S:(%d+).*>$")

							if cl then -- client
								info = info.." "..string.format (getlang (721), cl).."\r\n"
							end

							if ver then -- version
								info = info.." "..string.format (getlang (722), ver).."\r\n"
							end

							if mode then -- mode
								info = info.." "..string.format (getlang (708), mode).."\r\n"
							end

							if hubs then -- hubs
								info = info.." "..string.format (getlang (710), hubs).."\r\n"
							end

							if slots then -- slots
								info = info.." "..string.format (getlang (709), slots).."\r\n"
							end
						end

						info = info.." "..string.format (getlang (712), conn).."\r\n" -- connection
						info = info.." "..string.format (getlang (713), statustostr (sts)).."\r\n" -- status
						info = info.." "..string.format (getlang (714), email).."\r\n" -- email
						info = info.." "..string.format (getlang (715), makesize (share)).."\r\n" -- share

						if tonumber (share) > 0 then
							info = info.." "..string.format (getlang (716), share.." "..getlang (365)).."\r\n" -- exact share
						end
					end

					break
				end
			end
		end

		if info == "" then
			commandanswer (nick, string.format (getlang (754), user))
		else
			commandanswer (nick, getlang (755)..":\r\n\r\n"..info)
		end

	else
		commandanswer (nick, string.format (getlang (754), user))
	end

else -- user
	local info = ""
	local class = getclass (user)
	local ip = getip (user)

	if table_sets ["custnickclass"] < 11 then -- nick
		local cn = getcustnick (user)

		if cn then
			info = info.." "..string.format (getlang (705), user.." @ "..cn).."\r\n"
		else
			info = info.." "..string.format (getlang (705), user).."\r\n"
		end

	else
		info = info.." "..string.format (getlang (705), user).."\r\n"
	end

		if (table_sets ["showuseruptime"] == 1) and table_usup [user] then -- uptime
			info = info.." "..string.format (getlang (787), formatuptime (table_usup [user], false)).."\r\n"
		end

	info = info.." "..string.format (getlang (717), class).."\r\n" -- class

	if getconfig ("dns_lookup") ~= 0 then
		info = info .. " " .. string.format (getlang (719), gethost (user)) .. "\r\n" -- dns
	end

	info = info .. " " .. string.format (getlang (718), ip) .. "\r\n" -- ip

	if table_othsets ["func_getusergeoip"] == true then
		local on, geoip = VH:GetUserGeoIP (user)

		if on and geoip and geoip ["host"] then
			if geoip ["range_low"] and geoip ["range_high"] then
				info = info .. " " .. string.format (getlang (911), geoip ["range_low"], geoip ["range_high"]) .. "\r\n" -- range
			end

			if geoip ["city"] then
				info = info .. " " .. string.format (getlang (910), geoip ["city"]) .. "\r\n" -- city
			end

			if geoip ["region_code"] then
				local extra = ""

				if geoip ["region"] then
					extra = "=" .. geoip ["region"]
				end

				info = info .. " " .. string.format (getlang (912), geoip ["region_code"] .. extra) .. "\r\n" -- region code and region
			end

			if geoip ["country_code"] then
				local extra = ""

				if geoip ["country"] then
					extra = "=" .. geoip ["country"]
				end

				info = info .. " " .. string.format (getlang (720), geoip ["country_code"] .. extra) .. "\r\n" -- country code and country
			end

			if geoip ["continent_code"] then
				local extra = ""

				if geoip ["continent"] then
					extra = "=" .. geoip ["continent"]
				end

				info = info .. " " .. string.format (getlang (914), geoip ["continent_code"] .. extra) .. "\r\n" -- continent code and continent
			end

			if geoip ["time_zone"] then
				info = info .. " " .. string.format (getlang (913), geoip ["time_zone"]) .. "\r\n" -- time zone
			end

			if geoip ["latitude"] and geoip ["latitude"] > 0 and geoip ["longitude"] and geoip ["longitude"] > 0 then
				info = info .. " " .. string.format (getlang (916), geoip ["latitude"], geoip ["longitude"]) .. "\r\n" -- latitude and longitude
			end

			if geoip ["postal_code"] then
				info = info .. " " .. string.format (getlang (915), geoip ["postal_code"]) .. "\r\n" -- postal code
			end

			if geoip ["metro_code"] and geoip ["metro_code"] > 0 then
				info = info .. " " .. string.format (getlang (917), geoip ["metro_code"]) .. "\r\n" -- metro code
			end

			if geoip ["area_code"] and geoip ["area_code"] > 0 then
				info = info .. " " .. string.format (getlang (918), geoip ["area_code"]) .. "\r\n" -- area code
			end
		end
	end

	local mi = getmyinfo (user)

	if mi then
		local desc, tag, conn, sts, email, share = parsemyinfo (user, mi)
		info = info.." "..string.format (getlang (706), desc).."\r\n" -- description
		info = info.." "..string.format (getlang (707), tag).."\r\n" -- tag

		if string.len (tag) > 0 then -- tag information
			local _, _, cl, ver, mode, hubs, slots, lmt = string.find (tag, "^<(.+) V:(.+),M:(%S+),H:(%S+),S:(%d+)(.*>)$")

			if lmt then
				_, _, lmt = string.find (lmt, ",L:(.+)[,>]")
			end

			if cl then -- client
				info = info.." "..string.format (getlang (721), cl).."\r\n"
			end

			if ver then -- version
				info = info.." "..string.format (getlang (722), ver).."\r\n"
			end

			if mode then -- mode
				info = info.." "..string.format (getlang (708), mode).."\r\n"
			end

			if hubs then -- hubs
				info = info.." "..string.format (getlang (710), hubs).."\r\n"
			end

			if slots then -- slots
				info = info.." "..string.format (getlang (709), slots).."\r\n"
			end

			if lmt then -- limiter
				info = info.." "..string.format (getlang (711), lmt).."\r\n"
			end
		end

		info = info.." "..string.format (getlang (712), conn).."\r\n" -- connection
		info = info.." "..string.format (getlang (713), statustostr (sts)).."\r\n" -- status
		info = info.." "..string.format (getlang (714), email).."\r\n" -- email
		info = info.." "..string.format (getlang (715), makesize (share)).."\r\n" -- share

		if tonumber (share) > 0 then
			info = info.." "..string.format (getlang (716), share.." "..getlang (365)).."\r\n" -- exact share
		end
	end

	if table_othsets ["func_getusersupports"] == true then
		local on, sup = VH:GetUserSupports (user)

		if on and sup and sup ~= "" then
			info = info .. " " .. string.format (getlang (894), sup) .. "\r\n" -- supports
		end
	end

	if table_othsets ["func_getuserversion"] == true then
		local on, ver = VH:GetUserVersion (user)

		if on and ver and ver ~= "" then
			info = info .. " " .. string.format (getlang (893), ver) .. "\r\n" -- version
		end
	end

	commandanswer (nick, getlang (703)..":\r\n\r\n"..info)
end
end

----- ---- --- -- -

function showipinfo (nick, ip)
	if table_othsets ["func_gethostgeoip"] == true then
		local info = ""
		local ok, geoip = VH:GetHostGeoIP (ip)

		if ok and geoip and geoip ["host"] then
			if geoip ["range_low"] and geoip ["range_high"] then
				info = info .. " " .. string.format (getlang (911), geoip ["range_low"], geoip ["range_high"]) .. "\r\n" -- range
			end

			if geoip ["city"] then
				info = info .. " " .. string.format (getlang (910), geoip ["city"]) .. "\r\n" -- city
			end

			if geoip ["region_code"] then
				local extra = ""

				if geoip ["region"] then
					extra = "=" .. geoip ["region"]
				end

				info = info .. " " .. string.format (getlang (912), geoip ["region_code"] .. extra) .. "\r\n" -- region code and region
			end

			if geoip ["country_code"] then
				local extra = ""

				if geoip ["country"] then
					extra = "=" .. geoip ["country"]
				end

				info = info .. " " .. string.format (getlang (720), geoip ["country_code"] .. extra) .. "\r\n" -- country code and country
			end

			if geoip ["continent_code"] then
				local extra = ""

				if geoip ["continent"] then
					extra = "=" .. geoip ["continent"]
				end

				info = info .. " " .. string.format (getlang (914), geoip ["continent_code"] .. extra) .. "\r\n" -- continent code and continent
			end

			if geoip ["time_zone"] then
				info = info .. " " .. string.format (getlang (913), geoip ["time_zone"]) .. "\r\n" -- time zone
			end

			if geoip ["latitude"] and geoip ["latitude"] > 0 and geoip ["longitude"] and geoip ["longitude"] > 0 then
				info = info .. " " .. string.format (getlang (916), geoip ["latitude"], geoip ["longitude"]) .. "\r\n" -- latitude and longitude
			end

			if geoip ["postal_code"] then
				info = info .. " " .. string.format (getlang (915), geoip ["postal_code"]) .. "\r\n" -- postal code
			end

			if geoip ["metro_code"] and geoip ["metro_code"] > 0 then
				info = info .. " " .. string.format (getlang (917), geoip ["metro_code"]) .. "\r\n" -- metro code
			end

			if geoip ["area_code"] and geoip ["area_code"] > 0 then
				info = info .. " " .. string.format (getlang (918), geoip ["area_code"]) .. "\r\n" -- area code
			end
		end

		if info ~= "" then
			commandanswer (nick, getlang (930) .. ":\r\n\r\n " .. string.format (getlang (718), ip) .. "\r\n" .. info)
		else
			commandanswer (nick, string.format (getlang (931), ip))
		end
	else
		commandanswer (nick, string.format (getlang (514), "Verlihub 1.0.0 RC1"))
	end
end

----- ---- --- -- -

function showcmdlog (nick, cls, ln)
local nn = tonumber (ln)
if nn < 1 then nn = 1 end
local _, rows = VH:SQLQuery ("select `time`, `nick`, `class`, `command` from `"..tbl_sql ["clog"].."` where `class` <= "..cls.." order by `time` desc limit "..nn)

if rows > 0 then
	local list = ""

	for x = 0, rows - 1 do
		local _, tm, usr, ucl, cmd = VH:SQLFetch (x)
		list = list.." "..os.date (table_sets ["dateformat"].." "..table_sets ["timeformat"], tm)..": ["..prezero (2, ucl).."] <"..usr.."> "..cmd.."\r\n"
	end

	commandanswer (nick, string.format (getlang (780), rows)..":\r\n\r\n"..list)
else
	commandanswer (nick, getlang (781))
end
end

----- ---- --- -- -

function showuserlog (nick, line)
local _, _, tp, str, lim = string.find (line, "^(%S+) (.+) (%d+)$")

if (tp == "nick") or (tp == "ip") or (tp == "desc") or (tp == "tag") or (tp == "conn") or (tp == "email") or (tp == "share") or (tp == "all") then
lim = tonumber (lim)
if lim < 1 then lim = 1 end
str = repsqlchars (str)

if tp == "all" then
local _, rows = VH:SQLQuery ("select `time`, `nick`, `ip`, `desc`, `tag`, `conn`, `email`, `share` from `"..tbl_sql ["ulog"].."` where `nick` like '%"..str.."%' or `ip` like '%"..str.."%' or `desc` like '%"..str.."%' or `tag` like '%"..str.."%' or `conn` like '%"..str.."%' or `email` like '%"..str.."%' or `share` like '%"..str.."%' order by `time` desc limit "..lim)

if rows > 0 then
local res = ""

for x = 0, rows - 1 do
local _, rtime, rnick, rip, rdesc, rtag, rconn, remail, rshare = VH:SQLFetch (x)
res = res.." [ O: "..fromunixtime (rtime, false).." ] [ N: "..repnmdcoutchars (rnick).." ]"
if rip ~= "[unknown]" then res = res.." [ I: "..repnmdcoutchars (rip).." ]" end
if rdesc ~= "" then res = res.." [ D: "..repnmdcoutchars (rdesc).." ]" end
if rtag ~= "" then res = res.." [ T: "..repnmdcoutchars (rtag).." ]" end
if rconn ~= "" then res = res.." [ C: "..repnmdcoutchars (rconn).." ]" end
if remail ~= "" then res = res.." [ E: "..repnmdcoutchars (remail).." ]" end
if rshare ~= "0" then res = res.." [ S: "..repnmdcoutchars (rshare).." ]" end
res = res.."\r\n"
end

commandanswer (nick, string.format (getlang (122), rows)..":\r\n\r\n"..res)
else
commandanswer (nick, getlang (121))
end

else -- specific
local _, rows = VH:SQLQuery ("select `time`, `nick`, `ip`, `desc`, `tag`, `conn`, `email`, `share` from `"..tbl_sql ["ulog"].."` where `"..tp.."` like '%"..str.."%' order by `time` desc limit "..lim)

if rows > 0 then
local res = ""

for x = 0, rows - 1 do
local _, rtime, rnick, rip, rdesc, rtag, rconn, remail, rshare = VH:SQLFetch (x)
res = res.." [ O: "..fromunixtime (rtime, false).." ] [ N: "..repnmdcoutchars (rnick).." ]"
if rip ~= "[unknown]" then res = res.." [ I: "..repnmdcoutchars (rip).." ]" end
if rdesc ~= "" then res = res.." [ D: "..repnmdcoutchars (rdesc).." ]" end
if rtag ~= "" then res = res.." [ T: "..repnmdcoutchars (rtag).." ]" end
if rconn ~= "" then res = res.." [ C: "..repnmdcoutchars (rconn).." ]" end
if remail ~= "" then res = res.." [ E: "..repnmdcoutchars (remail).." ]" end
if rshare ~= "0" then res = res.." [ S: "..repnmdcoutchars (rshare).." ]" end
res = res.."\r\n"
end

commandanswer (nick, string.format (getlang (122), rows)..":\r\n\r\n"..res)
else
commandanswer (nick, getlang (121))
end
end

else -- unknown type
commandanswer (nick, string.format (getlang (100), "nick, ip, desc, tag, conn, email, share "..getlang (70).." all"))
end
end

----- ---- --- -- -

function collectstats ()
local tm = os.time () + table_sets ["srvtimediff"] -- current time

-- users
local uc = getusercount ()
VH:SQLQuery ("insert into `"..tbl_sql ["stat"].."` (`type`, `time`, `count`) values ('users_now', "..tm..", "..uc..") on duplicate key update `time` = "..tm..", `count` = "..uc)
local _, rows = VH:SQLQuery ("select `time`, `count` from `"..tbl_sql ["stat"].."` where `type` = 'users_peak' limit 1")

if rows > 0 then
	local _, ptm, puc = VH:SQLFetch (0)

	if uc > tonumber (puc) then
		VH:SQLQuery ("update `"..tbl_sql ["stat"].."` set `time` = "..tm..", `count` = "..uc.." where `type` = 'users_peak' limit 1")

		if table_sets ["classnotipeakuc"] < 11 then
			local msg = table_sets ["userrecmsg"]

			if string.find (msg, "<longdate>") then
				msg = string.gsub (msg, "<longdate>", reprexpchars (fromunixtime (ptm, false)))
			end

			if string.find (msg, "<shortdate>") then
				msg = string.gsub (msg, "<shortdate>", reprexpchars (fromunixtime (ptm, true)))
			end

			if string.find (msg, "<old>") then
				msg = string.gsub (msg, "<old>", reprexpchars (puc))
			end

			if string.find (msg, "<new>") then
				msg = string.gsub (msg, "<new>", reprexpchars (uc))
			end

			maintoall (msg, table_sets ["classnotipeakuc"], 10)
		end
	end

else
	VH:SQLQuery ("insert into `"..tbl_sql ["stat"].."` (`type`, `time`, `count`) values ('users_peak', "..tm..", "..uc..")")
end

-- share
local ts = gettotsharesize ()
VH:SQLQuery ("insert into `"..tbl_sql ["stat"].."` (`type`, `time`, `count`) values ('share_now', "..tm..", "..ts..") on duplicate key update `time` = "..tm..", `count` = "..ts)
local _, rows = VH:SQLQuery ("select `time`, `count` from `"..tbl_sql ["stat"].."` where `type` = 'share_peak' limit 1")

if rows > 0 then
	local _, ptm, pts = VH:SQLFetch (0)

	if ts > tonumber (pts) then
		VH:SQLQuery ("update `"..tbl_sql ["stat"].."` set `time` = "..tm..", `count` = "..ts.." where `type` = 'share_peak' limit 1")

		if table_sets ["classnotipeakts"] < 11 then
			local msg = table_sets ["sharerecmsg"]

			if string.find (msg, "<longdate>") then
				msg = string.gsub (msg, "<longdate>", reprexpchars (fromunixtime (ptm, false)))
			end

			if string.find (msg, "<shortdate>") then
				msg = string.gsub (msg, "<shortdate>", reprexpchars (fromunixtime (ptm, true)))
			end

			if string.find (msg, "<old>") then
				msg = string.gsub (msg, "<old>", reprexpchars (makesize (pts)))
			end

			if string.find (msg, "<new>") then
				msg = string.gsub (msg, "<new>", reprexpchars (makesize (ts)))
			end

			maintoall (msg, table_sets ["classnotipeakts"], 10)
		end
	end

else
	VH:SQLQuery ("insert into `"..tbl_sql ["stat"].."` (`type`, `time`, `count`) values ('share_peak', "..tm..", "..ts..")")
end

	-- average share per user

	if (uc > 0) and (ts > 0) then
		local avg = roundint ((ts / uc), 0)
		VH:SQLQuery ("insert into `"..tbl_sql ["stat"].."` (`type`, `time`, `count`) values ('avgshare_now', "..tm..", "..avg..") on duplicate key update `time` = "..tm..", `count` = "..avg)
		local _, rows = VH:SQLQuery ("select `count` from `"..tbl_sql ["stat"].."` where `type` = 'avgshare_peak' limit 1")

		if rows > 0 then
			local _, pavg = VH:SQLFetch (0)

			if avg > tonumber (pavg) then
				VH:SQLQuery ("update `"..tbl_sql ["stat"].."` set `time` = "..tm..", `count` = "..avg.." where `type` = 'avgshare_peak' limit 1")
			end
		else
			VH:SQLQuery ("insert into `"..tbl_sql ["stat"].."` (`type`, `time`, `count`) values ('avgshare_peak', "..tm..", "..avg..")")
		end
	end

-- uptime
if table_othsets ["func_getuptime"] == true then
	local ut = getuptime ()
	VH:SQLQuery ("insert into `"..tbl_sql ["stat"].."` (`type`, `time`, `count`) values ('uptime_now', "..tm..", "..ut..") on duplicate key update `time` = "..tm..", `count` = "..ut)
	local _, rows = VH:SQLQuery ("select `count` from `"..tbl_sql ["stat"].."` where `type` = 'uptime_peak' limit 1")

	if rows > 0 then
		local _, put = VH:SQLFetch (0)

		if ut > tonumber (put) then
			VH:SQLQuery ("update `"..tbl_sql ["stat"].."` set `time` = "..tm..", `count` = "..ut.." where `type` = 'uptime_peak' limit 1")
		end

	else
		VH:SQLQuery ("insert into `"..tbl_sql ["stat"].."` (`type`, `time`, `count`) values ('uptime_peak', "..tm..", "..ut..")")
	end
end

-- memory
local mu = getmemusg ()
VH:SQLQuery ("insert into `"..tbl_sql ["stat"].."` (`type`, `time`, `count`) values ('memory_now', "..tm..", "..mu..") on duplicate key update `time` = "..tm..", `count` = "..mu)
local _, rows = VH:SQLQuery ("select `time`, `count` from `"..tbl_sql ["stat"].."` where `type` = 'memory_peak' limit 1")

if rows > 0 then
	local _, ptm, pmu = VH:SQLFetch (0)

	if mu > tonumber (pmu) then
		VH:SQLQuery ("update `"..tbl_sql ["stat"].."` set `time` = "..tm..", `count` = "..mu.." where `type` = 'memory_peak' limit 1")
	end

else
	VH:SQLQuery ("insert into `"..tbl_sql ["stat"].."` (`type`, `time`, `count`) values ('memory_peak', "..tm..", "..mu..")")
end

-- nick lists
local nl, ol = "", ""

for usr in string.gmatch (getnicklist (), "([^$]+)%$%$") do
	if isbot (usr) == false then
		if (getclass (usr) >= 3) or table_opks [usr] then
			ol = ol..usr.."$$"
		else
			nl = nl..usr.."$$"
		end
	end
end

nl, ol = repsqlchars (nl), repsqlchars (ol)
VH:SQLQuery ("insert into `"..tbl_sql ["stat"].."` (`type`, `time`, `count`) values ('user_list', "..tm..", '"..nl.."') on duplicate key update `time` = "..tm..", `count` = '"..nl.."'")
VH:SQLQuery ("insert into `"..tbl_sql ["stat"].."` (`type`, `time`, `count`) values ('operator_list', "..tm..", '"..ol.."') on duplicate key update `time` = "..tm..", `count` = '"..ol.."'")
end

----- ---- --- -- -

function calculate (nick, line)
	local _, _, anum, bnum = string.find (line, "^(%S+) %S (%S+)$")
	anum = string.gsub (anum, ",", ".")
	bnum = string.gsub (bnum, ",", ".")

	if (tonumber (anum) or (string.lower (anum) == "pi")) and (tonumber (bnum) or (string.lower (bnum) == "pi")) then
		local _, _, oper = string.find (line, "^%S+ (%S) %S+$")

		if (oper == "+") or (oper == "-") or (oper == "*") or (oper == "x") or (oper == "/") or (oper == "^") then
			if string.lower (anum) == "pi" then
				anum = math.pi
			else
				anum = tonumber (anum)
			end

			if string.lower (bnum) == "pi" then
				bnum = math.pi
			else
				bnum = tonumber (bnum)
			end

			local reslt = 0

			if oper == "+" then
				reslt = anum + bnum
			elseif oper == "-" then
				reslt = anum - bnum
			elseif (oper == "*") or (oper == "x") then
				reslt = anum * bnum
			elseif oper == "/" then
				if bnum == 0 then -- division by zero
					commandanswer (nick, getlang (250))
					return nil
				end

				reslt = anum / bnum
			elseif oper == "^" then
				reslt = anum ^ bnum
			end

			commandanswer (nick, anum.." "..oper.." "..bnum.." = "..reslt)
		else
			commandanswer (nick, string.format (getlang (482), "+, -, *, / "..getlang (70).." ^"))
		end
	else
		commandanswer (nick, getlang (481))
	end
end

----- ---- --- -- -

function addauthentry (nick, item)
	local _, _, user, ip = string.find (item, "^(%S+) (.+)$")
	VH:SQLQuery ("insert into `"..tbl_sql ["auth"].."` (`nick`, `ip`) values ('"..repsqlchars (user).."', '"..repsqlchars (repnmdcinchars (ip)).."')")
	commandanswer (nick, string.format (getlang (236), user, ip))
end

----- ---- --- -- -

function modauthentry (nick, item)
	local _, _, id, ip = string.find (item, "^(%d+) (.+)$")
	local _, rows = VH:SQLQuery ("select `nick` from `"..tbl_sql ["auth"].."` where `id` = "..id.." limit 1")

	if rows > 0 then
		local _, user = VH:SQLFetch (0)
		VH:SQLQuery ("update `"..tbl_sql ["auth"].."` set `ip` = '"..repsqlchars (repnmdcinchars (ip)).."' where `id` = "..id.." limit 1")
		commandanswer (nick, string.format (getlang (235), user, ip))
	else
		commandanswer (nick, string.format (getlang (786), id))
	end
end

----- ---- --- -- -

function delauthentry (nick, id)
	local _, rows = VH:SQLQuery ("select `nick` from `"..tbl_sql ["auth"].."` where `id` = "..id.." limit 1")

	if rows > 0 then
		local _, user = VH:SQLFetch (0)
		VH:SQLQuery ("delete from `"..tbl_sql ["auth"].."` where `id` = "..id.." limit 1")
		commandanswer (nick, string.format (getlang (237), user))
	else
		commandanswer (nick, string.format (getlang (238), id))
	end
end

----- ---- --- -- -

function listauthentry (nick)
	local _, rows = VH:SQLQuery ("select `id`, `nick`, `ip`, `badip`, `good`, `bad` from `"..tbl_sql ["auth"].."` order by `nick` asc, `bad` desc, `good` desc")

	if rows > 0 then
		local list, len, seclen = "", 0, 0

		for x = 0, rows - 1 do
			local _, id, user, ip, bip, good, bad = VH:SQLFetch (x)

			if x == 0 then
				len = string.len (good)
				seclen = string.len (bad)
			end

			list = list.." "..prezero (string.len (rows), (x + 1))..". [ B: "..prezero (seclen, bad).." ] [ G: "..prezero (len, good).." ] [ I: "..id.." ] "..user.." @ "..repnmdcoutchars (ip).." [ LB: "..bip.." ]\r\n"
		end

		commandanswer (nick, getlang (239)..":\r\n\r\n"..list)
	else
		commandanswer (nick, getlang (240))
	end
end

----- ---- --- -- -

function authcheck (nick, cls, uip)
	if uip == "[unknown]" then return false end
	local user = repsqlchars (nick)
	local _, rows = VH:SQLQuery ("select `id`, `ip` from `"..tbl_sql ["auth"].."` where `nick` = '"..user.."'")
	if rows == 0 then return false end

	for x = 0, rows - 1 do
		local _, id, ip = VH:SQLFetch (x)

		if string.find (uip, ip) then -- match
			VH:SQLQuery ("update `"..tbl_sql ["auth"].."` set `good` = `good` + 1 where `id` = "..id.." limit 1")
			opsnotify (table_sets ["classnotiauth"], string.format (getlang (244), nick, uip .. tryipcc (uip, nick), cls))
			return false
		end
	end

	maintouser (nick, table_sets ["authmessage"])
	VH:SQLQuery ("update `"..tbl_sql ["auth"].."` set `badip` = '"..repsqlchars (uip).."', `bad` = `bad` + 1 where `nick` = '"..user.."'")
	VH:CloseConnection (nick) -- drop user
	opsnotify (table_sets ["classnotiauth"], string.format (getlang (245), nick, uip .. tryipcc (uip, nick), cls))
	return true
end

----- ---- --- -- -

function checkregmecmd (nick, ucl)
	if getconfig ("disable_regme_cmd") ~= 0 then return 1 end
	if ucl >= 1 then return 1 end -- unregistered only

	if table_sets ["regmechatcnt"] > 0 then
		if table_regm [nick] then
			if table_regm [nick] < table_sets ["regmechatcnt"] then
				commandanswer (nick, string.format (getlang (816), (table_sets ["regmechatcnt"] - table_regm [nick])))
				return 0
			end
		else
			commandanswer (nick, string.format (getlang (816), table_sets ["regmechatcnt"]))
			return 0
		end
	end

	if (table_sets ["regmeuptime"] > 0) and (table_sets ["showuseruptime"] == 1) then
		if table_usup [nick] then
			local dif = os.time () - table_usup [nick]

			if (dif / 60) < table_sets ["regmeuptime"] then
				commandanswer (nick, string.format (getlang (817), roundint ((table_sets ["regmeuptime"] - (dif / 60)), 1)))
				return 0
			end
		--else
			--commandanswer (nick, string.format (getlang (819), table_sets ["regmeuptime"]))
			--return 0
		end
	end

	return 1
end

----- ---- --- -- -

function autoupdatecheck ()
	local res, _ = os.execute ("curl -L --retry 3 --connect-timeout 5 -m 15 -A \"Verlihub\" -s -o \"" .. table_othsets ["cfgdir"] .. table_othsets ["tmpfile"] .. "\" \"" .. table_othsets ["updserv"] .. table_othsets ["verfile"] .. "\"")

	if res then
		local f = io.open (table_othsets ["cfgdir"] .. table_othsets ["tmpfile"], "r")

		if f then
			local ver, _ = f:read ("*line") -- read first line
			f:close ()

			if ver and string.find (ver, "^%d+%.%d+%.%d+$") then
				local vernum = ver:gsub ("%.", "")
				local verledonum = ver_ledo:gsub ("%.", "")

				if tonumber (vernum) > tonumber (verledonum) then -- version number is higher
					opsnotify (table_sets ["classnotiledoact"], string.format (getlang (822), ver, string.sub (getconfig ("cmd_start_op"), 1, 1) .. table_cmnds ["ledover"]))
				end
			end
		end

		os.remove (table_othsets ["cfgdir"] .. table_othsets ["tmpfile"]) -- cleanup
	end
end

----- ---- --- -- -

function updatescript (nick)
	if not table_othsets ["ver_curl"] then
		commandanswer (nick, string.format (getlang (691), "cURL"))
	else
		commandanswer (nick, getlang (229))
		local res, err = os.execute ("curl -L --retry 3 --connect-timeout 5 -m 15 -A \"Verlihub\" -s -o \"" .. table_othsets ["cfgdir"] .. table_othsets ["tmpfile"] .. "\" \"" .. table_othsets ["updserv"] .. table_othsets ["verfile"] .. "\"")

		if res then
			local f = io.open (table_othsets ["cfgdir"] .. table_othsets ["tmpfile"], "r")

			if f then
				local ver, err = f:read ("*line") -- read first line
				f:close ()
				os.remove (table_othsets ["cfgdir"] .. table_othsets ["tmpfile"])

				if ver then
					if not string.find (ver, "^%d+%.%d+%.%d+$") then -- unexpected content
						commandanswer (nick, string.format (getlang (19), table_othsets ["verfile"]))
					else -- expected content
						local vernum = ver:gsub ("%.", "")
						local verledonum = ver_ledo:gsub ("%.", "")

						if tonumber (vernum) > tonumber (verledonum) then -- version number is higher
							commandanswer (nick, string.format (getlang (24), ver))
							local res, err = os.execute ("curl -L --retry 3 --connect-timeout 5 -m 15 -A \"Verlihub\" -s -o \"" .. table_othsets ["cfgdir"] .. "ledokol.lua\" \"" .. table_othsets ["updserv"] .. "ledokol.lua\"")

							if res then
								local f = io.open (table_othsets ["cfgdir"] .. "ledokol.lua", "r")

								if f then
									local ledo, err = f:read ("*all") -- read the file
									f:close ()

									if ledo then
										if not string.find (ledo, "ver_ledo = \"" .. ver .. "\" %-%- ledokol version") then -- unexpected content
											os.remove (table_othsets ["cfgdir"] .. "ledokol.lua")
											commandanswer (nick, string.format (getlang (19), "ledokol.lua"))
										else -- expected content
											commandanswer (nick, getlang (346))
											local res, err = os.execute ("mv -f \"" .. table_othsets ["cfgdir"] .. "ledokol.lua\" \"" .. table_othsets ["cfgdir"] .. "scripts/ledokol.lua\"")

											if res then
												if os.execute ("curl -L --retry 3 --connect-timeout 5 -m 15 -A \"Verlihub\" -s -o \"" .. table_othsets ["cfgdir"] .. "ledo_en.txt\" \"" .. table_othsets ["updserv"] .. "ledo_en.txt\"") then
													local f = io.open (table_othsets ["cfgdir"] .. "ledo_en.txt", "r")

													if f then
														local ledo = f:read ("*all") -- read the file
														f:close ()

														if ledo then
															if not string.find (ledo, "Version: " .. ver) then -- unexpected content
																os.remove (table_othsets ["cfgdir"] .. "ledo_en.txt")
															elseif not os.execute ("mv -f \"" .. table_othsets ["cfgdir"] .. "ledo_en.txt\" \"" .. table_othsets ["cfgdir"] .. "scripts/ledo_en.txt\"") then -- expected content
																os.remove (table_othsets ["cfgdir"] .. "ledo_en.txt")
															end
														else -- unable to read ledo_en.txt
															os.remove (table_othsets ["cfgdir"] .. "ledo_en.txt")
														end
													end
												end

												commandanswer (nick, getlang (345) .. "\r\n\r\n !luaunload " .. table_othsets ["cfgdir"] .. "scripts/ledokol.lua\r\n !luaload " .. table_othsets ["cfgdir"] .. "scripts/ledokol.lua\r\n")
											else -- unable to execute shell command
												os.remove (table_othsets ["cfgdir"] .. "ledokol.lua")
												commandanswer (nick, string.format (getlang (661), (err or getlang (662))))
											end
										end
									else -- unable to read ledokol.lua
										commandanswer (nick, string.format (getlang (661), (err or getlang (662))))
									end
								else -- unable to open ledokol.lua
									--commandanswer (nick, string.format (getlang (661), (err or getlang (662))))
									commandanswer (nick, getlang (16))
								end
							else -- unable to execute shell command
								commandanswer (nick, string.format (getlang (661), (err or getlang (662))))
							end
						else -- version number is same or lower
							commandanswer (nick, getlang (25))
						end
					end
				else -- unable to read ledokol.ver
					commandanswer (nick, string.format (getlang (661), (err or getlang (662))))
				end
			else -- unable to open ledokol.ver
				--commandanswer (nick, string.format (getlang (661), (err or getlang (662))))
				commandanswer (nick, getlang (16))
			end
		else -- unable to execute shell command
			commandanswer (nick, string.format (getlang (661), (err or getlang (662))))
		end
	end
end

----- ---- --- -- -

function cleanhistory (nick, limt, autom, cls)
local rows = counttable (tbl_sql ["mchist"])

if rows > 0 then
if limt == 0 then
VH:SQLQuery ("truncate table `"..tbl_sql ["mchist"].."`")
elseif rows > limt then
rows = rows - limt
VH:SQLQuery ("delete from `"..tbl_sql ["mchist"].."` order by `date` asc limit "..rows)
end

if (limt == 0) or (rows > limt) then
commandanswer (nick, string.format (getlang (11), rows))
opsnotify (table_sets ["classnotiledoact"], string.format (getlang (15), nick, cls, rows))
end

else

if autom == 0 then
commandanswer (nick, getlang (12))
end
end

rows = counttable (tbl_sql ["ophist"])

if rows > 0 then
if limt == 0 then
VH:SQLQuery ("truncate table `"..tbl_sql ["ophist"].."`")
elseif rows > limt then
rows = rows - limt
VH:SQLQuery ("delete from `"..tbl_sql ["ophist"].."` order by `date` asc limit "..rows)
end

if (limt == 0) or (rows > limt) then
commandanswer (nick, string.format (getlang (13), rows))
opsnotify (table_sets ["classnotiledoact"], string.format (getlang (405), nick, cls, rows))
end

else

if autom == 0 then
commandanswer (nick, getlang (14))
end
end
end

----- ---- --- -- -

function sendmchistory (nick, lnnum, autosend)
local lnn = tonumber (lnnum)

if lnn >= table_sets ["histlimit"] then
lnn = table_sets ["histlimit"]
elseif lnn <= 1 then
lnn = 1
end

local _, rows = VH:SQLQuery ("select `nick`, `date`, `message` from `"..tbl_sql ["mchist"].."` order by `date` desc, `id` desc limit "..lnn)

if rows > 0 then
local aentry = ""

for x = 0, rows - 1 do
local _, user, adate, msg = VH:SQLFetch (x)

	if autosend == 1 then -- truncate the message
		if table_sets ["histautonewlinedel"] == 1 then
			msg = string.gsub (msg, "[\r\n]", "")
		end

		if (table_sets ["histautolinemax"] > 0) and (string.len (msg) > table_sets ["histautolinemax"]) then
			msg = string.sub (msg, 1, table_sets ["histautolinemax"]) .. " [...]"
		end
	end

aentry = " "..os.date (table_sets ["dateformat"].." "..table_sets ["timeformat"], adate)..": <"..user.."> "..msg.."\r\n"..aentry
end

if autosend == 0 then
commandanswer (nick, string.format (getlang (17), rows)..":\r\n\r\n"..aentry)
else
maintouser (nick, string.format (getlang (17), rows)..":\r\n\r\n"..aentry)
end

else

if autosend == 0 then -- only if sending manually
commandanswer (nick, getlang (18))
end
end
end

----- ---- --- -- -

function sendophistory (nick, lnnum, autosend, inopchat)
local lnnm = tonumber (lnnum)

if lnnm >= table_sets ["histlimit"] then
lnnm = table_sets ["histlimit"]
elseif lnnm < 1 then
lnnm = 1
end

local _, rows = VH:SQLQuery ("select `nick`, `date`, `message` from `"..tbl_sql ["ophist"].."` order by `date` desc, `id` desc limit "..lnnm)

if rows > 0 then
local aentry = ""

for x = 0, rows - 1 do
local _, user, adate, msg = VH:SQLFetch (x)

	if autosend == 1 then -- truncate the message
		if table_sets ["histautonewlinedel"] == 1 then
			msg = string.gsub (msg, "[\r\n]", "")
		end

		if (table_sets ["histautolinemax"] > 0) and (string.len (msg) > table_sets ["histautolinemax"]) then
			msg = string.sub (msg, 1, table_sets ["histautolinemax"]) .. " [...]"
		end
	end

aentry = " "..os.date (table_sets ["dateformat"].." "..table_sets ["timeformat"], adate)..": <"..user.."> "..msg.."\r\n"..aentry
end

if autosend == 0 then
if inopchat == true then
pmtouser (nick, table_othsets ["opchatnick"], string.format (getlang (21), rows)..":\r\n\r\n"..aentry)
else
commandanswer (nick, string.format (getlang (21), rows)..":\r\n\r\n"..aentry)
end

else
maintouser (nick, string.format (getlang (21), rows)..":\r\n\r\n"..aentry)
end

else

if autosend == 0 then -- only if sending manually
if inopchat == true then
pmtouser (nick, table_othsets ["opchatnick"], getlang (22))
else
commandanswer (nick, getlang (22))
end
end
end
end

----- ---- --- -- -

function sendownhistory (nick, lnnum)
local lnnm = tonumber (lnnum)

if lnnm >= table_sets ["histlimit"] then
lnnm = table_sets ["histlimit"]
elseif lnnm < 1 then
lnnm = 1
end

local _, rows = VH:SQLQuery ("select `nick`, `date`, `message` from `"..tbl_sql ["mchist"].."` where `realnick` = '"..repsqlchars (nick).."' order by `date` desc, `id` desc limit "..lnnm)

if rows > 0 then
local aentry = ""

for x = 0, rows - 1 do
local _, user, adate, msg = VH:SQLFetch (x)
aentry = " "..os.date (table_sets ["dateformat"].." "..table_sets ["timeformat"], adate)..": <"..user.."> "..msg.."\r\n"..aentry
end

commandanswer (nick, string.format (getlang (463), rows)..":\r\n\r\n"..aentry)
else
commandanswer (nick, getlang (462))
end
end

----- ---- --- -- -

function addmchistoryline (nick, realnick, line)
if table_sets ["histlimit"] == 0 then return nil end
if (nick == table_othsets ["sendfrom"]) and (table_sets ["histbotmsg"] == 0) then return nil end
local _, rows = VH:SQLQuery ("select `date` from `"..tbl_sql ["mchist"].."` order by `date` asc")
local ndate = os.time () + table_sets ["srvtimediff"] -- current time
local rnick = repsqlchars (nick)
local repnick = repsqlchars (realnick)
local str = string.gsub (line, "is kicking", reprexpchars ("is"..string.char (160).."kicking"))
str = repsqlchars (str)

if rows > 0 then
if rows >= table_sets ["histlimit"] then
local _, adate = VH:SQLFetch (0)
VH:SQLQuery ("update `"..tbl_sql ["mchist"].."` set `realnick` = '"..repnick.."', `nick` = '"..rnick.."', `date` = '"..ndate.."', `message` = '"..str.."' where `date` = '"..adate.."' limit 1")
else
VH:SQLQuery ("insert into `"..tbl_sql ["mchist"].."` (`realnick`, `nick`, `date`, `message`) values ('"..repnick.."', '"..rnick.."', '"..ndate.."', '"..str.."')")
end

else
VH:SQLQuery ("insert into `"..tbl_sql ["mchist"].."` (`realnick`, `nick`, `date`, `message`) values ('"..repnick.."', '"..rnick.."', '"..ndate.."', '"..str.."')")
end
end

----- ---- --- -- -

function addophistoryline (nick, line)
if table_sets ["histlimit"] == 0 then return nil end
if string.sub (line, 1, 1) == "+" then return nil end -- skip a chatroom command
local _, rows = VH:SQLQuery ("select `date` from `"..tbl_sql ["ophist"].."` order by `date` asc")
local ndate = os.time () + table_sets ["srvtimediff"] -- current time
local rnick = repsqlchars (nick)
local str = repsqlchars (line)

if rows > 0 then
if rows >= table_sets ["histlimit"] then
local _, adate = VH:SQLFetch (0)
VH:SQLQuery ("update `"..tbl_sql ["ophist"].."` set `nick` = '"..rnick.."', `date` = '"..ndate.."', `message` = '"..str.."' where `date` = '"..adate.."' limit 1")
else
VH:SQLQuery ("insert into `"..tbl_sql ["ophist"].."` (`nick`, `date`, `message`) values ('"..rnick.."', '"..ndate.."', '"..str.."')")
end

else
VH:SQLQuery ("insert into `"..tbl_sql ["ophist"].."` (`nick`, `date`, `message`) values ('"..rnick.."', '"..ndate.."', '"..str.."')")
end
end

----- ---- --- -- -

function addprotentry (nick, line)
local ent = repsqlchars (repnmdcinchars (line))
local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["prot"].."` where `protected` = '"..ent.."' limit 1")

if rows > 0 then -- exists
	commandanswer (nick, string.format (getlang (610), line))
else -- add
	VH:SQLQuery ("insert into `"..tbl_sql ["prot"].."` (`protected`) values ('"..ent.."')")
	commandanswer (nick, string.format (getlang (608), line))
end
end

----- ---- --- -- -

function delprotentry (nick, line)
local ent = repsqlchars (repnmdcinchars (line))
local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["prot"].."` where `protected` = '"..ent.."' limit 1")

if rows > 0 then -- delete
	VH:SQLQuery ("delete from `"..tbl_sql ["prot"].."` where `protected` = '"..ent.."' limit 1")
	commandanswer (nick, string.format (getlang (609), line))
else -- not in list
	commandanswer (nick, string.format (getlang (611), line))
end
end

----- ---- --- -- -

function listprotentry (nick)
local _, rows = VH:SQLQuery ("select `protected`, `occurred` from `"..tbl_sql ["prot"].."` order by `occurred` desc")

if rows > 0 then
	local list, len = "", 0

	for x = 0, rows - 1 do
		local _, ent, occ = VH:SQLFetch (x)
		if x == 0 then len = string.len (occ) end
		list = list.." "..prezero (string.len (rows), (x + 1))..". [ O: "..prezero (len, occ).." ] "..repnmdcoutchars (ent).."\r\n"
	end

	commandanswer (nick, getlang (607)..":\r\n\r\n"..list)
else -- empty
	commandanswer (nick, getlang (612))
end
end

----- ---- --- -- -

function isprotected (nick, ip)
	local _, rows = VH:SQLQuery ("select `protected` from `" .. tbl_sql ["prot"] .. "` order by `occurred` desc")

	if rows > 0 then
		for x = 0, rows - 1 do
			local _, ent = VH:SQLFetch (x)

			if (nick and string.find (tolow (nick), ent)) or (ip and string.find (ip, ent)) then
				VH:SQLQuery ("update `" .. tbl_sql ["prot"] .. "` set `occurred` = `occurred` + 1 where `protected` = '" .. repsqlchars (ent) .. "' limit 1")
				return true
			end
		end
	end

	return false
end

----- ---- --- -- -

function setmode (nick, line)
local _, _, usr, tp = string.find (line, "^(.+) (%S+)$")

--if getstatus (usr) == 1 then
	if tp == "norm" then
		if table_mode [usr] then
			commandanswer (nick, string.format (getlang (633), usr, table_mode [usr], tp))
			table_mode [usr] = nil
		else
			commandanswer (nick, string.format (getlang (634), usr))
		end

	elseif (tp == "rev") or (tp == "cyr") or (tp == "lat") or (tp == "cap") or (tp == "low") or (tp == "pwd") or (tp == "num") then
			commandanswer (nick, string.format (getlang (633), usr, (table_mode [usr] or "norm"), tp))
			table_mode [usr] = tp

	else -- unknown mode
		commandanswer (nick, string.format (getlang (631), "rev, cyr, lat, cap, low, pwd, num "..getlang (70).." norm"))
	end
--else
	--commandanswer (nick, string.format (getlang (468), usr))
--end
end

----- ---- --- -- -

function listmodes (nick)
local list = ""
local x = 1

for k, v in pairs (table_mode) do
	list = list.." "..x..". "..k.." @ "..v.."\r\n"
	x = x + 1
end

if list == "" then
	commandanswer (nick, getlang (636))
else
	commandanswer (nick, getlang (635)..":\r\n\r\n"..list)
end
end

----- ---- --- -- -

function modusrmode (nick, ip, msg)
local ret = msg

for k, v in pairs (table_mode) do
	if string.find (tolow (nick), k) or string.find (ip, k) then
		if v == "rev" then
			ret = string.reverse (ret)
		elseif v == "cyr" then
			ret = convtranslit (ret, 2)
		elseif v == "lat" then
			ret = convtranslit (ret, 1)
		elseif v == "cap" then
			ret = convcaps (ret, false)
		elseif v == "low" then
			ret = convcaps (ret, true)
		elseif v == "pwd" then
			ret = string.gsub (ret, "%S", "*")
		elseif v == "num" then
			ret = string.gsub (ret, "[oOоО]", "0")
			ret = string.gsub (ret, "[iIlL]", "1")
			ret = string.gsub (ret, "[eEеЕ]", "3")
			ret = string.gsub (ret, "[aAаАчЧ]", "4")
			ret = string.gsub (ret, "[sS]", "5")
			ret = string.gsub (ret, "[бБшШ]", "6")
			ret = string.gsub (ret, "[tTтТ%?]", "7")
			ret = string.gsub (ret, "[yYуУ]", "9")
		end

		return ret
	end
end

return ret
end

----- ---- --- -- -

function hublistadd (nick, line)
local _, _, addr, name, ownr = string.find (line, "^(%S+) \"(.+)\" \"(.*)\"$")
if not string.find (addr, ":") then addr = addr..":411" end
local raddr = repsqlchars (addr)
local _, rows = VH:SQLQuery ("select `owner` from `"..tbl_sql ["hubs"].."` where `address` = '"..raddr.."' limit 1")

if rows > 0 then -- update
VH:SQLQuery ("update `"..tbl_sql ["hubs"].."` set `name` = '"..repsqlchars (name).."', `owner` = '"..repsqlchars (ownr).."' where `address` = '"..raddr.."' limit 1")
commandanswer (nick, string.format (getlang (528), addr))
else -- add
VH:SQLQuery ("insert into `"..tbl_sql ["hubs"].."` (`address`, `name`, `owner`) values ('"..raddr.."', '"..repsqlchars (name).."', '"..repsqlchars (ownr).."')")
commandanswer (nick, string.format (getlang (527), addr))
end
end

----- ---- --- -- -

function hublistdel (nick, addr)
local maddr = addr
if not string.find (maddr, ":") then maddr = maddr..":411" end
local raddr = repsqlchars (maddr)
local _, rows = VH:SQLQuery ("select `owner` from `"..tbl_sql ["hubs"].."` where `address` = '"..raddr.."' limit 1")

if rows > 0 then -- delete
VH:SQLQuery ("delete from `"..tbl_sql ["hubs"].."` where `address` = '"..raddr.."' limit 1")
commandanswer (nick, string.format (getlang (529), maddr))
else -- not in list
commandanswer (nick, string.format (getlang (530), maddr))
end
end

----- ---- --- -- -

function hublistshow (nick)
	local _, rows = VH:SQLQuery ("select `address`, `name`, `owner`, `status` from `" .. tbl_sql ["hubs"] .. "` order by `status` desc, `name` asc")

	if rows > 0 then -- ok
		local hlist = ""

		for x = 0, rows - 1 do
			local _, addr, name, ownr, sts = VH:SQLFetch (x)
			local pos = string.find (addr, ":")

			if string.sub (addr, pos + 1, -1) == "411" then
				addr = string.sub (addr, 1, pos - 1)
			end

			if ownr ~= "" then
				ownr = " [ O: " .. ownr .. " ]"
			end

			--if (not lsock) or (table_sets ["hublistpingint"] == 0) then
				sts = ""
			--else
				--if tonumber (sts) == 1 then
					--sts = " [ S: " .. getlang (32) .. " ]"
				--else
					--sts = " [ S: " .. getlang (31) .. " ]"
				--end
			--end

			hlist = hlist .. " " .. prezero (string.len (rows), (x + 1)) .. ". " .. name .. " @ dchub://" .. addr .. "/" .. ownr .. sts .. "\r\n" -- todo: do something about adc:// hubs
		end

		commandanswer (nick, getlang (531) .. ":\r\n\r\n" .. hlist)
	else -- empty
		commandanswer (nick, getlang (532))
	end
end

----- ---- --- -- -

--[[

function hublistping ()
	local lsocktcp = lsock.tcp () -- prepare the socket

	if not lsocktcp then
		return nil
	end

	lsocktcp:setoption ("reuseaddr", true)

	if not lsocktcp:bind ("*", 0) then
		return nil
	end

	lsocktcp:settimeout (table_sets ["hubpingtimeout"]) -- connect timeout
	local _, rows = VH:SQLQuery ("select `address`, `status` from `" .. tbl_sql ["hubs"] .. "`")
	local updlist = {}

	for x = 0, rows - 1 do
		local _, addr, sts = VH:SQLFetch (x)
		local pos = string.find (addr, ":")
		local nsts = 0

		if lsocktcp:connect (string.sub (addr, 1, pos - 1), (tonumber (string.sub (addr, pos + 1, -1)) or 411), nil, nil) then
			lsocktcp:close ()
			nsts = 1
		end

		if nsts ~= tonumber (sts) then -- changed
			updlist [addr] = nsts
		end
	end

	for k, v in pairs (updlist) do
		VH:SQLQuery ("update `" .. tbl_sql ["hubs"] .. "` set `status` = " .. v .. " where `address` = '" .. repsqlchars (k) .. "' limit 1")
	end
end

]]--

----- ---- --- -- -

function sendoffmsg (from, line, ucls)
	local _, _, to = string.find (line, "^(%S+) .+$")

	if string.lower (to) == string.lower (from) then
		commandanswer (from, getlang (26))
	elseif isbot (to) == true then
		commandanswer (from, getlang (139))
	else
		local _, _, msg = string.find (line, "^%S+ (.+)$")
		local uip = getip (from)
		local tsts = getstatus (to)

		if (isprotected (from, uip) == true) or (antiscan (from, ucls, msg, 3, to, tsts) == 1) then
			if tsts == 1 then
				offlinepm (from, to, msg)
				commandanswer (from, string.format (getlang (27), to))
			else
				local ndate = os.time () + table_sets ["srvtimediff"] -- current time
				VH:SQLQuery ("insert into `"..tbl_sql ["off"].."` (`from`, `ip`, `to`, `date`, `message`) values ('"..repsqlchars (from).."', '"..uip.."', '"..repsqlchars (to).."', "..ndate..", '"..repsqlchars (msg).."')")
				commandanswer (from, string.format (getlang (28), to))
				opsnotify (table_sets ["classnotioff"], string.format (getlang (29), from, uip .. tryipcc (uip, from), ucls))
			end
		end
	end
end

----- ---- --- -- -

function autosendoffmsg (to, ucls, tip)
if table_sets ["offmsgclass"] ~= 11 then
local user = repsqlchars (to)
local _, rows = VH:SQLQuery ("select `from`, `date`, `message` from `"..tbl_sql ["off"].."` where `to` = '"..user.."' order by `date` asc, `from` asc")

if rows > 0 then
for x = 0, rows - 1 do
local _, from, adate, msg = VH:SQLFetch (x)
offlinepm (from, to, string.format (getlang (33), os.date (table_sets ["dateformat"].." "..table_sets ["timeformat"], adate))..":\r\n\r\n"..msg.."\r\n")
local sts = ""

if getstatus (from) == 0 then
sts = getlang (31)
else
sts = getlang (32)
end

offlinepm (from, to, getlang (34)..": "..sts)
end

opsnotify (table_sets ["classnotioff"], string.format (getlang (35), to, tip .. tryipcc (tip, to), ucls))
VH:SQLQuery ("delete from `"..tbl_sql ["off"].."` where `to` = '"..user.."'") -- remove all stored message to that user
end
end
end

----- ---- --- -- -

function listoffline (nick)
local _, rows = VH:SQLQuery ("select `from`, `ip`, `date` from `"..tbl_sql ["off"].."` order by `date` asc, `from` asc")

if rows > 0 then
local anentry = ""

for x = 0, rows - 1 do
local _, from, ip, adate = VH:SQLFetch (x)
anentry = anentry.." "..prezero (string.len (rows), (x + 1))..". [ D: "..os.date (table_sets ["dateformat"].." "..table_sets ["timeformat"], adate).." ] "..from.." @ "..ip.."\r\n"
end

commandanswer (nick, getlang (36)..":\r\n\r\n"..anentry)
else
commandanswer (nick, getlang (37))
end
end

----- ---- --- -- -

function deloffline (nick, adate)
local _, rows = VH:SQLQuery ("select `date` from `"..tbl_sql ["off"].."`")
local t = {}

if rows > 0 then
	for x = 0, rows - 1 do
		local _, zdate = VH:SQLFetch (x)

		if string.find (os.date (table_sets ["dateformat"].." "..table_sets ["timeformat"], zdate), repdatechars (adate)) then
			table.insert (t, zdate)
		end
	end

else
	commandanswer (nick, getlang (37))
	return nil
end

for _, v in pairs (t) do
	-- same goes here, as for hub news, see comments in delnews
	VH:SQLQuery ("delete from `"..tbl_sql ["off"].."` where `date` = "..v.." limit 1")
end

local num = table.getn (t)

if num > 0 then
	commandanswer (nick, string.format (getlang (38), num))
else
	commandanswer (nick, string.format (getlang (39), adate))
end
end

----- ---- --- -- -

function cleanoffline (nick, cls)
local rows = counttable (tbl_sql ["off"])

if rows > 0 then
VH:SQLQuery ("truncate table `"..tbl_sql ["off"].."`")
commandanswer (nick, string.format (getlang (38), rows))
opsnotify (table_sets ["classnotiledoact"], string.format (getlang (40), nick, cls))
else
commandanswer (nick, getlang (41))
end
end

----- ---- --- -- -

function checknick (nick, ucls, aip)
	if table_sets ["michnick"] == 0 then
		return 0
	end

	local _, rows = VH:SQLQuery ("select `nick`, `time` from `" .. tbl_sql ["minick"] .. "` order by `occurred` desc")

	if rows > 0 then
		local lowtxt = tolow (repnmdcinchars (nick))

		for x = 0, rows - 1 do
			local _, entry, btime = VH:SQLFetch (x)
			local fres, fval = pcall (string.find, lowtxt, entry)

			if not fres then
				local ferr = getlang (976) .. ":\r\n\r\n"
				ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (entry) .. "\r\n"
				ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
				ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
				opsnotify (table_sets ["classnotiledoact"], ferr)
			elseif fval then
				VH:SQLQuery ("update `" .. tbl_sql ["minick"] .. "` set `occurred` = `occurred` + 1 where `nick` = '" .. repsqlchars (entry) .. "' limit 1")
				local _, rows = VH:SQLQuery ("select `exception` from `" .. tbl_sql ["miex"] .. "`")

				if rows > 0 then
					for x = 0, rows - 1 do
						local _, entry = VH:SQLFetch (x)
						local fres, fval = pcall (string.find, lowtxt, entry)

						if not fres then
							local ferr = getlang (977) .. ":\r\n\r\n"
							ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (entry) .. "\r\n"
							ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
							ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
							opsnotify (table_sets ["classnotiledoact"], ferr)
						elseif fval then
							VH:SQLQuery ("update `" .. tbl_sql ["miex"] .. "` set `occurred` = `occurred` + 1 where `exception` = '" .. repsqlchars (entry) .. "' limit 1")
							opsnotify (table_sets ["classnotiex"], string.format (getlang (43), nick, aip .. tryipcc (aip, nick), ucls, nick))
							return 0
						end
					end
				end

				local rsn = string.gsub (table_sets ["minickmessage"], "%*", reprexpchars (nick))
				VH:KickUser (table_othsets ["sendfrom"], nick, rsn .. "     #_ban_" .. btime)
				return 1
			end
		end
	end

	return 0
end

----- ---- --- -- -

function checkdesc (nick, desc, ucls, aip)
	if table_sets ["michdesc"] == 0 then return 0 end
	local _, rows = VH:SQLQuery ("select `description`, `time` from `"..tbl_sql ["midesc"].."` order by `occurred` desc")

	if rows > 0 then
		local lowtxt = tolow (repnmdcinchars (desc))

		for x = 0, rows - 1 do
			local _, entry, btime = VH:SQLFetch (x)
			local fres, fval = pcall (string.find, lowtxt, entry)

			if not fres then
				local ferr = getlang (978) .. ":\r\n\r\n"
				ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (entry) .. "\r\n"
				ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
				ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
				opsnotify (table_sets ["classnotiledoact"], ferr)
			elseif fval then
				VH:SQLQuery ("update `"..tbl_sql ["midesc"].."` set `occurred` = `occurred` + 1 where `description` = '"..repsqlchars (entry).."' limit 1")
				local _, rows = VH:SQLQuery ("select `exception` from `"..tbl_sql ["miex"].."`")

				if rows > 0 then
					for x = 0, rows - 1 do
						local _, entry = VH:SQLFetch (x)
						local fres, fval = pcall (string.find, lowtxt, entry)

						if not fres then
							local ferr = getlang (977) .. ":\r\n\r\n"
							ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (entry) .. "\r\n"
							ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
							ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
							opsnotify (table_sets ["classnotiledoact"], ferr)
						elseif fval then
							VH:SQLQuery ("update `"..tbl_sql ["miex"].."` set `occurred` = `occurred` + 1 where `exception` = '"..repsqlchars (entry).."' limit 1")
							opsnotify (table_sets ["classnotiex"], string.format (getlang (45), nick, aip .. tryipcc (aip, nick), ucls, desc))
							return 0
						end
					end
				end

				local rsn = string.gsub (table_sets ["midescmessage"], "%*", reprexpchars (desc))
				VH:KickUser (table_othsets ["sendfrom"], nick, rsn.."     #_ban_"..btime)
				return 1
			end
		end
	end

	return 0
end

----- ---- --- -- -

function checktag (nick, tag, ucls, aip)
	if table_sets ["michtag"] == 0 then return 0 end
	local _, rows = VH:SQLQuery ("select `tag`, `time` from `"..tbl_sql ["mitag"].."` order by `occurred` desc")

	if rows > 0 then
		local lowtxt = tolow (repnmdcinchars (tag))

		for x = 0, rows - 1 do
			local _, entry, btime = VH:SQLFetch (x)
			local fres, fval = pcall (string.find, lowtxt, entry)

			if not fres then
				local ferr = getlang (979) .. ":\r\n\r\n"
				ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (entry) .. "\r\n"
				ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
				ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
				opsnotify (table_sets ["classnotiledoact"], ferr)
			elseif fval then
				VH:SQLQuery ("update `"..tbl_sql ["mitag"].."` set `occurred` = `occurred` + 1 where `tag` = '"..repsqlchars (entry).."' limit 1")
				local _, rows = VH:SQLQuery ("select `exception` from `"..tbl_sql ["miex"].."`")

				if rows > 0 then
					for x = 0, rows - 1 do
						local _, entry = VH:SQLFetch (x)
						local fres, fval = pcall (string.find, lowtxt, entry)

						if not fres then
							local ferr = getlang (977) .. ":\r\n\r\n"
							ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (entry) .. "\r\n"
							ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
							ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
							opsnotify (table_sets ["classnotiledoact"], ferr)
						elseif fval then
							VH:SQLQuery ("update `"..tbl_sql ["miex"].."` set `occurred` = `occurred` + 1 where `exception` = '"..(entry).."' limit 1")
							opsnotify (table_sets ["classnotiex"], string.format (getlang (47), nick, aip .. tryipcc (aip, nick), ucls, tag))
							return 0
						end
					end
				end

				local rsn = string.gsub (table_sets ["mitagmessage"], "%*", reprexpchars (tag))
				VH:KickUser (table_othsets ["sendfrom"], nick, rsn.."     #_ban_"..btime)
				return 1
			end
		end
	end

	return 0
end

----- ---- --- -- -

function checkconn (nick, conn, ucls, aip)
	if table_sets ["michconn"] == 0 then return 0 end
	local _, rows = VH:SQLQuery ("select `connection`, `time` from `"..tbl_sql ["miconn"].."` order by `occurred` desc")

	if rows > 0 then
		local lowtxt = tolow (repnmdcinchars (conn))

		for x = 0, rows - 1 do
			local _, entry, btime = VH:SQLFetch (x)
			local fres, fval = pcall (string.find, lowtxt, entry)

			if not fres then
				local ferr = getlang (980) .. ":\r\n\r\n"
				ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (entry) .. "\r\n"
				ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
				ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
				opsnotify (table_sets ["classnotiledoact"], ferr)
			elseif fval then
				VH:SQLQuery ("update `"..tbl_sql ["miconn"].."` set `occurred` = `occurred` + 1 where `connection` = '"..repsqlchars (entry).."' limit 1")
				local _, rows = VH:SQLQuery ("select `exception` from `"..tbl_sql ["miex"].."`")

				if rows > 0 then
					for x = 0, rows - 1 do
						local _, entry = VH:SQLFetch (x)
						local fres, fval = pcall (string.find, lowtxt, entry)

						if not fres then
							local ferr = getlang (977) .. ":\r\n\r\n"
							ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (entry) .. "\r\n"
							ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
							ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
							opsnotify (table_sets ["classnotiledoact"], ferr)
						elseif fval then
							VH:SQLQuery ("update `"..tbl_sql ["miex"].."` set `occurred` = `occurred` + 1 where `exception` = '"..repsqlchars (entry).."' limit 1")
							opsnotify (table_sets ["classnotiex"], string.format (getlang (49), nick, aip .. tryipcc (aip, nick), ucls, conn))
							return 0
						end
					end
				end

				local rsn = string.gsub (table_sets ["miconnmessage"], "%*", reprexpchars (conn))
				VH:KickUser (table_othsets ["sendfrom"], nick, rsn.."     #_ban_"..btime)
				return 1
			end
		end
	end

	return 0
end

----- ---- --- -- -

function checkemail (nick, email, ucls, aip)
	if table_sets ["michemail"] == 0 then return 0 end
	local _, rows = VH:SQLQuery ("select `email`, `time` from `"..tbl_sql ["miemail"].."` order by `occurred` desc")

	if rows > 0 then
		local lowtxt = tolow (repnmdcinchars (email))

		for x = 0, rows - 1 do
			local _, entry, btime = VH:SQLFetch (x)
			local fres, fval = pcall (string.find, lowtxt, entry)

			if not fres then
				local ferr = getlang (981) .. ":\r\n\r\n"
				ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (entry) .. "\r\n"
				ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
				ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
				opsnotify (table_sets ["classnotiledoact"], ferr)
			elseif fval then
				VH:SQLQuery ("update `"..tbl_sql ["miemail"].."` set `occurred` = `occurred` + 1 where `email` = '"..repsqlchars (entry).."' limit 1")
				local _, rows = VH:SQLQuery ("select `exception` from `"..tbl_sql ["miex"].."`")

				if rows > 0 then
					for x = 0, rows - 1 do
						local _, entry = VH:SQLFetch (x)
						local fres, fval = pcall (string.find, lowtxt, entry)

						if not fres then
							local ferr = getlang (977) .. ":\r\n\r\n"
							ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (entry) .. "\r\n"
							ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
							ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
							opsnotify (table_sets ["classnotiledoact"], ferr)
						elseif fval then
							VH:SQLQuery ("update `"..tbl_sql ["miex"].."` set `occurred` = `occurred` + 1 where `exception` = '"..repsqlchars (entry).."' limit 1")
							opsnotify (table_sets ["classnotiex"], string.format (getlang (51), nick, aip .. tryipcc (aip, nick), ucls, email))
							return 0
						end
					end
				end

				local rsn = string.gsub (table_sets ["miemailmessage"], "%*", reprexpchars (email))
				VH:KickUser (table_othsets ["sendfrom"], nick, rsn.."     #_ban_"..btime)
				return 1
			end
		end
	end

	return 0
end

----- ---- --- -- -

function checkshare (nick, share, ucls, aip)
	if table_sets ["michshare"] == 0 then return 0 end
	local _, rows = VH:SQLQuery ("select `share`, `time` from `"..tbl_sql ["mishare"].."` order by `occurred` desc")

	if rows > 0 then
		local lowtxt = repnmdcinchars (share)

		for x = 0, rows - 1 do
			local _, entry, btime = VH:SQLFetch (x)
			local fres, fval = pcall (string.find, lowtxt, entry)

			if not fres then
				local ferr = getlang (982) .. ":\r\n\r\n"
				ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (entry) .. "\r\n"
				ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
				ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
				opsnotify (table_sets ["classnotiledoact"], ferr)
			elseif fval then
				VH:SQLQuery ("update `"..tbl_sql ["mishare"].."` set `occurred` = `occurred` + 1 where `share` = '"..repsqlchars (entry).."' limit 1")
				local _, rows = VH:SQLQuery ("select `exception` from `"..tbl_sql ["miex"].."`")

				if rows > 0 then
					for x = 0, rows - 1 do
						local _, entry = VH:SQLFetch (x)
						local fres, fval = pcall (string.find, lowtxt, entry)

						if not fres then
							local ferr = getlang (977) .. ":\r\n\r\n"
							ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (entry) .. "\r\n"
							ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
							ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
							opsnotify (table_sets ["classnotiledoact"], ferr)
						elseif fval then
							VH:SQLQuery ("update `"..tbl_sql ["miex"].."` set `occurred` = `occurred` + 1 where `exception` = '"..repsqlchars (entry).."' limit 1")
							opsnotify (table_sets ["classnotiex"], string.format (getlang (53), nick, aip .. tryipcc (aip, nick), ucls, share))
							return 0
						end
					end
				end

				local rsn = string.gsub (table_sets ["misharemessage"], "%*", reprexpchars (share))
				VH:KickUser (table_othsets ["sendfrom"], nick, rsn.."     #_ban_"..btime)
				return 1
			end
		end
	end

	return 0
end

----- ---- --- -- -

function checkip (nick, aip, ucls)
	if table_sets ["michip"] == 0 then return 0 end
	if aip == "[unknown]" then return 0 end
	local _, rows = VH:SQLQuery ("select `ip`, `time` from `"..tbl_sql ["miip"].."` order by `occurred` desc")

	if rows > 0 then
		local lowtxt = repnmdcinchars (aip)

		for x = 0, rows - 1 do
			local _, entry, btime = VH:SQLFetch (x)
			local fres, fval = pcall (string.find, lowtxt, entry)

			if not fres then
				local ferr = getlang (983) .. ":\r\n\r\n"
				ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (entry) .. "\r\n"
				ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
				ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
				opsnotify (table_sets ["classnotiledoact"], ferr)
			elseif fval then
				VH:SQLQuery ("update `"..tbl_sql ["miip"].."` set `occurred` = `occurred` + 1 where `ip` = '"..repsqlchars (entry).."' limit 1")
				local _, rows = VH:SQLQuery ("select `exception` from `"..tbl_sql ["miex"].."`")

				if rows > 0 then
					for x = 0, rows - 1 do
						local _, entry = VH:SQLFetch (x)
						local fres, fval = pcall (string.find, lowtxt, entry)

						if not fres then
							local ferr = getlang (977) .. ":\r\n\r\n"
							ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (entry) .. "\r\n"
							ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
							ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
							opsnotify (table_sets ["classnotiledoact"], ferr)
						elseif fval then
							VH:SQLQuery ("update `"..tbl_sql ["miex"].."` set `occurred` = `occurred` + 1 where `exception` = '"..repsqlchars (entry).."' limit 1")
							opsnotify (table_sets ["classnotiex"], string.format (getlang (354), nick, aip .. tryipcc (aip, nick), ucls, aip))
							return 0
						end
					end
				end

				local rsn = string.gsub (table_sets ["miipmessage"], "%*", reprexpchars (aip))
				VH:KickUser (table_othsets ["sendfrom"], nick, rsn.."     #_ban_"..btime)
				return 1
			end
		end
	end

	return 0
end

----- ---- --- -- -

function checkcc (nick, cls)
	if table_sets ["michcc"] == 0 then return false end
	if table_othsets ["func_getcc"] == false then return false end
	local cc = getcc (nick)
	if not cc then return false end
	local _, rows = VH:SQLQuery ("select `cc`, `time` from `"..tbl_sql ["micc"].."` order by `occurred` desc")

	if rows > 0 then
		local lcc = tolow (repnmdcinchars (cc))

		for x = 0, rows - 1 do
			local _, ent, btime = VH:SQLFetch (x)
			local fres, fval = pcall (string.find, lcc, ent)

			if not fres then
				local ferr = getlang (984) .. ":\r\n\r\n"
				ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (ent) .. "\r\n"
				ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
				ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
				opsnotify (table_sets ["classnotiledoact"], ferr)
			elseif fval then
				VH:SQLQuery ("update `"..tbl_sql ["micc"].."` set `occurred` = `occurred` + 1 where `cc` = '"..repsqlchars (ent).."' limit 1")
				local _, rows = VH:SQLQuery ("select `exception` from `"..tbl_sql ["miex"].."`")

				if rows > 0 then
					for x = 0, rows - 1 do
						local _, ent = VH:SQLFetch (x)
						local fres, fval = pcall (string.find, lcc, ent)

						if not fres then
							local ferr = getlang (977) .. ":\r\n\r\n"
							ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (ent) .. "\r\n"
							ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
							ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
							opsnotify (table_sets ["classnotiledoact"], ferr)
						elseif fval then
							VH:SQLQuery ("update `"..tbl_sql ["miex"].."` set `occurred` = `occurred` + 1 where `exception` = '"..repsqlchars (ent).."' limit 1")
							opsnotify (table_sets ["classnotiex"], string.format (getlang (796), nick, ip .. tryipcc (ip, nick), cls, cc))
							return false
						end
					end
				end

				local rsn = string.gsub (table_sets ["miccmessage"], "%*", reprexpchars (cc))
				VH:KickUser (table_othsets ["sendfrom"], nick, rsn.."     #_ban_"..btime)
				return true
			end
		end
	end

	return false
end

----- ---- --- -- -

function checkdns (nick, cls, ip)
	if table_sets ["michdns"] == 0 then return false end
	if getconfig ("dns_lookup") == 0 then return false end
	local dns = gethost (nick)
	if dns == "[unknown]" then return false end
	local _, rows = VH:SQLQuery ("select `dns`, `time` from `"..tbl_sql ["midns"].."` order by `occurred` desc")

	if rows > 0 then
		local ldns = tolow (repnmdcinchars (dns))

		for x = 0, rows - 1 do
			local _, ent, btime = VH:SQLFetch (x)
			local fres, fval = pcall (string.find, ldns, ent)

			if not fres then
				local ferr = getlang (985) .. ":\r\n\r\n"
				ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (ent) .. "\r\n"
				ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
				ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
				opsnotify (table_sets ["classnotiledoact"], ferr)
			elseif fval then
				VH:SQLQuery ("update `"..tbl_sql ["midns"].."` set `occurred` = `occurred` + 1 where `dns` = '"..repsqlchars (ent).."' limit 1")
				local _, rows = VH:SQLQuery ("select `exception` from `"..tbl_sql ["miex"].."`")

				if rows > 0 then
					for x = 0, rows - 1 do
						local _, ent = VH:SQLFetch (x)
						local fres, fval = pcall (string.find, ldns, ent)

						if not fres then
							local ferr = getlang (977) .. ":\r\n\r\n"
							ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (ent) .. "\r\n"
							ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
							ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
							opsnotify (table_sets ["classnotiledoact"], ferr)
						elseif fval then
							VH:SQLQuery ("update `"..tbl_sql ["miex"].."` set `occurred` = `occurred` + 1 where `exception` = '"..repsqlchars (ent).."' limit 1")
							opsnotify (table_sets ["classnotiex"], string.format (getlang (757), nick, ip .. tryipcc (ip, nick), cls, dns))
							return false
						end
					end
				end

				local rsn = string.gsub (table_sets ["midnsmessage"], "%*", reprexpchars (dns))
				VH:KickUser (table_othsets ["sendfrom"], nick, rsn.."     #_ban_"..btime)
				return true
			end
		end
	end

	return false
end

----- ---- --- -- -

function checksup (nick, cls, ip)
	if table_sets ["michsup"] == 0 then return false end
	if table_othsets ["func_getusersupports"] == false then return false end
	local on, sup = VH:GetUserSupports (nick)
	if (not on) or (not sup) or (sup == "") then return false end
	local _, rows = VH:SQLQuery ("select `supports`, `time` from `" .. tbl_sql ["misup"] .. "` order by `occurred` desc")

	if rows > 0 then
		local lsup = tolow (repnmdcinchars (sup))

		for x = 0, rows - 1 do
			local _, ent, btime = VH:SQLFetch (x)
			local fres, fval = pcall (string.find, lsup, ent)

			if not fres then
				local ferr = getlang (986) .. ":\r\n\r\n"
				ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (ent) .. "\r\n"
				ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
				ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
				opsnotify (table_sets ["classnotiledoact"], ferr)
			elseif fval then
				VH:SQLQuery ("update `" .. tbl_sql ["misup"] .. "` set `occurred` = `occurred` + 1 where `supports` = '" .. repsqlchars (ent) .. "' limit 1")
				local _, rows = VH:SQLQuery ("select `exception` from `" .. tbl_sql ["miex"] .. "`")

				if rows > 0 then
					for x = 0, rows - 1 do
						local _, ent = VH:SQLFetch (x)
						local fres, fval = pcall (string.find, lsup, ent)

						if not fres then
							local ferr = getlang (977) .. ":\r\n\r\n"
							ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (ent) .. "\r\n"
							ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
							ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
							opsnotify (table_sets ["classnotiledoact"], ferr)
						elseif fval then
							VH:SQLQuery ("update `" .. tbl_sql ["miex"] .. "` set `occurred` = `occurred` + 1 where `exception` = '" .. repsqlchars (ent) .. "' limit 1")
							opsnotify (table_sets ["classnotiex"], string.format (getlang (908), nick, ip .. tryipcc (ip, nick), cls, sup))
							return false
						end
					end
				end

				local rsn = string.gsub (table_sets ["misupmessage"], "%*", reprexpchars (sup))
				VH:KickUser (table_othsets ["sendfrom"], nick, rsn .. "     #_ban_" .. btime)
				return true
			end
		end
	end

	return false
end

----- ---- --- -- -

function checkver (nick, cls, ip)
	if table_sets ["michver"] == 0 then return false end
	if table_othsets ["func_getuserversion"] == false then return false end
	local on, ver = VH:GetUserVersion (nick)
	if (not on) or (not ver) or (ver == "") then return false end
	local _, rows = VH:SQLQuery ("select `version`, `time` from `" .. tbl_sql ["miver"] .. "` order by `occurred` desc")

	if rows > 0 then
		local lver = tolow (repnmdcinchars (ver))

		for x = 0, rows - 1 do
			local _, ent, btime = VH:SQLFetch (x)
			local fres, fval = pcall (string.find, lver, ent)

			if not fres then
				local ferr = getlang (987) .. ":\r\n\r\n"
				ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (ent) .. "\r\n"
				ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
				ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
				opsnotify (table_sets ["classnotiledoact"], ferr)
			elseif fval then
				VH:SQLQuery ("update `" .. tbl_sql ["miver"] .. "` set `occurred` = `occurred` + 1 where `version` = '" .. repsqlchars (ent) .. "' limit 1")
				local _, rows = VH:SQLQuery ("select `exception` from `" .. tbl_sql ["miex"] .. "`")

				if rows > 0 then
					for x = 0, rows - 1 do
						local _, ent = VH:SQLFetch (x)
						local fres, fval = pcall (string.find, lver, ent)

						if not fres then
							local ferr = getlang (977) .. ":\r\n\r\n"
							ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (ent) .. "\r\n"
							ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
							ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
							opsnotify (table_sets ["classnotiledoact"], ferr)
						elseif fval then
							VH:SQLQuery ("update `" .. tbl_sql ["miex"] .. "` set `occurred` = `occurred` + 1 where `exception` = '" .. repsqlchars (ent) .. "' limit 1")
							opsnotify (table_sets ["classnotiex"], string.format (getlang (909), nick, ip .. tryipcc (ip, nick), cls, ver))
							return false
						end
					end
				end

				local rsn = string.gsub (table_sets ["mivermessage"], "%*", reprexpchars (ver))
				VH:KickUser (table_othsets ["sendfrom"], nick, rsn .. "     #_ban_" .. btime)
				return true
			end
		end
	end

	return false
end

----- ---- --- -- -

function checkfake (nick, share, ucls, aip)
	if share < 1048576 then return 0 end -- skip < 1 gb
	local isfake = false

	if table_sets ["michfakenum"] > 0 then -- same numbers
		for x = 0, 9 do
			if string.find (share, string.rep (tostring (x), table_sets ["michfakenum"])) then
				isfake = true
				break
			end
		end
	end

	if (isfake == false) and (table_sets ["michfakediv"] == 1) then -- divide by 1 gb, tb, pb, dont check twice
		if (not string.find (tostring (share / 1048576), "%.")) or (not string.find (tostring (share / 1073741824), "%.")) or (not string.find (tostring (share / 1099511627776), "%.")) then
			isfake = true
		end
	end

	if isfake == true then -- is fake, check for exception
		local _, rows = VH:SQLQuery ("select `exception` from `"..tbl_sql ["miex"].."`")

		if rows > 0 then
			local sh = repnmdcinchars (tostring (share))

			for x = 0, rows - 1 do
				local _, entry = VH:SQLFetch (x)

				if string.find (sh, entry) then
					VH:SQLQuery ("update `"..tbl_sql ["miex"].."` set `occurred` = `occurred` + 1 where `exception` = '"..repsqlchars (entry).."' limit 1")
					opsnotify (table_sets ["classnotiex"], string.format (getlang (449), nick, aip .. tryipcc (aip, nick), ucls, share.." "..getlang (365)))
					return 0
				end
			end
		end

		local rsn = string.gsub (table_sets ["mifakemessage"], "%*", reprexpchars (share.." "..getlang (365)))
		VH:KickUser (table_othsets ["sendfrom"], nick, rsn.."     #_ban_"..table_sets ["mitbantime"])
		return 1
	end

	return 0
end

----- ---- --- -- -

function checkclone (nick, share, aip, ucls)
	if (table_sets ["michclone"] == 0) or (share == 0) or (aip == "[unknown]") then return 0 end -- skip

	for user in string.gmatch (getnicklist (), "([^$]+)%$%$") do
		if (user ~= nick) and (getclass (user) < table_sets ["scanbelowclass"]) then -- skip user himself and if second user is protected
			if (parsemyinfoshare (getmyinfo (user)) == share) and (getip (user) == aip) then -- exact share and ip match
				local _, rows = VH:SQLQuery ("select `exception` from `"..tbl_sql ["miex"].."`")

				if rows > 0 then
					for x = 0, rows - 1 do
						local _, entry = VH:SQLFetch (x)

						if string.find (repnmdcinchars (share), entry) or string.find (repnmdcinchars (aip), entry) then
							VH:SQLQuery ("update `"..tbl_sql ["miex"].."` set `occurred` = `occurred` + 1 where `exception` = '"..repsqlchars (entry).."' limit 1")
							opsnotify (table_sets ["classnotiex"], string.format (getlang (450), nick, aip .. tryipcc (aip, nick), ucls, user))
							return 0
						end
					end
				end

				local rsn = string.gsub (table_sets ["miclonemessage"], "%*", reprexpchars (user))

				if table_sets ["michclone"] == 1 then
					maintouser (nick, rsn)
					opsnotify (table_sets ["classnotimich"], string.format (getlang (824), aip .. tryipcc (aip, nick), ucls, nick, user))
					VH:CloseConnection (nick)
				elseif table_sets ["michclone"] == 2 then
					if table_sets ["miclonekicktime"] ~= "" then
						rsn = rsn .. "     #_ban_" .. table_sets ["miclonekicktime"]
					end

					VH:KickUser (table_othsets ["sendfrom"], nick, rsn)
				end

				return 1
			end
		end
	end

	return 0
end

----- ---- --- -- -

function checksameip (nick, ip, ucls)
	if (table_sets ["michsameip"] == 0) or (ip == "[unknown]") then return 0 end -- skip

	for user in string.gmatch (getnicklist (), "([^$]+)%$%$") do
		if (user ~= nick) and (getclass (user) < table_sets ["scanbelowclass"]) then -- skip user himself and if second user is protected
			if getip (user) == ip then -- exact ip match
				local _, rows = VH:SQLQuery ("select `exception` from `"..tbl_sql ["miex"].."`")

				if rows > 0 then
					for x = 0, rows - 1 do
						local _, entry = VH:SQLFetch (x)

						if string.find (repnmdcinchars (ip), entry) then
							VH:SQLQuery ("update `"..tbl_sql ["miex"].."` set `occurred` = `occurred` + 1 where `exception` = '"..repsqlchars (entry).."' limit 1")
							opsnotify (table_sets ["classnotiex"], string.format (getlang (451), nick, ip .. tryipcc (ip, nick), ucls, user))
							return 0
						end
					end
				end

				local rsn = string.gsub (table_sets ["misameipmessage"], "%*", reprexpchars (user))
				VH:KickUser (table_othsets ["sendfrom"], nick, rsn.."     #_ban_"..table_sets ["mitbantime"])
				return 1
			end
		end
	end

	return 0
end

----- ---- --- -- -

function gagipadd (nick, line)
	local _, _, ip, flag = string.find (line, "^(%S+) (%d)$")
	flag = tonumber (flag)

	if nick then
		if (flag < 0) or (flag > 2) then
			commandanswer (nick, string.format (getlang (228), "0=ALL, 1=MC " .. getlang (70) .. " 2=PM"))
		else
			local rip = repsqlchars (repnmdcinchars (ip))
			local _, rows = VH:SQLQuery ("select `flag` from `" .. tbl_sql ["ipgag"] .. "` where `ip` = '" .. rip .. "' limit 1")

			if rows > 0 then -- modify
				VH:SQLQuery ("update `" .. tbl_sql ["ipgag"] .. "` set `flag` = " .. tostring (flag) .. " where `ip` = '" .. rip .. "' limit 1")
				commandanswer (nick, string.format (getlang (643), ip))
			else -- add
				VH:SQLQuery ("insert into `" .. tbl_sql ["ipgag"] .. "` (`ip`, `flag`) values ('" .. rip .. "', " .. tostring (flag) .. ")")
				commandanswer (nick, string.format (getlang (642), ip))
			end

			if table_igag [ip] then
				table_igag [ip] = nil
			end
		end
	else
		if table_igag [ip] then -- flood or spam detected both in mc and pm
			flag = 0
		elseif flag > 2 then -- 3 = offline message, 4 = report command
			flag = 2
		end

		table_igag [ip] = flag
	end
end

----- ---- --- -- -

function gagipdel (nick, ip)
	if ip == "*" then
		table_igag = {}
		commandanswer (nick, getlang (650))
	else
		local ok = false

		if table_igag [ip] then
			table_igag [ip] = nil
			ok = true
		end

		local rip = repsqlchars (repnmdcinchars (ip))
		local _, rows = VH:SQLQuery ("select `flag` from `" .. tbl_sql ["ipgag"] .. "` where `ip` = '" .. rip .. "' limit 1")

		if rows > 0 then
			VH:SQLQuery ("delete from `" .. tbl_sql ["ipgag"] .. "` where `ip` = '" .. rip .. "' limit 1")
			ok = true
		end

		if ok == true then
			commandanswer (nick, string.format (getlang (644), ip))
		else -- not in list
			commandanswer (nick, string.format (getlang (645), ip))
		end
	end
end

----- ---- --- -- -

function gagiplist (nick)
	local function flagname (flag)
		if flag == 0 then
			return "=ALL"
		elseif flag == 1 then
			return "=MC"
		elseif flag == 2 then
			return "=PM"
		end
	end

	local list, count = "", 0
	local _, rows = VH:SQLQuery ("select `ip`, `flag` from `" .. tbl_sql ["ipgag"] .. "`")

	if rows > 0 then -- permanent list
		for x = 0, rows - 1 do
			local _, ip, flag = VH:SQLFetch (x)
			count = x + 1
			list = list .. " " .. tostring (count) .. ". " .. repnmdcoutchars (ip) .. " [ F: " .. flag .. flagname (tonumber (flag)) .. " ] [ T: P ]\r\n"
		end
	end

	for key, value in pairs (table_igag) do -- temporary list
		count = count + 1
		list = list .. " " .. tostring (count) .. ". " .. repnmdcoutchars (key) .. " [ F: " .. tostring (value) .. flagname (value) .. " ] [ T: T ]\r\n"
	end

	if list == "" then
		commandanswer (nick, getlang (647))
	else
		commandanswer (nick, getlang (646) .. ":\r\n\r\n" .. list)
	end
end

----- ---- --- -- -

function gagipcheck (nick, ip, class, to, data)
	if class >= table_sets ["scanbelowclass"] then
		return false
	end

	local t = {}

	for key, value in pairs (table_igag) do -- temporary list
		t [key] = value
	end

	local _, rows = VH:SQLQuery ("select `ip`, `flag` from `" .. tbl_sql ["ipgag"] .. "`")

	if rows > 0 then -- permanent list
		for x = 0, rows - 1 do
			local _, ip, flag = VH:SQLFetch (x)
			t [ip] = tonumber (flag)
		end
	end

	for key, value in pairs (t) do
		if string.find (ip, key) then
			if to and ((value == 0) or (value == 2)) then -- pm
				pmtouser (nick, to, getlang (658))
				opsnotify (table_sets ["classnotigagip"], string.format (getlang (777), nick, ip .. tryipcc (ip, nick), class, data))
				return true
			elseif (not to) and ((value == 0) or (value == 1)) then -- mc
				maintouser (nick, getlang (649))
				opsnotify (table_sets ["classnotigagip"], string.format (getlang (776), nick, ip .. tryipcc (ip, nick), class, data))
				return true
			end

			break
		end
	end

	return false
end

----- ---- --- -- -

function gagccadd (nick, line)
	local _, _, cc, flg = string.find (line, "^([%a%-][%a%d%-]) (%d)$")
	cc = string.upper (cc)
	flg = tonumber (flg)

	if (flg > 2) and nick then
		commandanswer (nick, string.format (getlang (228), "0, 1 "..getlang (70).." 2"))
	else
		if nick then
			if table_cgag [cc] then
				commandanswer (nick, string.format (getlang (879), cc))
			else
				commandanswer (nick, string.format (getlang (878), cc))
			end
		elseif table_cgag [cc] then
			flg = 0
		end

		table_cgag [cc] = flg
	end
end

----- ---- --- -- -

function gagccdel (nick, cc)
	if cc == "*" then
		table_cgag = {}
		commandanswer (nick, getlang (885))
	else
		cc = string.upper (cc)

		if table_cgag [cc] then
			table_cgag [cc] = nil
			commandanswer (nick, string.format (getlang (880), cc))
		else
			commandanswer (nick, string.format (getlang (881), cc)) -- not in list
		end
	end
end

----- ---- --- -- -

function gagcclist (nick)
	local list, c = "", 0

	for k, v in pairs (table_cgag) do
		c = c + 1
		list = list.." "..c..". "..k.." [ F: "..v.." ]\r\n"
	end

	if list == "" then
		commandanswer (nick, getlang (883))
	else
		commandanswer (nick, getlang (882)..":\r\n\r\n"..list)
	end
end

----- ---- --- -- -

function gagccheck (nick, ip, class, to, msg)
	if class >= table_sets ["scanbelowclass"] then return false end
	local cc = getcc (nick)
	if not cc then return false end
	cc = string.upper (cc)

	for k, v in pairs (table_cgag) do
		if cc == k then
			if to and ((v == 0) or (v == 2)) then -- pm
				pmtouser (nick, to, getlang (658))
				opsnotify (table_sets ["classnotigagip"], string.format (getlang (887), nick, ip .. tryipcc (ip, nick), class, msg))
				return true
			elseif (not to) and ((v == 0) or (v == 1)) then -- mc
				maintouser (nick, getlang (649))
				opsnotify (table_sets ["classnotigagip"], string.format (getlang (886), nick, ip .. tryipcc (ip, nick), class, msg))
				return true
			end

			break
		end
	end

	return false
end

----- ---- --- -- -

function detprotoflood (pref, prot, nick, ip, class)
	if table_sets ["protoflood" .. pref .. "cnt"] == 0 then -- disabled
		return false
	end

	if class >= table_sets ["scanbelowclass"] then -- minimum class
		return false
	end

	if prot and isprotected (nick, ip) then -- protection
		return false
	end

	local tm = os.time ()

	if table_prfl [pref][nick] then
		local dif = os.difftime (tm, table_prfl [pref][nick]["lst"])

		if table_prfl [pref][nick]["cnt"] >= table_sets ["protoflood" .. pref .. "cnt"] and dif <= table_sets ["protoflood" .. pref .. "int"] then -- match
			local sts = genprflsts (pref)

			if pref == "ctm" then -- for now use only on ctm detection, in future add to all detections
				if table_sets ["protoflood" .. pref .. "act"] == 0 then -- drop
					maintouser (nick, string.format (getlang (821), sts))
					opsnotify (table_sets ["classnotiprotoflood"], string.format (getlang (820), nick, ip .. tryipcc (ip, nick), class, sts))
					VH:CloseConnection (nick)
				elseif table_sets ["protoflood" .. pref .. "act"] == 1 then -- kick
					VH:KickUser (table_othsets ["sendfrom"], nick, string.format (getlang (821), sts))
				elseif table_sets ["protoflood" .. pref .. "act"] == 2 then -- temporary ban
					VH:KickUser (table_othsets ["sendfrom"], nick, string.format (getlang (821), sts) .. "     #_ban_" .. table_sets ["thirdacttime"])
				elseif table_sets ["protoflood" .. pref .. "act"] == 3 then -- permanent ban
					VH:KickUser (table_othsets ["sendfrom"], nick, string.format (getlang (821), sts) .. "     #_ban_" .. table_sets ["seventhacttime"])
				end
			else
				maintouser (nick, string.format (getlang (821), sts))
				opsnotify (table_sets ["classnotiprotoflood"], string.format (getlang (820), nick, ip .. tryipcc (ip, nick), class, sts))
				VH:CloseConnection (nick) -- drop
			end

			return true
		elseif dif > table_sets ["protoflood" .. pref .. "int"] then -- start over
			table_prfl [pref][nick]["cnt"] = 1
			table_prfl [pref][nick]["lst"] = tm
		else -- update count
			table_prfl [pref][nick]["cnt"] = table_prfl [pref][nick]["cnt"] + 1
		end
	else -- not in list
		table_prfl [pref][nick] = {
			["cnt"] = 1,
			["lst"] = tm
		}
	end

	return false
end

----- ---- --- -- -

function genprflsts (pref)
	local sts = "[BUG]"

	if pref == "ctm" then
		sts = "ConnectToMe"
	end

	return "&#36;"..sts
end

----- ---- --- -- -

function detchatflood (nick, class, ip, msg, to)
if table_sets ["chatantiflood"] == 0 then return false end
if class >= table_sets ["scanbelowclass"] then return false end
local tm = os.time ()

if table_flod [ip] then
	local dif = os.difftime (tm, table_flod [ip]["lst"])

	if (table_flod [ip]["cnt"] >= table_sets ["chatfloodcount"]) and (dif <= table_sets ["chatfloodint"]) then -- match
		if to then -- pm
			if table_flod [ip]["fst"] == true then -- notify only first time
				opsnotify (table_sets ["classnotiflood"], string.format (getlang (657), ip, nick .. tryipcc (ip, nick), class, msg))
			end

			pmtouser (nick, to, getlang (659))
		else -- mc
			if table_flod [ip]["fst"] == true then -- notify only first time
				opsnotify (table_sets ["classnotiflood"], string.format (getlang (656), ip, nick .. tryipcc (ip, nick), class, msg))
			end

			maintouser (nick, getlang (659))
		end

		if table_sets ["chatfloodaction"] == 1 then -- gag ip
			if to then
				gagipadd (nil, ip .. " 2")
			else
				gagipadd (nil, ip .. " 1")
			end

			if table_flod [ip]["fst"] == true then -- notify only first time
				opsnotify (table_sets ["classnotiflood"], string.format (getlang (655), ip .. tryipcc (ip, nick), table.getn (getusersbyip (ip))))
			end

		elseif table_sets ["chatfloodaction"] == 2 then -- drop
			local res = dropallbyip (ip)

			if table_flod [ip]["fst"] == true then -- notify only first time
				opsnotify (table_sets ["classnotiflood"], string.format (getlang (660), res, ip .. tryipcc (ip, nick)))
			end

		elseif table_sets ["chatfloodaction"] == 3 then -- kick
			kickallbyip (ip, getlang (659))

		elseif table_sets ["chatfloodaction"] == 4 then -- temporary ban
			kickallbyip (ip, getlang (659).."     #_ban_"..table_sets ["thirdacttime"])

		elseif table_sets ["chatfloodaction"] == 5 then -- permanent ban
			kickallbyip (ip, getlang (659).."     #_ban_"..table_sets ["seventhacttime"])
		end

		table_flod [ip]["fst"] = false
		return true
	elseif dif > table_sets ["chatfloodint"] then -- start over: create new variable instead of chatfloodint
		table_flod [ip]["cnt"] = 1
		table_flod [ip]["lst"] = tm
		table_flod [ip]["fst"] = true
	else -- update count
		table_flod [ip]["cnt"] = table_flod [ip]["cnt"] + 1
	end

else -- not in list
	table_flod [ip] = {["cnt"] = 1, ["lst"] = tm, ["fst"] = true}
end

return false
end

----- ---- --- -- -

function parsemyinfoshare (myinfo)
local _, _, share = string.find (myinfo, "^%$MyINFO %$ALL .+ .*%$.*%$.*%$.*%$(.*)%$$")
if share and tonumber (share) then share = tonumber (share) else share = 0 end

return share
end

----- ---- --- -- -

function parsemyinfo (nick, myinfo)
local _, _, desc, conn, email, share = string.find (myinfo, "^%$MyINFO %$ALL "..reppatchars (nick).." (.*)%$.*%$(.*)%$(.*)%$(.*)%$$")
local tag = ""
conn = conn or ""
local sts = string.sub (conn, string.len (conn))
sts = string.byte (sts or string.char (1)) or 1
conn = string.sub (conn, 1, string.len (conn) - 1)
desc = desc or ""
local len = string.len (desc)

for x = len, 1, -1 do
	if (string.sub (desc, x, x) == "<") and (string.sub (desc, len, -1) == ">") then
		tag = string.sub (desc, x, -1)
		desc = string.sub (desc, 1, x - 1)
		break
	end
end

tag = tag or ""
email = email or ""
if share and tonumber (share) then share = tonumber (share) else share = 0 end

return desc, tag, conn, sts, email, share
end

----- ---- --- -- -

function addmyinfoentry (nick, line)
	local part, item, btime = "", "", table_sets ["mitbantime"]

	if string.find (line, "^(%S+) (.+) (%d+[%u%l])$") then
		_, _, part, item, btime = string.find (line, "^(%S+) (.+) (%d+[%u%l])$")
	else
		_, _, part, item = string.find (line, "^(%S+) (.+)$")
	end

	local entry = repsqlchars (repnmdcinchars (item))

	if part == "nick" then
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["minick"].."` where `nick` = '"..entry.."' limit 1")

		if rows > 0 then
			commandanswer (nick, string.format (getlang (56), item))
		else
			VH:SQLQuery ("insert into `"..tbl_sql ["minick"].."` (`nick`, `time`) values ('"..entry.."', '"..repsqlchars (btime).."')")
			commandanswer (nick, string.format (getlang (57), item))
		end

	elseif part == "desc" then
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["midesc"].."` where `description` = '"..entry.."' limit 1")

		if rows > 0 then
			commandanswer (nick, string.format (getlang (58), item))
		else
			VH:SQLQuery ("insert into `"..tbl_sql ["midesc"].."` (`description`, `time`) values ('"..entry.."', '"..repsqlchars (btime).."')")
			commandanswer (nick, string.format (getlang (59), item))
		end

	elseif part == "tag" then
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["mitag"].."` where `tag` = '"..entry.."' limit 1")

		if rows > 0 then
			commandanswer (nick, string.format (getlang (60), item))
		else
			VH:SQLQuery ("insert into `"..tbl_sql ["mitag"].."` (`tag`, `time`) values ('"..entry.."', '"..repsqlchars (btime).."')")
			commandanswer (nick, string.format (getlang (61), item))
		end

	elseif part == "conn" then
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["miconn"].."` where `connection` = '"..entry.."' limit 1")

		if rows > 0 then
			commandanswer (nick, string.format (getlang (62), item))
		else
			VH:SQLQuery ("insert into `"..tbl_sql ["miconn"].."` (`connection`, `time`) values ('"..entry.."', '"..repsqlchars (btime).."')")
			commandanswer (nick, string.format (getlang (63), item))
		end

	elseif part == "email" then
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["miemail"].."` where `email` = '"..entry.."' limit 1")

		if rows > 0 then
			commandanswer (nick, string.format (getlang (64), item))
		else
			VH:SQLQuery ("insert into `"..tbl_sql ["miemail"].."` (`email`, `time`) values ('"..entry.."', '"..repsqlchars (btime).."')")
			commandanswer (nick, string.format (getlang (65), item))
		end

	elseif part == "share" then
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["mishare"].."` where `share` = '"..entry.."' limit 1")

		if rows > 0 then
			commandanswer (nick, string.format (getlang (66), item))
		else
			VH:SQLQuery ("insert into `"..tbl_sql ["mishare"].."` (`share`, `time`) values ('"..entry.."', '"..repsqlchars (btime).."')")
			commandanswer (nick, string.format (getlang (67), item))
		end

	elseif part == "ip" then
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["miip"].."` where `ip` = '"..entry.."' limit 1")

		if rows > 0 then
			commandanswer (nick, string.format (getlang (348), item))
		else
			VH:SQLQuery ("insert into `"..tbl_sql ["miip"].."` (`ip`, `time`) values ('"..entry.."', '"..repsqlchars (btime).."')")
			commandanswer (nick, string.format (getlang (349), item))
		end

	elseif part == "cc" then
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["micc"].."` where `cc` = '"..entry.."' limit 1")

		if rows > 0 then
			commandanswer (nick, string.format (getlang (790), item))
		else
			VH:SQLQuery ("insert into `"..tbl_sql ["micc"].."` (`cc`, `time`) values ('"..entry.."', '"..repsqlchars (btime).."')")
			commandanswer (nick, string.format (getlang (791), item))
		end

	elseif part == "dns" then
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["midns"].."` where `dns` = '"..entry.."' limit 1")

		if rows > 0 then
			commandanswer (nick, string.format (getlang (759), item))
		else
			VH:SQLQuery ("insert into `"..tbl_sql ["midns"].."` (`dns`, `time`) values ('"..entry.."', '"..repsqlchars (btime).."')")
			commandanswer (nick, string.format (getlang (760), item))
		end

	elseif part == "sup" then
		local _, rows = VH:SQLQuery ("select `occurred` from `" .. tbl_sql ["misup"] .. "` where `supports` = '" .. entry .. "' limit 1")

		if rows > 0 then
			commandanswer (nick, string.format (getlang (895), item))
		else
			VH:SQLQuery ("insert into `" .. tbl_sql ["misup"] .. "` (`supports`, `time`) values ('" .. entry .. "', '" .. repsqlchars (btime) .. "')")
			commandanswer (nick, string.format (getlang (896), item))
		end

	elseif part == "ver" then
		local _, rows = VH:SQLQuery ("select `occurred` from `" .. tbl_sql ["miver"] .. "` where `version` = '" .. entry .. "' limit 1")

		if rows > 0 then
			commandanswer (nick, string.format (getlang (897), item))
		else
			VH:SQLQuery ("insert into `" .. tbl_sql ["miver"] .. "` (`version`, `time`) values ('" .. entry .. "', '" .. repsqlchars (btime) .. "')")
			commandanswer (nick, string.format (getlang (898), item))
		end

	elseif part == "ex" then
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["miex"].."` where `exception` = '"..entry.."' limit 1")

		if rows > 0 then
			commandanswer (nick, string.format (getlang (68), item))
		else
			VH:SQLQuery ("insert into `"..tbl_sql ["miex"].."` (`exception`) values ('"..entry.."')")
			commandanswer (nick, string.format (getlang (69), item))
		end

	else -- unknown
		commandanswer (nick, string.format (getlang (100), "nick, desc, tag, conn, email, share, ip, cc, dns, sup, ver " .. getlang (70) .. " ex"))
	end
end

----- ---- --- -- -

function delmyinfoentry (nick, line)
	local _, _, part, item = string.find (line, "^(%S+) (.+)$")
	local entry = repsqlchars (repnmdcinchars (item))

	if part == "nick" then
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["minick"].."` where `nick` = '"..entry.."' limit 1")

		if rows > 0 then
			VH:SQLQuery ("delete from `"..tbl_sql ["minick"].."` where `nick` = '"..entry.."' limit 1")
			commandanswer (nick, string.format (getlang (71), item))
		else
			commandanswer (nick, string.format (getlang (72), item))
		end

	elseif part == "desc" then
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["midesc"].."` where `description` = '"..entry.."' limit 1")

		if rows > 0 then
			VH:SQLQuery ("delete from `"..tbl_sql ["midesc"].."` where `description` = '"..entry.."' limit 1")
			commandanswer (nick, string.format (getlang (73), item))
		else
			commandanswer (nick, string.format (getlang (74), item))
		end

	elseif part == "tag" then
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["mitag"].."` where `tag` = '"..entry.."' limit 1")

		if rows > 0 then
			VH:SQLQuery ("delete from `"..tbl_sql ["mitag"].."` where `tag` = '"..entry.."' limit 1")
			commandanswer (nick, string.format (getlang (75), item))
		else
			commandanswer (nick, string.format (getlang (76), item))
		end

	elseif part == "conn" then
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["miconn"].."` where `connection` = '"..entry.."' limit 1")

		if rows > 0 then
			VH:SQLQuery ("delete from `"..tbl_sql ["miconn"].."` where `connection` = '"..entry.."' limit 1")
			commandanswer (nick, string.format (getlang (77), item))
		else
			commandanswer (nick, string.format (getlang (78), item))
		end

	elseif part == "email" then
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["miemail"].."` where `email` = '"..entry.."' limit 1")

		if rows > 0 then
			VH:SQLQuery ("delete from `"..tbl_sql ["miemail"].."` where `email` = '"..entry.."' limit 1")
			commandanswer (nick, string.format (getlang (79), item))
		else
			commandanswer (nick, string.format (getlang (80), item))
		end

	elseif part == "share" then
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["mishare"].."` where `share` = '"..entry.."' limit 1")

		if rows > 0 then
			VH:SQLQuery ("delete from `"..tbl_sql ["mishare"].."` where `share` = '"..entry.."' limit 1")
			commandanswer (nick, string.format (getlang (81), item))
		else
			commandanswer (nick, string.format (getlang (82), item))
		end

	elseif part == "ip" then
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["miip"].."` where `ip` = '"..entry.."' limit 1")

		if rows > 0 then
			VH:SQLQuery ("delete from `"..tbl_sql ["miip"].."` where `ip` = '"..entry.."' limit 1")
			commandanswer (nick, string.format (getlang (350), item))
		else
			commandanswer (nick, string.format (getlang (351), item))
		end

	elseif part == "cc" then
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["micc"].."` where `cc` = '"..entry.."' limit 1")

		if rows > 0 then
			VH:SQLQuery ("delete from `"..tbl_sql ["micc"].."` where `cc` = '"..entry.."' limit 1")
			commandanswer (nick, string.format (getlang (792), item))
		else
			commandanswer (nick, string.format (getlang (793), item))
		end

	elseif part == "dns" then
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["midns"].."` where `dns` = '"..entry.."' limit 1")

		if rows > 0 then
			VH:SQLQuery ("delete from `"..tbl_sql ["midns"].."` where `dns` = '"..entry.."' limit 1")
			commandanswer (nick, string.format (getlang (761), item))
		else
			commandanswer (nick, string.format (getlang (762), item))
		end

	elseif part == "sup" then
		local _, rows = VH:SQLQuery ("select `occurred` from `" .. tbl_sql ["misup"] .. "` where `supports` = '" .. entry .. "' limit 1")

		if rows > 0 then
			VH:SQLQuery ("delete from `" .. tbl_sql ["misup"] .. "` where `supports` = '" .. entry .. "' limit 1")
			commandanswer (nick, string.format (getlang (900), item))
		else
			commandanswer (nick, string.format (getlang (901), item))
		end

	elseif part == "ver" then
		local _, rows = VH:SQLQuery ("select `occurred` from `" .. tbl_sql ["miver"] .. "` where `version` = '" .. entry .. "' limit 1")

		if rows > 0 then
			VH:SQLQuery ("delete from `" .. tbl_sql ["miver"] .. "` where `version` = '" .. entry .. "' limit 1")
			commandanswer (nick, string.format (getlang (902), item))
		else
			commandanswer (nick, string.format (getlang (903), item))
		end

	elseif part == "ex" then
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["miex"].."` where `exception` = '"..entry.."' limit 1")

		if rows > 0 then
			VH:SQLQuery ("delete from `"..tbl_sql ["miex"].."` where `exception` = '"..entry.."' limit 1")
			commandanswer (nick, string.format (getlang (83), item))
		else
			commandanswer (nick, string.format (getlang (84), item))
		end

	else -- unknown
		commandanswer (nick, string.format (getlang (100), "nick, desc, tag, conn, email, share, ip, cc, dns, sup, ver " .. getlang (70) .. " ex"))
	end
end

----- ---- --- -- -

function listmyinfoentry (nick, part)
	local rows, lsttxt, nolsttxt = 0, nil, ""

	if part == "nick" then
		_, rows = VH:SQLQuery ("select `nick`, `time`, `occurred` from `"..tbl_sql ["minick"].."` order by `occurred` desc")
		lsttxt = getlang (85)
		nolsttxt = getlang (86)

	elseif part == "desc" then
		_, rows = VH:SQLQuery ("select `description`, `time`, `occurred` from `"..tbl_sql ["midesc"].."` order by `occurred` desc")
		lsttxt = getlang (87)
		nolsttxt = getlang (88)

	elseif part == "tag" then
		_, rows = VH:SQLQuery ("select `tag`, `time`, `occurred` from `"..tbl_sql ["mitag"].."` order by `occurred` desc")
		lsttxt = getlang (89)
		nolsttxt = getlang (90)

	elseif part == "conn" then
		_, rows = VH:SQLQuery ("select `connection`, `time`, `occurred` from `"..tbl_sql ["miconn"].."` order by `occurred` desc")
		lsttxt = getlang (91)
		nolsttxt = getlang (92)

	elseif part == "email" then
		_, rows = VH:SQLQuery ("select `email`, `time`, `occurred` from `"..tbl_sql ["miemail"].."` order by `occurred` desc")
		lsttxt = getlang (93)
		nolsttxt = getlang (94)

	elseif part == "share" then
		_, rows = VH:SQLQuery ("select `share`, `time`, `occurred` from `"..tbl_sql ["mishare"].."` order by `occurred` desc")
		lsttxt = getlang (95)
		nolsttxt = getlang (96)

	elseif part == "ip" then
		_, rows = VH:SQLQuery ("select `ip`, `time`, `occurred` from `"..tbl_sql ["miip"].."` order by `occurred` desc")
		lsttxt = getlang (352)
		nolsttxt = getlang (353)

	elseif part == "cc" then
		_, rows = VH:SQLQuery ("select `cc`, `time`, `occurred` from `"..tbl_sql ["micc"].."` order by `occurred` desc")
		lsttxt = getlang (794)
		nolsttxt = getlang (795)

	elseif part == "dns" then
		_, rows = VH:SQLQuery ("select `dns`, `time`, `occurred` from `"..tbl_sql ["midns"].."` order by `occurred` desc")
		lsttxt = getlang (763)
		nolsttxt = getlang (764)

	elseif part == "sup" then
		_, rows = VH:SQLQuery ("select `supports`, `time`, `occurred` from `" .. tbl_sql ["misup"] .. "` order by `occurred` desc")
		lsttxt = getlang (904)
		nolsttxt = getlang (905)

	elseif part == "ver" then
		_, rows = VH:SQLQuery ("select `version`, `time`, `occurred` from `" .. tbl_sql ["miver"] .. "` order by `occurred` desc")
		lsttxt = getlang (906)
		nolsttxt = getlang (907)

	elseif part == "ex" then
		_, rows = VH:SQLQuery ("select `exception`, `occurred` from `"..tbl_sql ["miex"].."` order by `occurred` desc")
		lsttxt = getlang (97)
		nolsttxt = getlang (98)

	else -- unknown
		commandanswer (nick, string.format (getlang (100), "nick, desc, tag, conn, email, share, ip, cc, dns, sup, ver " .. getlang (70) .. " ex"))
	end

	if lsttxt then
		if rows > 0 then
			local anentry, len = "", 0

			for x = 0, rows - 1 do
				if part == "ex" then
					local _, entry, occurred = VH:SQLFetch (x)
					if x == 0 then len = string.len (occurred) end
					anentry = anentry.." "..prezero (string.len (rows), (x + 1))..". [ O: "..prezero (len, occurred).." ] "..repnmdcoutchars (entry).."\r\n"
				else
					local _, entry, btime, occurred = VH:SQLFetch (x)
					if x == 0 then len = string.len (occurred) end
					anentry = anentry.." "..prezero (string.len (rows), (x + 1))..". [ O: "..prezero (len, occurred).." ] "..repnmdcoutchars (entry).." [ B: "..btime.." ]\r\n"
				end
			end

			commandanswer (nick, lsttxt..":\r\n\r\n"..anentry)
		else
			commandanswer (nick, nolsttxt)
		end
	end
end

----- ---- --- -- -

function cleanuptable (nick, line, cls)
	local _, _, ctype, cdays = string.find (line, "^(%S+) (%d+).*$")
	local seconds = os.difftime (os.time (), (tonumber (cdays) * 24 * 3600))
	local tm = os.time () + table_sets ["srvtimediff"]

	if ctype == "kick" then
		commandanswer (nick, getlang (3))
		local _, rows = VH:SQLQuery ("select `is_drop` from `kicklist` where `time` < "..seconds)

		if rows > 0 then
			VH:SQLQuery ("delete from `kicklist` where `time` < "..seconds)
			commandanswer (nick, string.format (getlang (99), rows, ctype))
			opsnotify (table_sets ["classnotiledoact"], string.format (getlang (8), nick, cls, rows, cdays))
			VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('lastcleankick', "..tm..") on duplicate key update `value` = "..tm)
			VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('limcleankick', "..cdays..") on duplicate key update `value` = "..cdays)
		else
			commandanswer (nick, string.format (getlang (101), ctype))
		end

	elseif ctype == "ban" then
		commandanswer (nick, getlang (3))
		local _, rows = VH:SQLQuery ("select `ban_type` from `banlist` where `date_start` < "..seconds)

		if rows > 0 then
			VH:SQLQuery ("delete from `banlist` where `date_start` < "..seconds)
			commandanswer (nick, string.format (getlang (99), rows, ctype))
			opsnotify (table_sets ["classnotiledoact"], string.format (getlang (7), nick, cls, rows, cdays))
			VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('lastcleanban', "..tm..") on duplicate key update `value` = "..tm)
			VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('limcleanban', "..cdays..") on duplicate key update `value` = "..cdays)
		else
			commandanswer (nick, string.format (getlang (101), ctype))
		end

	elseif ctype == "unban" then
		commandanswer (nick, getlang (3))
		local _, rows = VH:SQLQuery ("select `ban_type` from `unbanlist` where `date_start` < "..seconds)

		if rows > 0 then
			VH:SQLQuery ("delete from `unbanlist` where `date_start` < "..seconds)
			commandanswer (nick, string.format (getlang (99), rows, ctype))
			opsnotify (table_sets ["classnotiledoact"], string.format (getlang (6), nick, cls, rows, cdays))
			VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('lastcleanunban', "..tm..") on duplicate key update `value` = "..tm)
			VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('limcleanunban', "..cdays..") on duplicate key update `value` = "..cdays)
		else
			commandanswer (nick, string.format (getlang (101), ctype))
		end

	elseif ctype == "reg" then
		commandanswer (nick, getlang (332))

	elseif ctype == "iplog" then
		commandanswer (nick, getlang (3))
		local _, rows = VH:SQLQuery ("select `id` from `pi_iplog` where `date` < "..seconds)

		if rows > 0 then
			VH:SQLQuery ("delete from `pi_iplog` where `date` < "..seconds)
			commandanswer (nick, string.format (getlang (99), rows, ctype))
			opsnotify (table_sets ["classnotiledoact"], string.format (getlang (5), nick, cls, rows, cdays))
			VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('lastcleaniplog', "..tm..") on duplicate key update `value` = "..tm)
			VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('limcleaniplog', "..cdays..") on duplicate key update `value` = "..cdays)
		else
			commandanswer (nick, string.format (getlang (101), ctype))
		end

	elseif ctype == "stats" then
		commandanswer (nick, getlang (3))
		local _, rows = VH:SQLQuery ("select `realtime` from `pi_stats` where `realtime` < "..seconds)

		if rows > 0 then
			VH:SQLQuery ("delete from `pi_stats` where `realtime` < "..seconds)
			commandanswer (nick, string.format (getlang (99), rows, ctype))
			opsnotify (table_sets ["classnotiledoact"], string.format (getlang (148), nick, cls, rows, cdays))
			VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('lastcleanstats', "..tm..") on duplicate key update `value` = "..tm)
			VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('limcleanstats', "..cdays..") on duplicate key update `value` = "..cdays)
		else
			commandanswer (nick, string.format (getlang (101), ctype))
		end

	elseif ctype == "ulog" then
		commandanswer (nick, getlang (3))
		local _, rows = VH:SQLQuery ("select `id` from `"..tbl_sql ["ulog"].."` where `time` < "..seconds)

		if rows > 0 then
			VH:SQLQuery ("delete from `"..tbl_sql ["ulog"].."` where `time` < "..seconds)
			commandanswer (nick, string.format (getlang (99), rows, ctype))
			opsnotify (table_sets ["classnotiledoact"], string.format (getlang (167), nick, cls, rows, cdays))
			VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('lastcleanulog', "..tm..") on duplicate key update `value` = "..tm)
			VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('limcleanulog', "..cdays..") on duplicate key update `value` = "..cdays)
		else
			commandanswer (nick, string.format (getlang (101), ctype))
		end

	elseif ctype == "clog" then
		commandanswer (nick, getlang (3))
		local _, rows = VH:SQLQuery ("select `id` from `"..tbl_sql ["clog"].."` where `time` < "..seconds)

		if rows > 0 then
			VH:SQLQuery ("delete from `"..tbl_sql ["clog"].."` where `time` < "..seconds)
			commandanswer (nick, string.format (getlang (99), rows, ctype))
			opsnotify (table_sets ["classnotiledoact"], string.format (getlang (782), nick, cls, rows, cdays))
			VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('lastcleanclog', "..tm..") on duplicate key update `value` = "..tm)
			VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('limcleanclog', "..cdays..") on duplicate key update `value` = "..cdays)
		else
			commandanswer (nick, string.format (getlang (101), ctype))
		end

	elseif ctype == "anti" then
		commandanswer (nick, getlang (3))
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["anti"].."` where `occurred` < "..cdays)

		if rows > 0 then
			VH:SQLQuery ("delete from `"..tbl_sql ["anti"].."` where `occurred` < "..cdays)
			commandanswer (nick, string.format (getlang (99), rows, ctype))
			opsnotify (table_sets ["classnotiledoact"], string.format (getlang (839), nick, cls, rows, cdays))
		else
			commandanswer (nick, string.format (getlang (101), ctype))
		end

	elseif ctype == "sefi" then
		commandanswer (nick, getlang (3))
		local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["sefi"].."` where `occurred` < "..cdays)

		if rows > 0 then
			VH:SQLQuery ("delete from `"..tbl_sql ["sefi"].."` where `occurred` < "..cdays)
			commandanswer (nick, string.format (getlang (99), rows, ctype))
			opsnotify (table_sets ["classnotiledoact"], string.format (getlang (840), nick, cls, rows, cdays))
		else
			commandanswer (nick, string.format (getlang (101), ctype))
		end

	elseif ctype == "rel" then
		commandanswer (nick, getlang (3))
		local _, rows = VH:SQLQuery ("select `date` from `"..tbl_sql ["rel"].."` where `date` < "..seconds)

		if rows > 0 then
			VH:SQLQuery ("delete from `"..tbl_sql ["rel"].."` where `date` < "..seconds)
			commandanswer (nick, string.format (getlang (99), rows, ctype))
			opsnotify (table_sets ["classnotiledoact"], string.format (getlang (603), nick, cls, rows, cdays))
			VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('lastcleanrel', "..tm..") on duplicate key update `value` = "..tm)
			VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('limcleanrel', "..cdays..") on duplicate key update `value` = "..cdays)
		else
			commandanswer (nick, string.format (getlang (101), ctype))
		end

	else -- unknown type
		commandanswer (nick, string.format (getlang (100), "kick, ban, unban, reg, ulog, clog, rel, anti, sefi, iplog "..getlang (70).." stats"))
	end
end

----- ---- --- -- -

function altcleanuptable (nick, line, cls)
	local _, ctype, cdays, seconds, altvar = 0, "", 0, 0, 0

	if string.find (line, "^%S+ [%d+%*] %-%d$") then
		_, _, ctype, cdays, altvar = string.find (line, "^(%S+) ([%d+%*]) (%-%d)$")
	else
		_, _, ctype, cdays, altvar = string.find (line, "^(%S+) ([%d+%*]) (%d+)$")
	end

	if ctype == "reg" then
		altvar = tonumber (altvar)

		if (altvar == 10) or (altvar == 5) or (altvar == 4) or (altvar == 3) or (altvar == 2) or (altvar == 1) or (altvar == 0) or (altvar == -1) then
			if cdays ~= "*" then
				cdays = tonumber (cdays)
				seconds = os.difftime (os.time (), (cdays * 24 * 3600))
			end

			commandanswer (nick, getlang (3))
			local rows = 0

			if cdays == "*" then
				_, rows = VH:SQLQuery ("select `nick` from `reglist` where `class` = " .. altvar)
			elseif cdays == 0 then
				_, rows = VH:SQLQuery ("select `nick` from `reglist` where `login_last` is null and `class` = " .. altvar)
			else
				_, rows = VH:SQLQuery ("select `nick` from `reglist` where `login_last` is not null and `login_last` < " .. seconds .. " and `class` = " .. altvar)
			end

			if rows > 0 then
				local anick = ""

				for x = 0, rows - 1 do
					local _, user = VH:SQLFetch (x)
					anick = anick .. " " .. prezero (string.len (rows), (x + 1)) .. ". " .. user .. "\r\n"
				end

				if cdays == "*" then
					VH:SQLQuery ("delete from `reglist` where `class` = " .. altvar)
				elseif cdays == 0 then
					VH:SQLQuery ("delete from `reglist` where `login_last` is null and `class` = " .. altvar)
				else
					VH:SQLQuery ("delete from `reglist` where `login_last` is not null and `login_last` < " .. seconds .. " and `class` = " .. altvar)
				end

				commandanswer (nick, string.format (getlang (334), rows, altvar) .. ":\r\n\r\n" .. anick)
				opsnotify (table_sets ["classnotiledoact"], string.format (getlang (335), nick, cls, rows, altvar, cdays))
				local tm = os.time () + table_sets ["srvtimediff"]
				VH:SQLQuery ("insert into `" .. tbl_sql ["conf"] .. "` (`variable`, `value`) values ('lastcleanreg', " .. tm .. ") on duplicate key update `value` = " .. tm)
				VH:SQLQuery ("insert into `" .. tbl_sql ["conf"] .. "` (`variable`, `value`) values ('limcleanreg', '" .. cdays .. "') on duplicate key update `value` = '" .. cdays .. "'")
			else
				commandanswer (nick, string.format (getlang (101), ctype))
			end
		else
			commandanswer (nick, string.format (getlang (143), "-1, 0, 1, 2, 3, 4, 5 " .. getlang (70) .. " 10"))
		end
	else -- redirect to another type
		cleanuptable (nick, line, cls)
	end
end

----- ---- --- -- -

function chatrankaccept (nick, ucls)
	if (table_sets ["regmechatcnt"] > 0) and (ucls == 0) then -- regme limiter
		if table_regm [nick] then
			if table_regm [nick] < table_sets ["regmechatcnt"] then
				table_regm [nick] = table_regm [nick] + 1
			end
		else
			table_regm [nick] = 1
		end
	end

	if ucls < table_sets ["chatrankclass"] then return nil end -- chat rank
	local usr = repsqlchars (nick)
	local _, rows = VH:SQLQuery ("select `nick` from `"..tbl_sql ["ranex"].."` where `nick` = '"..usr.."' limit 1")

	if rows > 0 then
		VH:SQLQuery ("update `"..tbl_sql ["ranex"].."` set `occurred` = `occurred` + 1 where `nick` = '"..usr.."' limit 1")
	else
		VH:SQLQuery ("insert into `"..tbl_sql ["chran"].."` (`nick`) values ('"..usr.."') on duplicate key update `rank` = `rank` + 1")
	end
end

----- ---- --- -- -

function sharerankaccept (nick, share, ucls)
if ucls < table_sets ["sharerankclass"] then return nil end
if share < (table_sets ["shareranmin"] * 1073741824) then return nil end -- only users with share
local usr = repsqlchars (nick)
local _, rows = VH:SQLQuery ("select `nick` from `"..tbl_sql ["ranex"].."` where `nick` = '"..usr.."' limit 1")

if rows > 0 then
	VH:SQLQuery ("update `"..tbl_sql ["ranex"].."` set `occurred` = `occurred` + 1 where `nick` = '"..usr.."' limit 1")
else
	local _, rows = VH:SQLQuery ("select `rank` from `"..tbl_sql ["shran"].."` where `nick` = '"..usr.."' limit 1")

	if rows > 0 then
		local _, rank = VH:SQLFetch (0)

		if share > tonumber (rank) then
			VH:SQLQuery ("update `"..tbl_sql ["shran"].."` set `rank` = "..share.." where `nick` = '"..usr.."' limit 1")
		end

	else
		VH:SQLQuery ("insert into `"..tbl_sql ["shran"].."` (`nick`, `rank`) values ('"..usr.."', "..share..")")
	end
end
end

----- ---- --- -- -

function oprankaccept (nick, ucls)
if ucls < table_sets ["oprankclass"] then return nil end
local usr = repsqlchars (nick)
local _, rows = VH:SQLQuery ("select `nick` from `"..tbl_sql ["ranex"].."` where `nick` = '"..usr.."' limit 1")

if rows > 0 then
	VH:SQLQuery ("update `"..tbl_sql ["ranex"].."` set `occurred` = `occurred` + 1 where `nick` = '"..usr.."' limit 1")
else
	VH:SQLQuery ("insert into `"..tbl_sql ["opran"].."` (`nick`) values ('"..usr.."') on duplicate key update `rank` = `rank` + 1")
end
end

----- ---- --- -- -

function searrankaccept (nick, ucls, data)
if ucls < table_sets ["searrankclass"] then return nil end
local _, _, tp, str = string.find (data, "^%$Search .* .*%?.*%?.*%?(.*)%?(.*)$")
if not str then return nil end
if string.len (str) == 0 then return nil end -- search setting might be zero
if tonumber (tp or 1) == 9 then return nil end -- skip tth
str = repsrchchars (str)
if string.find (str, "^%s+$") then return nil end
local usr = repsqlchars (nick)
local _, rows = VH:SQLQuery ("select `nick` from `"..tbl_sql ["ranex"].."` where `nick` = '"..usr.."' limit 1")

if rows > 0 then
	VH:SQLQuery ("update `"..tbl_sql ["ranex"].."` set `occurred` = `occurred` + 1 where `nick` = '"..usr.."' limit 1")
else
	VH:SQLQuery ("insert into `"..tbl_sql ["srran"].."` (`search`) values ('"..repsqlchars (str).."') on duplicate key update `rank` = `rank` + 1")
end
end

----- ---- --- -- -

function searranksendall (nick)
local _, rows = VH:SQLQuery ("select `search`, `rank` from `"..tbl_sql ["srran"].."` order by `rank` desc limit "..table_sets ["ranklimit"])

if rows > 0 then
	local arank, len = "", 0

	for x = 0, rows - 1 do
		local _, user, rank = VH:SQLFetch (x)
		if x == 0 then len = string.len (rank) end
		arank = arank.." "..prezero (string.len (rows), (x + 1))..". [ R: "..prezero (len, rank).." ] "..repnmdcoutchars (user).."\r\n"
	end

	commandanswer (nick, string.format (getlang (694), rows)..":\r\n\r\n"..arank)
else
	commandanswer (nick, getlang (695))
end
end

----- ---- --- -- -

function wordrankaccept (nick, ucls, line)
	if ucls < table_sets ["wordrankclass"] then return nil end
	local usr = repsqlchars (nick)
	local _, rows = VH:SQLQuery ("select `nick` from `"..tbl_sql ["ranex"].."` where `nick` = '"..usr.."' limit 1")

	if rows > 0 then
		VH:SQLQuery ("update `"..tbl_sql ["ranex"].."` set `occurred` = `occurred` + 1 where `nick` = '"..usr.."' limit 1")
	else
		local str = repwordranchars (repnmdcinchars (line), 0).."$"

		for aword in string.gmatch (str, "([^$]+)%$") do
			aword = repwordranchars (aword, 1)
			local stlen = string.len (aword)

			if (stlen >= table_sets ["wordranmin"]) and (stlen <= table_sets ["wordranmax"]) then
				VH:SQLQuery ("insert into `"..tbl_sql ["wdran"].."` (`word`) values ('"..repsqlchars (aword).."') on duplicate key update `rank` = `rank` + 1")
			end
		end
	end
end

----- ---- --- -- -

function cleanwordrank (limit, maxi)
local _, rows = VH:SQLQuery ("select `word` from `"..tbl_sql ["wdran"].."`")

if rows > 0 then
local table_delete = {}

for x = 0, rows - 1 do
local _, aword = VH:SQLFetch (x)

if maxi == 0 then
if string.len (aword) < limit then
table_delete [aword] = x
end

else

if string.len (aword) > limit then
table_delete [aword] = x
end
end
end

for k, _ in pairs (table_delete) do
VH:SQLQuery ("delete from `"..tbl_sql ["wdran"].."` where `word` = '"..repsqlchars (k).."' limit 1")
end
end
end

----- ---- --- -- -

function delrank (nick, line)
local _, _, ctype, cuser = string.find (line, "^(%S+) (%S+)$")
local auser = repsqlchars (cuser)

if ctype == "chat" then
local _, rows = VH:SQLQuery ("select `rank` from `"..tbl_sql ["chran"].."` where `nick` = '"..auser.."' limit 1")

if rows > 0 then
VH:SQLQuery ("delete from `"..tbl_sql ["chran"].."` where `nick` = '"..auser.."' limit 1")
commandanswer (nick, string.format (getlang (105), cuser))
else
commandanswer (nick, string.format (getlang (106), cuser))
end

elseif ctype == "share" then
local _, rows = VH:SQLQuery ("select `rank` from `"..tbl_sql ["shran"].."` where `nick` = '"..auser.."' limit 1")

if rows > 0 then
VH:SQLQuery ("delete from `"..tbl_sql ["shran"].."` where `nick` = '"..auser.."' limit 1")
commandanswer (nick, string.format (getlang (321), cuser))
else
commandanswer (nick, string.format (getlang (322), cuser))
end

elseif ctype == "op" then
local _, rows = VH:SQLQuery ("select `rank` from `"..tbl_sql ["opran"].."` where `nick` = '"..auser.."' limit 1")

if rows > 0 then
VH:SQLQuery ("delete from `"..tbl_sql ["opran"].."` where `nick` = '"..auser.."' limit 1")
commandanswer (nick, string.format (getlang (107), cuser))
else
commandanswer (nick, string.format (getlang (108), cuser))
end

elseif ctype == "sear" then
	local _, rows = VH:SQLQuery ("select `rank` from `"..tbl_sql ["srran"].."` where `search` = '"..auser.."' limit 1")

	if rows > 0 then
		VH:SQLQuery ("delete from `"..tbl_sql ["srran"].."` where `search` = '"..auser.."' limit 1")
		commandanswer (nick, string.format (getlang (696), cuser))
	else
		commandanswer (nick, string.format (getlang (697), cuser))
	end

elseif ctype == "word" then
local _, rows = VH:SQLQuery ("select `rank` from `"..tbl_sql ["wdran"].."` where `word` = '"..auser.."' limit 1")

if rows > 0 then
VH:SQLQuery ("delete from `"..tbl_sql ["wdran"].."` where `word` = '"..auser.."' limit 1")
commandanswer (nick, string.format (getlang (440), cuser))
else
commandanswer (nick, string.format (getlang (441), cuser))
end

elseif ctype == "cc" then
local _, rows = VH:SQLQuery ("select `cc` from `"..tbl_sql ["ccstat"].."` where `cc` = '"..auser.."'")

if rows > 0 then
VH:SQLQuery ("delete from `"..tbl_sql ["ccstat"].."` where `cc` = '"..auser.."'")
commandanswer (nick, string.format (getlang (629), rows, cuser))
else
commandanswer (nick, string.format (getlang (279), cuser))
end

elseif ctype == "all" then
delrank (nick, "chat "..cuser)
delrank (nick, "share "..cuser)
delrank (nick, "op "..cuser)
-- search ranks not added
-- word ranks not added
-- cc ranks not added

else -- unknown type
commandanswer (nick, string.format (getlang (100), "chat, share, op, sear, word, cc "..getlang (70).." all"))
end
end

----- ---- --- -- -

function cleanupranks (nick, line, cls)
local _, _, ctype, climt = string.find (line, "^(%S+) (%d+)$")
local climt = tonumber (climt)
local tm = os.time () + table_sets ["srvtimediff"]

if ctype == "chat" then
commandanswer (nick, getlang (3))
local rows = 0

if climt == 0 then
rows = counttable (tbl_sql ["chran"])
else
_, rows = VH:SQLQuery ("select `rank` from `"..tbl_sql ["chran"].."` where `rank` < "..climt)
end

if rows > 0 then
if climt == 0 then
VH:SQLQuery ("truncate table `"..tbl_sql ["chran"].."`")
else
VH:SQLQuery ("delete from `"..tbl_sql ["chran"].."` where `rank` < "..climt)
end

commandanswer (nick, string.format (getlang (99), rows, ctype))
opsnotify (table_sets ["classnotiledoact"], string.format (getlang (374), nick, cls, rows, climt))
VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('lastcleanchran', "..tm..") on duplicate key update `value` = "..tm)
VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('limcleanchran', "..climt..") on duplicate key update `value` = "..climt)
else
commandanswer (nick, string.format (getlang (101), ctype))
end

elseif ctype == "share" then
commandanswer (nick, getlang (3))
local rows, cbytes = 0, 0

if climt == 0 then
rows = counttable (tbl_sql ["shran"])
else
cbytes = roundint ((climt * 1073741824), 0)
_, rows = VH:SQLQuery ("select `rank` from `"..tbl_sql ["shran"].."` where `rank` < "..cbytes)
end

if rows > 0 then
if climt == 0 then
VH:SQLQuery ("truncate table `"..tbl_sql ["shran"].."`")
else
VH:SQLQuery ("delete from `"..tbl_sql ["shran"].."` where `rank` < "..cbytes)
end

commandanswer (nick, string.format (getlang (99), rows, ctype))
opsnotify (table_sets ["classnotiledoact"], string.format (getlang (375), nick, cls, rows, climt))
VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('lastcleanshran', "..tm..") on duplicate key update `value` = "..tm)
VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('limcleanshran', "..climt..") on duplicate key update `value` = "..climt)
else
commandanswer (nick, string.format (getlang (101), ctype))
end

elseif ctype == "op" then
commandanswer (nick, getlang (3))
local rows = 0

if climt == 0 then
rows = counttable (tbl_sql ["opran"])
else
_, rows = VH:SQLQuery ("select `rank` from `"..tbl_sql ["opran"].."` where `rank` < "..climt)
end

if rows > 0 then
if climt == 0 then
VH:SQLQuery ("truncate table `"..tbl_sql ["opran"].."`")
else
VH:SQLQuery ("delete from `"..tbl_sql ["opran"].."` where `rank` < "..climt)
end

commandanswer (nick, string.format (getlang (99), rows, ctype))
opsnotify (table_sets ["classnotiledoact"], string.format (getlang (376), nick, cls, rows, climt))
VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('lastcleanopran', "..tm..") on duplicate key update `value` = "..tm)
VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('limcleanopran', "..climt..") on duplicate key update `value` = "..climt)
else
commandanswer (nick, string.format (getlang (101), ctype))
end

elseif ctype == "sear" then
	commandanswer (nick, getlang (3))
	local rows = 0

	if climt == 0 then
		rows = counttable (tbl_sql ["srran"])
	else
		_, rows = VH:SQLQuery ("select `rank` from `"..tbl_sql ["srran"].."` where `rank` < "..climt)
	end

	if rows > 0 then
		if climt == 0 then
			VH:SQLQuery ("truncate table `"..tbl_sql ["srran"].."`")
		else
			VH:SQLQuery ("delete from `"..tbl_sql ["srran"].."` where `rank` < "..climt)
		end

		commandanswer (nick, string.format (getlang (99), rows, ctype))
		opsnotify (table_sets ["classnotiledoact"], string.format (getlang (698), nick, cls, rows, climt))
		VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('lastcleansrran', "..tm..") on duplicate key update `value` = "..tm)
		VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('limcleansrran', "..climt..") on duplicate key update `value` = "..climt)
	else
		commandanswer (nick, string.format (getlang (101), ctype))
	end

elseif ctype == "word" then
commandanswer (nick, getlang (3))
local rows = 0

if climt == 0 then
rows = counttable (tbl_sql ["wdran"])
else
_, rows = VH:SQLQuery ("select `rank` from `"..tbl_sql ["wdran"].."` where `rank` < "..climt)
end

if rows > 0 then
if climt == 0 then
VH:SQLQuery ("truncate table `"..tbl_sql ["wdran"].."`")
else
VH:SQLQuery ("delete from `"..tbl_sql ["wdran"].."` where `rank` < "..climt)
end

commandanswer (nick, string.format (getlang (99), rows, ctype))
opsnotify (table_sets ["classnotiledoact"], string.format (getlang (442), nick, cls, rows, climt))
VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('lastcleanwdran', "..tm..") on duplicate key update `value` = "..tm)
VH:SQLQuery ("insert into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('limcleanwdran', "..climt..") on duplicate key update `value` = "..climt)
else
commandanswer (nick, string.format (getlang (101), ctype))
end

elseif ctype == "cc" then
VH:SQLQuery ("truncate table `"..tbl_sql ["ccstat"].."`")
VH:SQLQuery ("update ignore `"..tbl_sql ["conf"].."` set `value` = '"..(os.time () + table_sets ["srvtimediff"]).."' where `variable` = 'date_ccstats' limit 1")
commandanswer (nick, string.format (getlang (520), ctype))
opsnotify (table_sets ["classnotiledoact"], string.format (getlang (521), nick, cls))

else -- unknown type
	commandanswer (nick, string.format (getlang (100), "chat, share, op, sear, word "..getlang (70).." cc"))
end
end

----- ---- --- -- -

function chatranksendown (nick)
local _, rows = VH:SQLQuery ("select `rank` from `"..tbl_sql ["chran"].."` where `nick` = '"..repsqlchars (nick).."' limit 1")

if rows > 0 then
local _, rank = VH:SQLFetch (0)
commandanswer (nick, string.format (getlang (110), rank))
else
commandanswer (nick, getlang (111))
end
end

----- ---- --- -- -

function shareranksendown (nick)
local _, rows = VH:SQLQuery ("select `rank` from `"..tbl_sql ["shran"].."` where `nick` = '"..repsqlchars (nick).."' limit 1")

if rows > 0 then
local _, rank = VH:SQLFetch (0)
commandanswer (nick, string.format (getlang (327), makesize (rank)))
else
commandanswer (nick, string.format (getlang (325), table_sets ["shareranmin"].." "..getlang (362)))
end
end

----- ---- --- -- -

function opranksendown (nick)
local _, rows = VH:SQLQuery ("select `rank` from `"..tbl_sql ["opran"].."` where `nick` = '"..repsqlchars (nick).."' limit 1")

if rows > 0 then
local _, rank = VH:SQLFetch (0)
commandanswer (nick, string.format (getlang (114), rank))
else
commandanswer (nick, getlang (115))
end
end

----- ---- --- -- -

function chatranksendall (nick)
local _, rows = VH:SQLQuery ("select `nick`, `rank` from `"..tbl_sql ["chran"].."` order by `rank` desc limit "..table_sets ["ranklimit"])

if rows > 0 then
local arank, len = "", 0

for x = 0, rows - 1 do
local _, user, rank = VH:SQLFetch (x)
if x == 0 then len = string.len (rank) end
arank = arank.." "..prezero (string.len (rows), (x + 1))..". [ R: "..prezero (len, rank).." ] "..user.."\r\n"
end

commandanswer (nick, string.format (getlang (116), rows)..":\r\n\r\n"..arank)
else
commandanswer (nick, getlang (117))
end
end

----- ---- --- -- -

function shareranksendall (nick)
local _, rows = VH:SQLQuery ("select `nick`, `rank` from `"..tbl_sql ["shran"].."` order by `rank` desc limit "..table_sets ["ranklimit"])

if rows > 0 then
local arank = ""

for x = 0, rows - 1 do
local _, user, rank = VH:SQLFetch (x)
arank = arank.." "..prezero (string.len (rows), (x + 1))..". "..user.." @ "..makesize (rank).."\r\n"
end

commandanswer (nick, string.format (getlang (324), rows)..":\r\n\r\n"..arank)
else
commandanswer (nick, getlang (326))
end
end

----- ---- --- -- -

function opranksendall (nick)
local _, rows = VH:SQLQuery ("select `nick`, `rank` from `"..tbl_sql ["opran"].."` order by `rank` desc limit "..table_sets ["ranklimit"])

if rows > 0 then
local arank, len = "", 0

for x = 0, rows - 1 do
local _, user, rank = VH:SQLFetch (x)
if x == 0 then len = string.len (rank) end
arank = arank.." "..prezero (string.len (rows), (x + 1))..". [ R: "..prezero (len, rank).." ] "..user.."\r\n"
end

commandanswer (nick, string.format (getlang (118), rows)..":\r\n\r\n"..arank)
else
commandanswer (nick, getlang (119))
end
end

----- ---- --- -- -

function wordranksendall (nick)
local _, rows = VH:SQLQuery ("select `word`, `rank` from `"..tbl_sql ["wdran"].."` order by `rank` desc limit "..table_sets ["ranklimit"])

if rows > 0 then
	local arank, len = "", 0

	for x = 0, rows - 1 do
		local _, user, rank = VH:SQLFetch (x)
		if x == 0 then len = string.len (rank) end
		arank = arank.." "..prezero (string.len (rows), (x + 1))..". [ R: "..prezero (len, rank).." ] "..repnmdcoutchars (user).."\r\n"
	end

	commandanswer (nick, string.format (getlang (439), rows)..":\r\n\r\n"..arank)
else
	commandanswer (nick, getlang (445))
end
end

----- ---- --- -- -

function addrankex (nick, item)
local entry = repsqlchars (item)
local _, rows = VH:SQLQuery ("select `nick` from `"..tbl_sql ["ranex"].."` where `nick` = '"..entry.."' limit 1")

if rows > 0 then
commandanswer (nick, string.format (getlang (210), item))
else
VH:SQLQuery ("insert into `"..tbl_sql ["ranex"].."` (`nick`) values ('"..entry.."')")
commandanswer (nick, string.format (getlang (211), item))
delrank (nick, "all "..item)
end
end

----- ---- --- -- -

function delrankex (nick, item)
local aitem = repsqlchars (item)
local _, rows = VH:SQLQuery ("select `nick` from `"..tbl_sql ["ranex"].."` where `nick` = '"..aitem.."' limit 1")

if rows > 0 then
VH:SQLQuery ("delete from `"..tbl_sql ["ranex"].."` where `nick` = '"..aitem.."' limit 1")
commandanswer (nick, string.format (getlang (212), item))
else
commandanswer (nick, string.format (getlang (213), item))
end
end

----- ---- --- -- -

function listrankex (nick)
local _, rows = VH:SQLQuery ("select `nick`, `occurred` from `"..tbl_sql ["ranex"].."` order by `occurred` desc")

if rows > 0 then
local anentry, len = "", 0

for x = 0, rows - 1 do
local _, entry, occurred = VH:SQLFetch (x)
if x == 0 then len = string.len (occurred) end
anentry = anentry.." "..prezero (string.len (rows), (x + 1))..". [ O: "..prezero (len, occurred).." ] "..entry.."\r\n"
end

commandanswer (nick, getlang (214)..":\r\n\r\n"..anentry)
else
commandanswer (nick, getlang (215))
end
end

----- ---- --- -- -

function countranks (tbl)
local _, rows = VH:SQLQuery ("select `rank` from `"..tbl.."`")
local crcount = 0

if rows > 0 then
	for x = 0, rows - 1 do
		local _, anum = VH:SQLFetch (x)
		crcount = crcount + tonumber (anum)
	end
end

return crcount
end

----- ---- --- -- -

function addsefientry (nick, item)
local _, _, prio, aaction, stype = string.find (item, "^.+ (%d) (%d) (%d)$")
prio = tonumber (prio)
aaction = tonumber (aaction)
stype = tonumber (stype)

if (aaction < 0) or (aaction > 7) then -- invalid action
commandanswer (nick, string.format (getlang (227), "0, 1, 2, 3, 4, 5, 6 "..getlang (70).." 7"))
elseif (prio < 0) or (prio > 9) then -- invalid priority
commandanswer (nick, string.format (getlang (23), 0, 9))
elseif (stype < 1) or (stype > 9) then -- invalid search type
commandanswer (nick, string.format (getlang (319), "1, 2, 3, 4, 5, 6, 7, 8 "..getlang (70).." 9"))
else
local _, _, aitem = string.find (item, "^(.+) %d %d %d$")
local entry = repsqlchars (repnmdcinchars (aitem))
local _, rows = VH:SQLQuery ("select `action` from `"..tbl_sql ["sefi"].."` where `filter` = '"..entry.."' limit 1")

if rows > 0 then
VH:SQLQuery ("update `"..tbl_sql ["sefi"].."` set `priority` = "..prio..", `action` = "..aaction..", `type` = "..stype.." where `filter` = '"..entry.."' limit 1")
local note = 585

if stype == 2 then note = 586
elseif stype == 3 then note = 587
elseif stype == 4 then note = 588
elseif stype == 5 then note = 589
elseif stype == 6 then note = 590
elseif stype == 7 then note = 591
elseif stype == 8 then note = 592
elseif stype == 9 then note = 593
end

commandanswer (nick, string.format (getlang (note), aaction, prio, aitem))
else
VH:SQLQuery ("insert into `"..tbl_sql ["sefi"].."` (`filter`, `priority`, `action`, `type`) values ('"..entry.."', "..prio..", "..aaction..", "..stype..")")
local note = 594

if stype == 2 then note = 595
elseif stype == 3 then note = 596
elseif stype == 4 then note = 597
elseif stype == 5 then note = 598
elseif stype == 6 then note = 599
elseif stype == 7 then note = 600
elseif stype == 8 then note = 601
elseif stype == 9 then note = 602
end

commandanswer (nick, string.format (getlang (note), aaction, prio, aitem))
end
end
end

----- ---- --- -- -

function delsefientry (nick, item)
local aitem = repsqlchars (repnmdcinchars (item))
local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["sefi"].."` where `filter` = '"..aitem.."' limit 1")

if rows > 0 then
VH:SQLQuery ("delete from `"..tbl_sql ["sefi"].."` where `filter` = '"..aitem.."' limit 1")
commandanswer (nick, string.format (getlang (220), item))
else
commandanswer (nick, string.format (getlang (221), item))
end
end

----- ---- --- -- -

function listsefientry (nick)
local _, rows = VH:SQLQuery ("select `filter`, `occurred`, `priority`, `action`, `type` from `"..tbl_sql ["sefi"].."` order by `occurred` desc, `priority` desc")

if rows > 0 then
local anentry, len = "", 0

for x = 0, rows - 1 do
local _, entry, occurred, prio, aaction, stype = VH:SQLFetch (x)
if x == 0 then len = string.len (occurred) end
anentry = anentry.." "..prezero (string.len (rows), (x + 1))..". [ P: "..prio.." ] [ A: "..aaction.." ] [ T: "..stype.." ] [ O: "..prezero (len, occurred).." ] "..repnmdcoutchars (entry).."\r\n"
end

commandanswer (nick, getlang (222)..":\r\n\r\n"..anentry)
else
commandanswer (nick, getlang (223))
end
end

----- ---- --- -- -

function addsefiexentry (nick, item)
local entry = repsqlchars (repnmdcinchars (item))
local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["sefiex"].."` where `exception` = '"..entry.."' limit 1")

if rows > 0 then
commandanswer (nick, string.format (getlang (287), item))
else
VH:SQLQuery ("insert into `"..tbl_sql ["sefiex"].."` (`exception`) values ('"..entry.."')")
commandanswer (nick, string.format (getlang (288), item))
end
end

----- ---- --- -- -

function delsefiexentry (nick, item)
local aitem = repsqlchars (repnmdcinchars (item))
local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["sefiex"].."` where `exception` = '"..aitem.."' limit 1")

if rows > 0 then
VH:SQLQuery ("delete from `"..tbl_sql ["sefiex"].."` where `exception` = '"..aitem.."' limit 1")
commandanswer (nick, string.format (getlang (289), item))
else
commandanswer (nick, string.format (getlang (290), item))
end
end

----- ---- --- -- -

function listsefiexentry (nick)
local _, rows = VH:SQLQuery ("select `exception`, `occurred` from `"..tbl_sql ["sefiex"].."` order by `occurred` desc")

if rows > 0 then
local anentry, len = "", 0

for x = 0, rows - 1 do
local _, entry, occurred = VH:SQLFetch (x)
if x == 0 then len = string.len (occurred) end
anentry = anentry.." "..prezero (string.len (rows), (x + 1))..". [ O: "..prezero (len, occurred).." ] "..repnmdcoutchars (entry).."\r\n"
end

commandanswer (nick, getlang (286)..":\r\n\r\n"..anentry)
else
commandanswer (nick, getlang (291))
end
end

----- ---- --- -- -

function addantientry (nick, item)
	local _, _, aitem, prio, aaction, flags = string.find (item, "^(.+) (%d) (%d+) (%d)$")
	prio, aaction, flags = tonumber (prio), tonumber (aaction), tonumber (flags)

	if (aaction < 0) or (aaction > 10) then -- invalid action
		commandanswer (nick, string.format (getlang (227), "0, 1, 2, 3, 4, 5, 6, 7, 8, 9 " .. getlang (70) .. " 10"))
	elseif (flags < 1) or (flags > 3) then -- invalid flag
		commandanswer (nick, string.format (getlang (228), "1, 2 " .. getlang (70) .. " 3"))
	elseif (prio < 0) or (prio > 9) then -- invalid priority
		commandanswer (nick, string.format (getlang (23), 0, 9))
	else
		local entry = repsqlchars (repnmdcinchars (aitem))
		local _, rows = VH:SQLQuery ("select `action` from `" .. tbl_sql ["anti"] .. "` where `antispam` = '" .. entry .. "' limit 1")

		if rows > 0 then
			VH:SQLQuery ("update `" .. tbl_sql ["anti"] .. "` set `priority` = " .. tostring (prio) .. ", `action` = " .. tostring (aaction) .. ", `flags` = " .. tostring (flags) .. " where `antispam` = '" .. entry .. "' limit 1")
			local note = 554

			if flags == 1 then
				note = 552
			elseif flags == 2 then
				note = 553
			end

			commandanswer (nick, string.format (getlang (note), aaction, prio, aitem))
		else
			VH:SQLQuery ("insert into `" .. tbl_sql ["anti"] .. "` (`antispam`, `priority`, `action`, `flags`) values ('" .. entry .. "', " .. tostring (prio) .. ", " .. tostring (aaction) .. ", " .. tostring (flags) .. ")")
			local note = 557

			if flags == 1 then
				note = 555
			elseif flags == 2 then
				note = 556
			end

			commandanswer (nick, string.format (getlang (note), aaction, prio, aitem))
		end
	end
end

----- ---- --- -- -

function delantientry (nick, item)
local aitem = repsqlchars (repnmdcinchars (item))
local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["anti"].."` where `antispam` = '"..aitem.."' limit 1")

if rows > 0 then
	VH:SQLQuery ("delete from `"..tbl_sql ["anti"].."` where `antispam` = '"..aitem.."' limit 1")
	commandanswer (nick, string.format (getlang (129), item))
else
	commandanswer (nick, string.format (getlang (130), item))
end
end

----- ---- --- -- -

function listantientry (nick)
local _, rows = VH:SQLQuery ("select `antispam`, `occurred`, `priority`, `action`, `flags` from `"..tbl_sql ["anti"].."` order by `occurred` desc, `priority` desc, `flags` desc")

if rows > 0 then
	local anentry, len = "", 0

	for x = 0, rows - 1 do
		local _, entry, occurred, prio, aaction, flags = VH:SQLFetch (x)
		if x == 0 then len = string.len (occurred) end
		anentry = anentry.." "..prezero (string.len (rows), (x + 1))..". [ P: "..prio.." ] [ A: "..aaction.." ] [ F: "..flags.." ] [ O: "..prezero (len, occurred).." ] "..repnmdcoutchars (entry).."\r\n"
	end

	commandanswer (nick, getlang (131)..":\r\n\r\n"..anentry)
else
	commandanswer (nick, getlang (132))
end
end

----- ---- --- -- -

function addexentry (nick, item)
local entry = repsqlchars (repnmdcinchars (item))
local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["antiex"].."` where `exception` = '"..entry.."' limit 1")

if rows > 0 then
commandanswer (nick, string.format (getlang (133), item))
else
VH:SQLQuery ("insert into `"..tbl_sql ["antiex"].."` (`exception`) values ('"..entry.."')")
commandanswer (nick, string.format (getlang (134), item))
end
end

----- ---- --- -- -

function delexentry (nick, item)
local aitem = repsqlchars (repnmdcinchars (item))
local _, rows = VH:SQLQuery ("select `occurred` from `"..tbl_sql ["antiex"].."` where `exception` = '"..aitem.."' limit 1")

if rows > 0 then
VH:SQLQuery ("delete from `"..tbl_sql ["antiex"].."` where `exception` = '"..aitem.."' limit 1")
commandanswer (nick, string.format (getlang (135), item))
else
commandanswer (nick, string.format (getlang (136), item))
end
end

----- ---- --- -- -

function listexentry (nick)
local _, rows = VH:SQLQuery ("select `exception`, `occurred` from `"..tbl_sql ["antiex"].."` order by `occurred` desc")

if rows > 0 then
local anentry, len = "", 0

for x = 0, rows - 1 do
local _, entry, occurred = VH:SQLFetch (x)
if x == 0 then len = string.len (occurred) end
anentry = anentry.." "..prezero (string.len (rows), (x + 1))..". [ O: "..prezero (len, occurred).." ] "..repnmdcoutchars (entry).."\r\n"
end

commandanswer (nick, getlang (137)..":\r\n\r\n"..anentry)
else
commandanswer (nick, getlang (138))
end
end

----- ---- --- -- -

function votekickuser (nick, user)
	if getstatus (user) == 1 then
		local class = getclass (user)

		if class < 3 then
			if not isprotected (user, getip (user)) then
				if table_voki [user] then -- add vote
					for _, val in pairs (table_voki [user]["u"]) do
						if val == nick then
							commandanswer (nick, getlang (967))
							return
						end
					end

					table_voki [user]["c"] = table_voki [user]["c"] + 1
					table.insert (table_voki [user]["u"], nick)
				else -- new vote
					table_voki [user] = {
						["c"] = 1,
						["u"] = {nick}
					}
				end

				maintoall (string.format (getlang (968), nick, table_voki [user]["c"], table_sets ["votekickcount"], class, user), 0, 10) -- notify all users

				if table_voki [user]["c"] >= table_sets ["votekickcount"] then -- kick user
					table_voki [user] = nil
					VH:KickUser (table_othsets ["sendfrom"], user, getlang (966))
				end
			else -- user or ip is protected
				commandanswer (nick, getlang (46))
			end
		else -- dont allow to kick operators
			commandanswer (nick, getlang (965))
		end
	else -- not in list
		commandanswer (nick, string.format (getlang (704), user))
	end
end

----- ---- --- -- -

function savetopic (owner, topic, ucls)
	if ucls < getconfig ("topic_mod_class") then return nil end
	table_othsets ["topicowner"] = owner
	table_othsets ["topicvalue"] = topic

	if table_sets ["statscollint"] > 0 then
		local tm = os.time () + table_sets ["srvtimediff"] -- current time
		VH:SQLQuery ("insert into `"..tbl_sql ["stat"].."` (`type`, `time`, `count`) values ('current_topic', "..tm..", "..repsqlchars (topic or "")..") on duplicate key update `time` = "..tm..", `count` = "..repsqlchars (topic or ""))
		VH:SQLQuery ("insert into `"..tbl_sql ["stat"].."` (`type`, `time`, `count`) values ('topic_owner', "..tm..", "..repsqlchars (owner or "")..") on duplicate key update `time` = "..tm..", `count` = "..repsqlchars (owner or ""))
	end

	if topic and (table_sets ["rolltopicint"] > 0) then -- rolling topic
		table_othsets ["rolltopicsecs"] = os.time ()
		table_othsets ["rolltopiclen"] = 1

		if table_othsets ["func_gettopic"] == true then
			VH:SetTopic (string.rep (" ", table_sets ["rolltopicspace"])..topic)
		else
			VH:SendDataToAll ("$HubName "..getconfig ("hub_name").." - "..string.rep (" ", table_sets ["rolltopicspace"])..topic.."|", 0, 10)
		end
	end
end

----- ---- --- -- -

function sendtopic (nick)
	if table_othsets ["func_gettopic"] == true then
		local topic = VH:GetTopic ()

		if topic and (topic ~= "") then
			if table_othsets ["topicowner"] and (table_sets ["showtopicowner"] == 1) then
				commandanswer (nick, string.format (getlang (2), table_othsets ["topicowner"], topic))
			else
				commandanswer (nick, string.format (getlang (1), topic))
			end
		else
			commandanswer (nick, getlang (42))
		end
	else -- old fashion way
		if not table_othsets ["topicvalue"] then
			commandanswer (nick, getlang (42))
		else
			if table_othsets ["topicowner"] and (table_sets ["showtopicowner"] == 1) then
				commandanswer (nick, string.format (getlang (2), table_othsets ["topicowner"], table_othsets ["topicvalue"]))
			else
				commandanswer (nick, string.format (getlang (1), table_othsets ["topicvalue"]))
			end
		end
	end
end

----- ---- --- -- -

function rolltopic ()
	table_othsets ["rolltopicsecs"] = os.time ()
	local newtopc = string.rep (" ", table_sets ["rolltopicspace"])..table_othsets ["topicvalue"]

	if table_othsets ["rolltopiclen"] >= (string.len (newtopc) + 1) then
		table_othsets ["rolltopiclen"] = 1 -- dont change
	end

	newtopc = string.sub (newtopc, table_othsets ["rolltopiclen"] + 1, -1)..string.sub (newtopc, 1, table_othsets ["rolltopiclen"])
	table_othsets ["rolltopiclen"] = table_othsets ["rolltopiclen"] + 1 -- steps to move

	if table_othsets ["func_gettopic"] == true then
		VH:SetTopic (newtopc)
	else
		VH:SendDataToAll ("$HubName "..getconfig ("hub_name").." - "..newtopc.."|", 0, 10)
	end
end

----- ---- --- -- -

function namereg (nick, line, cls)
local _, _, oldn = string.find (line, "^(%S+) %S+$")

if not getregclass (oldn) then -- check if physically registered
commandanswer (nick, string.format (getlang (487), oldn))
else
local _, _, newn = string.find (line, "^%S+ (%S+)$")
newn = repnickchars (newn)

if getstatus (oldn) == 1 then -- notify and disconnect user if hes online
pmtouser (oldn, table_othsets ["botnick"], string.format (getlang (488), newn))
VH:CloseConnection (oldn)
end

local rnewn = repsqlchars (newn)
local roldn = repsqlchars (oldn)
VH:SQLQuery ("update `reglist` set `nick` = '"..rnewn.."' where `nick` = '"..roldn.."' limit 1")
VH:SQLQuery ("update `"..tbl_sql ["wm"].."` set `nick` = '"..rnewn.."' where `nick` = '"..roldn.."' limit 1")
VH:SQLQuery ("update `"..tbl_sql ["cust"].."` set `nick` = '"..rnewn.."' where `nick` = '"..roldn.."' limit 1")
VH:SQLQuery ("update `"..tbl_sql ["auth"].."` set `nick` = '"..rnewn.."' where `nick` = '"..roldn.."'") -- no limit
VH:SQLQuery ("update `"..tbl_sql ["chran"].."` set `nick` = '"..rnewn.."' where `nick` = '"..roldn.."' limit 1")
VH:SQLQuery ("update `"..tbl_sql ["opran"].."` set `nick` = '"..rnewn.."' where `nick` = '"..roldn.."' limit 1")
VH:SQLQuery ("update `"..tbl_sql ["shran"].."` set `nick` = '"..rnewn.."' where `nick` = '"..roldn.."' limit 1")
VH:SQLQuery ("update `"..tbl_sql ["off"].."` set `from` = '"..rnewn.."' where `from` = '"..roldn.."'") -- no limit
VH:SQLQuery ("update `"..tbl_sql ["news"].."` set `by` = '"..rnewn.."' where `by` = '"..roldn.."'") -- no limit
VH:SQLQuery ("update `"..tbl_sql ["rel"].."` set `by` = '"..rnewn.."' where `by` = '"..roldn.."'") -- no limit
VH:SQLQuery ("update `"..tbl_sql ["mchist"].."` set `realnick` = '"..rnewn.."' where `realnick` = '"..roldn.."'") -- no limit
VH:SQLQuery ("update `"..tbl_sql ["ophist"].."` set `nick` = '"..rnewn.."' where `nick` = '"..roldn.."'") -- no limit
commandanswer (nick, string.format (getlang (489), oldn, newn))
opsnotify (table_sets ["classnotireg"], string.format (getlang (490), nick, cls, oldn, newn))
end
end

----- ---- --- -- -

function findreglist (nick, usr)
local _, rows = VH:SQLQuery ("select `nick`, `class` from `reglist` where `nick` like '%"..repsqlchars (usr).."%' order by `class` asc, `nick` asc")

if rows > 0 then
	local list = ""

	for x = 0, rows - 1 do
		local _, n, c = VH:SQLFetch (x)
		list = list.." "..prezero (string.len (rows), (x + 1))..". "..n.." @ "..c.."\r\n"
	end

	commandanswer (nick, string.format (getlang (688), usr)..":\r\n\r\n"..list)
else
	commandanswer (nick, getlang (121))
end
end

----- ---- --- -- -

function statsreglist (nick)
	local _, rows = VH:SQLQuery ("select `class` from `reglist` order by `class` asc")

	if rows > 0 then
		local t = {}

		for x = 0, rows - 1 do
			local _, cls = VH:SQLFetch (x)
			t [cls] = (t [cls] or 0) + 1
		end

		local tmp, list, tot = {}, "", 0

		for k, v in pairs (t) do
			table.insert (tmp, {key = k, val = v})
		end

		table.sort (tmp, function (a, b) return a.val > b.val end)

		for _, v in pairs (tmp) do
			list = list.." "..string.format (getlang (689), v.key, v.val).."\r\n"
			tot = tot + v.val
		end

		commandanswer (nick, getlang (687)..":\r\n\r\n"..list.."\r\n "..string.format (getlang (519), tot).."\r\n")
	else
		commandanswer (nick, getlang (690))
	end
end

----- ---- --- -- -

function sendreglist (nick, line)
local _, class, sfrom, hmany = 0, 0, 0, 0

if string.find (line, "^%-%d %d+x%d+$") then -- lol: %d != -1
_, _, class, sfrom, hmany = string.find (line, "^(%-%d) (%d+)x(%d+)$")
else
_, _, class, sfrom, hmany = string.find (line, "^(%d+) (%d+)x(%d+)$")
end

class = tonumber (class)
sfrom = tonumber (sfrom)
hmany = tonumber (hmany)
if hmany <= 1 then hmany = 1 end

if (class == 10) or (class == 5) or (class == 4) or (class == 3) or (class == 2) or (class == 1) or (class == 0) or (class == -1) then
local _, trows = VH:SQLQuery ("select `class` from `reglist` where `class` = "..class)

if trows > 0 then
if (sfrom <= 0) or (sfrom > trows) then
commandanswer (nick, string.format (getlang (140), sfrom, trows, class))
else
local _, rows = VH:SQLQuery ("select `nick`, `reg_date`, `pwd_change`, `login_last`, `enabled` from `reglist` where `class` = "..class.." order by `login_last` desc limit "..(sfrom - 1)..", "..hmany)

if rows > 0 then
local areg = ""

for x = 0, rows - 1 do
local _, user, rgdate, pwdc, lastlog, enacc = VH:SQLFetch (x)
areg = areg.." "..prezero (string.len (rows), (x + 1))..". [ R: "..fromunixtime (rgdate, true, table_sets ["longdateformat"]).." ] [ L: "..fromunixtime (lastlog, false, table_sets ["longdateformat"]).." ] [ P: "..pwdc.." ] [ E: "..enacc.." ] [ O: "..getstatus (user).." ] "..user.."\r\n"
end

commandanswer (nick, string.format (getlang (141), rows, trows, class, sfrom)..":\r\n\r\n"..areg)
end
end

else
commandanswer (nick, string.format (getlang (142), class))
end

else
commandanswer (nick, string.format (getlang (143), "-1, 0, 1, 2, 3, 4, 5 "..getlang (70).." 10"))
end
end

----- ---- --- -- -

function delledouser (nick)
local usr = repsqlchars (nick)
VH:SQLQuery ("delete from `"..tbl_sql ["wm"].."` where `nick` = '"..usr.."' limit 1")
VH:SQLQuery ("delete from `"..tbl_sql ["cust"].."` where `nick` = '"..usr.."' limit 1")
VH:SQLQuery ("delete from `"..tbl_sql ["auth"].."` where `nick` = '"..usr.."'")
VH:SQLQuery ("delete from `"..tbl_sql ["off"].."` where `from` = '"..usr.."'")
VH:SQLQuery ("delete from `"..tbl_sql ["chran"].."` where `nick` = '"..usr.."' limit 1")
VH:SQLQuery ("delete from `"..tbl_sql ["opran"].."` where `nick` = '"..usr.."' limit 1")
VH:SQLQuery ("delete from `"..tbl_sql ["shran"].."` where `nick` = '"..usr.."' limit 1")
end

----- ---- --- -- -

function sendsay (nick, message, ucl)
	local _, _, user, message = string.find (message, "^(%S*) (.*)$")

	if ((user == table_sets ["ledobotnick"]) or (user == table_othsets ["botnick"]) or (user == table_othsets ["opchatnick"]) or (user == nick)) or (getclass (user) < ucl) then
		opsnotify (table_sets ["classnotisay"], string.format (getlang (144), nick, ucl, user, message))
		VH:SendDataToAll ("<"..user.."> "..message.."|", 0, 10)
		addmchistoryline (user, nick, message)
	else
		opsnotify (table_sets ["classnotisay"], string.format (getlang (145), nick, ucl, user, message))
		commandanswer (nick, getlang (146))
	end
end

----- ---- --- -- -

function donotifyregnew (nick, ucls, line)
if ucls < getconfig ("min_class_register") then return nil end -- check verlihub configuration
local _, user, class = 0, "", 0

if string.find (line, "^%s*%S+%s+%S+%s*.*$") then
_, _, user, class = string.find (line, "^%s*(%S+)%s+(%S+)%s*.*$")
class = tonumber (class) or 1 -- default class when invalid number

if (class == 0) or ((class >= 6) and (class <= 9)) then
class = 1 -- default class when 0 is used
end

else
_, _, user = string.find (line, "^%s*(%S+)%s*.*$")
class = 1 -- default class when not specified
end

if (ucls < 10) and (class > ucls - getconfig ("classdif_reg")) then return nil end -- check verlihub configuration

if not getregclass (user) then -- only if not registered
opsnotify (table_sets ["classnotireg"], string.format (getlang (446), nick, ucls, class, user))
oprankaccept (nick, ucls)
end
end

----- ---- --- -- -

function donotifyregdel (nick, ucls, line)
	if ucls < getconfig ("min_class_register") then return nil end -- check verlihub configuration
	local _, _, user = string.find (line, "^%s*(%S+)%s*.*$")
	local class = getregclass (user)
	if (not class) or ((ucls < 10) and (class > ucls - getconfig ("classdif_reg"))) then return nil end -- only if registered
	opsnotify (table_sets ["classnotireg"], string.format (getlang (447), nick, ucls, class, user))
	oprankaccept (nick, ucls)
	delledouser (user) -- remove user from ledokol tables aswell
end

----- ---- --- -- -

function donotifyregclass (nick, ucls, line)
	if ucls < getconfig ("min_class_register") then return nil end -- check verlihub configuration
	local _, _, user, class = string.find (line, "^%s*(%S+)%s+(%S+)%s*.*$")
	class = tonumber (class) or 0
	local uclass = getregclass (user)
	if (not uclass) or ((ucls < 10) and (class > ucls - getconfig ("classdif_reg"))) then return nil end -- only if registered
	if uclass == class then return nil end -- only if different

	if class < 3 then -- remove user from op ranks list if new class is lower than op class
		VH:SQLQuery ("delete from `"..tbl_sql ["opran"].."` where `nick` = '"..repsqlchars (user).."' limit 1")
	end

	opsnotify (table_sets ["classnotireg"], string.format (getlang (448), nick, ucls, uclass, class, user))
	oprankaccept (nick, ucls)
end

----- ---- --- -- -

--[[

function donotifyban (nick, ucls, line)
	local _, _, cmd, user, reason = string.find (line, "^(%S*)%s+(%S+)%s*(.*)$")

	if not reason or string.len (reason) == 0 then
		local _, rows = VH:SQLQuery ("select `reason` from `kicklist` where `ip` = '" .. repsqlchars (user) .. "' order by `time` desc limit 1")

		if rows > 0 then
			_, reason = VH:SQLFetch (0)
		end
	end

	oprankaccept (nick, ucls)
	local _, bantime = string.find (cmd, "_")

	if not reason or string.len (reason) == 0 then -- without reason
		reason = getlang (888)
	end

	if not bantime then
		opsnotify (table_sets ["classnotiban"], string.format (getlang (104), user, nick, reason))
	else
		bantime = string.sub (cmd, bantime + 1, -1) -- i dont understand this: !ban_ user test => "_" gets banned with reason "user test"
		opsnotify (table_sets ["classnotiban"], string.format (getlang (208), user, bantime, nick, reason))
	end
end

]]--

----- ---- --- -- -

--[[

function donotifyunban (nick, ucls, line)
	local _, _, user, reason = string.find (line, "^%S*%s+(%S+)%s*(.*)$")
	local repusr = repsqlchars (user)
	local _, rows = VH:SQLQuery ("select `ban_type` from `banlist` where `ip` = '" .. repusr .. "' or `nick` = '" .. repusr .. "' or `host` = '" .. repusr .. "' or `range_fr` = '" .. repusr .. "' or `range_to` = '" .. repusr .. "' or `share_size` = '" .. repusr .. "' limit 1")

	if rows > 0 then
		if not reason or string.len (reason) == 0 then
			reason = getlang (888)
		end

		opsnotify (table_sets ["classnotiban"], string.format (getlang (150), user, nick, reason))
		oprankaccept (nick, ucls)
	end
end

]]--

----- ---- --- -- -

function donotifyconfig (nick, line, cls)
	local _, _, var, val = string.find (line, "^%s*(%S+) (.*)$")
	local oval = getconfig (var)
	--local _, rows = VH:SQLQuery ("select `var` from `SetupList` where `file` = 'config' and `var` = '"..repsqlchars (var).."' limit 1")

	if oval then
		opsnotify (table_sets ["classnoticonfig"], string.format (getlang (50), nick, cls, var, oval, val))
		oprankaccept (nick, cls)
	end
end

----- ---- --- -- -

function donotifyextconfig (nick, line, cls)
	local _, _, cfg, var, val = string.find (line, "^%s*%[(%S+)%]%s+(%S+) (.*)$")
	opsnotify (table_sets ["classnoticonfig"], string.format (getlang (50), nick, cls, var.." @ "..cfg, (getextconfig (cfg, var) or ""), val))
	oprankaccept (nick, cls)
end

----- ---- --- -- -

function donotifycmd (nick, cmd, limited, cls)
if table_sets ["classnoticom"] == 11 then return nil end
local _, rows = VH:SQLQuery ("select `exception` from `"..tbl_sql ["cmdex"].."`")

if rows > 0 then
	for x = 0, rows - 1 do
		local _, entry = VH:SQLFetch (x)

		if string.find (repnmdcinchars (cmd), entry) then
			VH:SQLQuery ("update `"..tbl_sql ["cmdex"].."` set `occurred` = `occurred` + 1 where `exception` = '"..repsqlchars (entry).."' limit 1")
			return nil
		end
	end
end

local cmsg = string.format (getlang (103), nick, cls, cmd)

if limited == 0 then
	VH:SendPMToAll ("["..prezero (2, table_sets ["classnoticom"]).."] "..cmsg, table_othsets ["feednick"], table_sets ["classnoticom"], 10)
else
	VH:SendPMToAll ("["..prezero (2, limited).."] "..cmsg, table_othsets ["feednick"], limited, 10)
end

if (table_sets ["histbotmsg"] == 1) and (table_sets ["addledobot"] == 0) and (table_sets ["useextrafeed"] == 0) then
	addophistoryline (table_othsets ["opchatnick"], cmsg)
end
end

----- ---- --- -- -

function savecmdlog (nick, cls, cmd, isop)
if table_sets ["enablecmdlog"] == 0 then return nil end
if (table_sets ["enablecmdlog"] == 1) and (isop == false) then return nil end
local ucmd = cmd

if string.find (ucmd, "^."..table_cmnds ["offmsg"].." %S+ .+$") then -- skip sensitive data
	local _, _, par = string.find (ucmd, "^."..table_cmnds ["offmsg"].." (%S+) .+$")
	ucmd = string.sub (getconfig ("cmd_start_user"), 1, 1)..table_cmnds ["offmsg"].." "..par.." <"..getlang (44)..">"

elseif string.find (ucmd, "^"..table_othsets ["ustrig"].."msgsend%s+%S+ .+$") then
	local _, _, par = string.find (ucmd, "^"..table_othsets ["ustrig"].."msgsend%s+(%S+) .+$")
	ucmd = string.sub (getconfig ("cmd_start_user"), 1, 1).."msgsend "..par.." <"..getlang (44)..">"

elseif string.find (ucmd, "^"..table_othsets ["optrig"].."rpass%s+%S+ .+$") then
	local _, _, par = string.find (ucmd, "^"..table_othsets ["optrig"].."rpass%s+(%S+) .+$")
	ucmd = string.sub (getconfig ("cmd_start_op"), 1, 1).."rpass "..par.." <"..getlang (784)..">"

elseif string.find (ucmd, "^"..table_othsets ["optrig"].."rpasswd%s+%S+ .+$") then
	local _, _, par = string.find (ucmd, "^"..table_othsets ["optrig"].."rpasswd%s+(%S+) .+$")
	ucmd = string.sub (getconfig ("cmd_start_op"), 1, 1).."rpasswd "..par.." <"..getlang (784)..">"

elseif string.find (ucmd, "^"..table_othsets ["optrig"].."regpass%s+%S+ .+$") then
	local _, _, par = string.find (ucmd, "^"..table_othsets ["optrig"].."regpass%s+(%S+) .+$")
	ucmd = string.sub (getconfig ("cmd_start_op"), 1, 1).."regpass "..par.." <"..getlang (784)..">"

elseif string.find (ucmd, "^"..table_othsets ["optrig"].."regpasswd%s+%S+ .+$") then
	local _, _, par = string.find (ucmd, "^"..table_othsets ["optrig"].."regpasswd%s+(%S+) .+$")
	ucmd = string.sub (getconfig ("cmd_start_op"), 1, 1).."regpasswd "..par.." <"..getlang (784)..">"

elseif string.find (ucmd, "^"..table_othsets ["ustrig"].."passwd%s+.+$") then
	ucmd = string.sub (getconfig ("cmd_start_user"), 1, 1).."passwd <"..getlang (784)..">"

elseif string.find (ucmd, "^"..table_othsets ["ustrig"].."regme%s+.+$") then
	ucmd = string.sub (getconfig ("cmd_start_user"), 1, 1).."regme <"..getlang (784)..">"
end

VH:SQLQuery ("insert into `"..tbl_sql ["clog"].."` (`time`, `nick`, `class`, `command`) values ("..(os.time () + table_sets ["srvtimediff"])..", '"..repsqlchars (nick).."', "..cls..", '"..repsqlchars (ucmd).."')")
end

----- ---- --- -- -

function sendlivecc (nick)
if table_othsets ["func_getcc"] == false then
	commandanswer (nick, string.format (getlang (514), "Verlihub 0.9.8e"))
else
	local ccs, cnt = {}, 0

	for usr in string.gmatch (getnicklist (), "([^$]+)%$%$") do
		if isbot (usr) == false then
			local cc = getcc (usr)

			if cc then
				if cc == "--" then cc = "??" end -- small change
				ccs [cc] = (ccs [cc] or 0) + 1
				cnt = cnt + 1
			end
		end
	end

	if cnt > 0 then
		commandanswer (nick, getlang (512)..":\r\n\r\n"..genccstats (ccs, cnt).."\r\n\t"..string.format (getlang (519), cnt).."\r\n")
	else -- empty
		commandanswer (nick, getlang (517))
	end
end
end

----- ---- --- -- -

function sendlivecity (nick, cc)
	if (table_othsets ["func_getcc"] == false) or (table_othsets ["func_getusercity"] == false) then
		commandanswer (nick, string.format (getlang (514), "Verlihub 1.0"))
	else
		local list, count, ucc = {}, 0, string.upper (cc)

		for user in string.gmatch (getnicklist (), "([^$]+)%$%$") do
			if isbot (user) == false then
				local code = getcc (user)

				if code and (code == ucc) then
					local city = getusercity (user)

					if city then
						if city == "--" then city = "??" end -- small change
						list [city] = (list [city] or 0) + 1
						count = count + 1
					end
				end
			end
		end

		if count > 0 then
			commandanswer (nick, string.format (getlang (924), ucc, cc_names [ucc] or getlang (516)) .. ":\r\n\r\n" .. gencitystats (list, count) .. "\r\n\t" .. string.format (getlang (519), count) .. "\r\n")
		else -- empty
			commandanswer (nick, string.format (getlang (925), ucc, cc_names [ucc] or getlang (516)))
		end
	end
end

----- ---- --- -- -

function sendhistcc (nick)
if table_othsets ["func_getcc"] == false then
	commandanswer (nick, string.format (getlang (514), "Verlihub 0.9.8e"))
else
	local _, rows = VH:SQLQuery ("select `cc` from `"..tbl_sql ["ccstat"].."`")

	if rows > 0 then
		local ccs = {}

		for x = 0, rows - 1 do
			local _, cc = VH:SQLFetch (x)
			if cc == "--" then cc = "??" end -- small change
			ccs [cc] = (ccs [cc] or 0) + 1
		end

		commandanswer (nick, getlang (513)..":\r\n\r\n"..genccstats (ccs, rows).."\r\n\t"..string.format (getlang (515), fromunixtime ((getledoconf ("date_ccstats") or os.time () + table_sets ["srvtimediff"]), true), rows).."\r\n")
	else -- empty
		commandanswer (nick, getlang (518))
	end
end
end

----- ---- --- -- -

function genccstats (tbl, cnt)
local tmp = {}

for k, v in pairs (tbl) do
	table.insert (tmp, {key = k, val = v})
end

table.sort (tmp, function (a, b) return a.val > b.val end) -- sorting order
local ilen = string.len (tmp [1].val) -- first highest value
local stats = ""

for _, v in pairs (tmp) do
	stats = stats.."\t"..prezero (ilen, v.val).."   ~   "..prezero (5, string.format ("%."..(2).."f", (v.val / cnt * 100))).."%   ~   [ "..v.key.."   ~   "..(cc_names [v.key] or getlang (516)).." ]\r\n"
end

return stats
end

----- ---- --- -- -

function gencitystats (list, count)
	local temp = {}

	for k, v in pairs (list) do
		table.insert (temp, {key = k, val = v})
	end

	table.sort (temp, function (a, b) return a.val > b.val end) -- sorting order
	local num = string.len (temp [1].val) -- first highest value
	local stats = ""

	for _, v in pairs (temp) do
		stats = stats .. "\t" .. prezero (num, v.val) .. "   ~   " .. prezero (5, string.format ("%." .. 2 .. "f", (v.val / count * 100))) .. "%   ~   [ " .. v.key .. " ]\r\n"
	end

	return stats
end

----- ---- --- -- -

function installusermenu (usr)
	if table_sets ["instusermenu"] == 0 then
		return
	end

	local ucl = getclass (usr)

	if ucl < 0 then
		return
	end

-- antispam

if ucl >= table_sets ["mincommandclass"] then
	sopmenitm (usr, getlang (109) .. "\\" .. getlang (156), table_cmnds ["antiadd"] .. " %[line:<" .. getlang (193) .. ">] %[line:<" .. getlang (30) .. ">] %[line:<" .. getlang (194) .. ">] %[line:<" .. getlang (126) .. ">]")
sopmenitm (usr, getlang (109).."\\"..getlang (131), table_cmnds ["antilist"])
smensep (usr)
sopmenitm (usr, getlang (109).."\\"..getlang (158), table_cmnds ["antidel"].." %[line:<"..getlang (193)..">]")
smensep (usr)
sopmenitm (usr, getlang (109).."\\"..getlang (159), table_cmnds ["antiexadd"].." %[line:<"..getlang (193)..">]")
sopmenitm (usr, getlang (109).."\\"..getlang (137), table_cmnds ["antiexlist"])
smensep (usr)
sopmenitm (usr, getlang (109).."\\"..getlang (160), table_cmnds ["antiexdel"].." %[line:<"..getlang (193)..">]")
end

-- search filter

if ucl >= table_sets ["mincommandclass"] then
sopmenitm (usr, getlang (663).."\\"..getlang (225), table_cmnds ["sefiadd"].." %[line:<"..getlang (193)..">] %[line:<"..getlang (30)..">] %[line:<"..getlang (194)..">] %[line:<"..getlang (48)..">]")
sopmenitm (usr, getlang (663).."\\"..getlang (222), table_cmnds ["sefilist"])
smensep (usr)
sopmenitm (usr, getlang (663).."\\"..getlang (226), table_cmnds ["sefidel"].." %[line:<"..getlang (193)..">]")
smensep (usr)
sopmenitm (usr, getlang (663).."\\"..getlang (284), table_cmnds ["sefiexadd"].." %[line:<"..getlang (193)..">]")
sopmenitm (usr, getlang (663).."\\"..getlang (286), table_cmnds ["sefiexlist"])
smensep (usr)
sopmenitm (usr, getlang (663).."\\"..getlang (285), table_cmnds ["sefiexdel"].." %[line:<"..getlang (193)..">]")
end

	-- myinfo check
	if ucl >= table_sets ["mincommandclass"] then
		sopmenitm (usr, getlang (664).."\\"..getlang (161), table_cmnds ["myinfadd"].." %[line:<"..getlang (48)..">] %[line:<"..getlang (193)..">]") -- %[line:["..getlang (318).."]]
		sopmenitm (usr, getlang (664).."\\"..getlang (163), table_cmnds ["myinflist"].." %[line:<"..getlang (48)..">]")
		smensep (usr)
		sopmenitm (usr, getlang (664).."\\"..getlang (162), table_cmnds ["myinfdel"].." %[line:<"..getlang (48)..">] %[line:<"..getlang (193)..">]")
	end

-- protection list

if ucl >= table_sets ["mincommandclass"] then
sopmenitm (usr, getlang (607).."\\"..getlang (124), table_cmnds ["protadd"].." %[line:<"..getlang (193)..">]")
sopmenitm (usr, getlang (607).."\\"..getlang (607), table_cmnds ["protlist"])
smensep (usr)
sopmenitm (usr, getlang (607).."\\"..getlang (125), table_cmnds ["protdel"].." %[line:<"..getlang (193)..">]")
end

-- authorization

if ucl >= table_sets ["mincommandclass"] then
sopmenitm (usr, getlang (665).."\\"..getlang (241), table_cmnds ["authadd"].." %[line:<"..getlang (178)..">] %[line:<"..getlang (193)..">]")
sopmenitm (usr, getlang (665).."\\"..getlang (785), table_cmnds ["authmod"].." %[line:<"..getlang (185)..">] %[line:<"..getlang (193)..">]")
sopmenitm (usr, getlang (665).."\\"..getlang (239), table_cmnds ["authlist"])
smensep (usr)
sopmenitm (usr, getlang (665).."\\"..getlang (242), table_cmnds ["authdel"].." %[line:<"..getlang (185)..">]")
end

-- ranks

if ucl >= table_sets ["chatrankclass"] then
susmenitm (usr, getlang (666).."\\"..string.format (getlang (116), table_sets ["ranklimit"]), table_cmnds ["chatranks"])
susmenitm (usr, getlang (666).."\\"..getlang (182), table_cmnds ["mychatrank"])
smensep (usr)
end

if ucl >= table_sets ["sharerankclass"] then
susmenitm (usr, getlang (666).."\\"..string.format (getlang (324), table_sets ["ranklimit"]), table_cmnds ["shareranks"])
susmenitm (usr, getlang (666).."\\"..getlang (323), table_cmnds ["mysharerank"])
smensep (usr)
end

if ucl >= table_sets ["oprankclass"] then
susmenitm (usr, getlang (666).."\\"..string.format (getlang (118), table_sets ["ranklimit"]), table_cmnds ["opranks"])

if ucl >= 3 then
sopmenitm (usr, getlang (666).."\\"..getlang (175), table_cmnds ["myoprank"])
end

smensep (usr)
end

if ucl >= table_sets ["searrankclass"] then
susmenitm (usr, getlang (666).."\\"..string.format (getlang (694), table_sets ["ranklimit"]), table_cmnds ["searranks"])
smensep (usr)
end

if ucl >= table_sets ["wordrankclass"] then
susmenitm (usr, getlang (666).."\\"..string.format (getlang (439), table_sets ["ranklimit"]), table_cmnds ["wordranks"])
smensep (usr)
end

	if ucl >= table_sets ["ccstatsclass"] then
		susmenitm (usr, getlang (666) .. "\\" .. getlang (512), table_cmnds ["cclive"])
		susmenitm (usr, getlang (666) .. "\\" .. getlang (923), table_cmnds ["citylive"] .. " %[line:<" .. getlang (789) .. ">]")
		susmenitm (usr, getlang (666) .. "\\" .. getlang (513), table_cmnds ["cchist"])
	end

if ucl >= table_sets ["mincommandclass"] then
smensep (usr)
sopmenitm (usr, getlang (666).."\\"..getlang (216), table_cmnds ["ranexadd"].." %[line:<"..getlang (178)..">]")
sopmenitm (usr, getlang (666).."\\"..getlang (214), table_cmnds ["ranexlist"])
smensep (usr)
sopmenitm (usr, getlang (666).."\\"..getlang (217), table_cmnds ["ranexdel"].." %[line:<"..getlang (178)..">]")
smensep (usr)
sopmenitm (usr, getlang (666).."\\"..getlang (166), table_cmnds ["randel"].." %[line:<"..getlang (48)..">] %[line:<"..getlang (205)..">]")
sopmenitm (usr, getlang (666).."\\"..getlang (372), table_cmnds ["ranclean"].." %[line:<"..getlang (48)..">] %[line:<"..getlang (373)..">]")
end

-- welcome messages

if ucl >= table_sets ["mincommandclass"] then
sopmenitm (usr, getlang (667).."\\"..getlang (484), table_cmnds ["wmforce"].." %[line:<"..getlang (48)..">] %[line:<"..getlang (178)..">] %[line:<"..getlang (44)..">]")
--sopmenitm (usr, getlang (667).."\\"..getlang (484), table_cmnds ["wmforce"].." %[line:<"..getlang (48)..">] %[line:<"..getlang (178)..">]")
sopmenitm (usr, getlang (667).."\\"..getlang (252), table_cmnds ["wmlist"])
smensep (usr)
sopmenitm (usr, getlang (667).."\\"..getlang (253), table_cmnds ["wmdel"].." %[line:<"..getlang (178)..">]")
end

if ucl >= table_sets ["welcomeclass"] then
if ucl >= table_sets ["mincommandclass"] then
smensep (usr)
end

susmenitm (usr, getlang (667).."\\"..getlang (249), table_cmnds ["wmset"].." %[line:<"..getlang (48)..">] %[line:<"..getlang (44)..">]")
--susmenitm (usr, getlang (667).."\\"..getlang (249), table_cmnds ["wmset"].." %[line:<"..getlang (48)..">]")
susmenitm (usr, getlang (667).."\\"..getlang (251), table_cmnds ["wmshow"])
end

-- chatrooms

if ucl >= table_sets ["mincommandclass"] then
sopmenitm (usr, getlang (668).."\\"..getlang (266), table_cmnds ["chatadd"].." %[line:<"..getlang (178)..">] %[line:<"..getlang (269)..">] %[line:<"..getlang (270)..">] %[line:<"..getlang (271)..">] %[line:<"..getlang (789)..">]")
sopmenitm (usr, getlang (668).."\\"..getlang (267), table_cmnds ["chatlist"])
smensep (usr)
sopmenitm (usr, getlang (668).."\\"..getlang (268), table_cmnds ["chatdel"].." %[line:<"..getlang (178)..">]")
end

-- reminders

if ucl >= table_sets ["mincommandclass"] then
sopmenitm (usr, getlang (669).."\\"..getlang (383), table_cmnds ["remadd"].." %[line:<"..getlang (185)..">] %[line:<"..getlang (380)..">] %[line:<"..getlang (270)..">] %[line:<"..getlang (271)..">] %[line:<"..getlang (381)..">] %[line:<"..getlang (382)..">]")
sopmenitm (usr, getlang (669).."\\"..getlang (385), table_cmnds ["remlist"])
sopmenitm (usr, getlang (669).."\\"..getlang (509), table_cmnds ["remshow"].." %[line:<"..getlang (185)..">]")
smensep (usr)
sopmenitm (usr, getlang (669).."\\"..getlang (384), table_cmnds ["remdel"].." %[line:<"..getlang (185)..">]")
end

-- hub news

if ucl >= table_sets ["mincommandclass"] then
sopmenitm (usr, getlang (670).."\\"..getlang (453), table_cmnds ["newsadd"].." %[line:<"..getlang (120)..">]")
smensep (usr)
sopmenitm (usr, getlang (670).."\\"..getlang (454), table_cmnds ["newsdel"].." %[line:<"..getlang (102)..">]")
end

if ucl >= table_sets ["newsclass"] then
if ucl >= table_sets ["mincommandclass"] then
smensep (usr)
end

susmenitm (usr, getlang (670).."\\"..getlang (455), table_cmnds ["hubnews"].." %[line:<"..getlang (209)..">]")
end

-- chat replacer

	if ucl >= table_sets ["mincommandclass"] then
		sopmenitm (usr, getlang (815).."\\"..getlang (811), table_cmnds ["repladd"].." \"%[line:<"..getlang (193)..">]\" \"%[line:<"..getlang (810)..">]\" %[line:<"..getlang (271)..">]")
		sopmenitm (usr, getlang (815).."\\"..getlang (801), table_cmnds ["repllist"])
		smensep (usr)
		sopmenitm (usr, getlang (815).."\\"..getlang (812), table_cmnds ["repldel"].." %[line:<"..getlang (185)..">]")
		smensep (usr)
		sopmenitm (usr, getlang (815).."\\"..getlang (813), table_cmnds ["replexadd"].." %[line:<"..getlang (178).." "..getlang (197).." "..getlang (243)..">]")
		sopmenitm (usr, getlang (815).."\\"..getlang (808), table_cmnds ["replexlist"])
		smensep (usr)
		sopmenitm (usr, getlang (815).."\\"..getlang (814), table_cmnds ["replexdel"].." %[line:<"..getlang (178).." "..getlang (197).." "..getlang (243)..">]")
	end

-- chat responder

	if ucl >= table_sets ["mincommandclass"] then
		sopmenitm (usr, getlang (671).."\\"..getlang (401), table_cmnds ["respadd"].." \"%[line:<"..getlang (193)..">]\" \"%[line:<"..getlang (400)..">]\" %[line:<"..getlang (271)..">]")
		sopmenitm (usr, getlang (671).."\\"..getlang (403), table_cmnds ["resplist"])
		smensep (usr)
		sopmenitm (usr, getlang (671).."\\"..getlang (402), table_cmnds ["respdel"].." %[line:<"..getlang (185)..">]")
		smensep (usr)
		sopmenitm (usr, getlang (671).."\\"..getlang (412), table_cmnds ["respexadd"].." %[line:<"..getlang (178).." "..getlang (197).." "..getlang (243)..">]")
		sopmenitm (usr, getlang (671).."\\"..getlang (414), table_cmnds ["respexlist"])
		smensep (usr)
		sopmenitm (usr, getlang (671).."\\"..getlang (413), table_cmnds ["respexdel"].." %[line:<"..getlang (178).." "..getlang (197).." "..getlang (243)..">]")
	end

-- releases

if ucl >= table_sets ["relmodclass"] then
susmenitm (usr, getlang (672).."\\"..getlang (473), table_cmnds ["reladd"].." \"%[line:<"..getlang (470)..">]\" \"%[line:<"..getlang (471)..">]\" %[line:<"..getlang (472)..">]")
--susmenitm (usr, getlang (672).."\\"..getlang (473), table_cmnds ["reladd"].." \"%[line:<"..getlang (470)..">]\" \"%[line:<"..getlang (471)..">]\"")
smensep (usr)
susmenitm (usr, getlang (672).."\\"..getlang (474), table_cmnds ["reldel"].." %[line:<"..getlang (48)..">] %[line:<"..getlang (470)..">]")
end

if ucl >= table_sets ["minusrcommandclass"] then
if ucl >= table_sets ["relmodclass"] then
smensep (usr)
end

susmenitm (usr, getlang (672).."\\"..getlang (475), table_cmnds ["rellist"].." %[line:<"..getlang (48)..">] %[line:<"..getlang (209)..">] %[line:<"..getlang (471).." "..getlang (197).." "..getlang (310)..">]")
--susmenitm (usr, getlang (672).."\\"..getlang (475), table_cmnds ["rellist"].." %[line:<"..getlang (48)..">] %[line:<"..getlang (209)..">]")
susmenitm (usr, getlang (672).."\\"..getlang (476), table_cmnds ["relfind"].." %[line:<"..getlang (470)..">]")
end

-- offline messenger

if ucl >= table_sets ["mincommandclass"] then
sopmenitm (usr, getlang (673).."\\"..getlang (168), table_cmnds ["offlist"])
smensep (usr)
sopmenitm (usr, getlang (673).."\\"..getlang (169), table_cmnds ["offdel"].." %[line:<"..getlang (102)..">]")
sopmenitm (usr, getlang (673).."\\"..getlang (170), table_cmnds ["offclean"])
end

if ucl >= table_sets ["offmsgclass"] then
if ucl >= table_sets ["mincommandclass"] then
smensep (usr)
end

susmenitm (usr, getlang (673).."\\"..getlang (186), table_cmnds ["offmsg"].." %[line:<"..getlang (178)..">] %[line:<"..getlang (44)..">]")
end

	-- chat history

	if (ucl >= table_sets ["mchistclass"]) and (table_sets ["histlimit"] > 0) then
		susmenitm (usr, getlang (674) .. "\\" .. getlang (187), table_cmnds ["history"] .. " %[line:<" .. getlang (209) .. ">]")
		susmenitm (usr, getlang (674) .. "\\" .. getlang (464), table_cmnds ["myhistory"] .. " %[line:<" .. getlang (209) .. ">]")
	end

	if ucl >= 3 then
		if ucl >= table_sets ["mchistclass"] then
			smensep (usr)
		end

		sopmenitm (usr, getlang (674) .. "\\" .. getlang (173), table_cmnds ["ophistory"] .. " %[line:<" .. getlang (209) .. ">]")
	end

	if ucl >= table_sets ["mincommandclass"] then
		if (ucl >= table_sets ["mchistclass"]) or (ucl >= 3) then
			smensep (usr)
		end

		sopmenitm (usr, getlang (674) .. "\\" .. getlang (174), table_cmnds ["histclean"])
	end

-- commands

if ucl >= table_sets ["mincommandclass"] then
sopmenitm (usr, getlang (675).."\\"..getlang (421), table_cmnds ["cmndset"].." %[line:<"..getlang (420)..">] %[line:<"..getlang (420)..">]")
sopmenitm (usr, getlang (675).."\\"..getlang (651), table_cmnds ["cmndshow"])
smensep (usr)
sopmenitm (usr, getlang (675).."\\"..getlang (426), table_cmnds ["cmndreset"])
smensep (usr)
sopmenitm (usr, getlang (675).."\\"..getlang (779), table_cmnds ["clog"].." %[line:<"..getlang (209)..">]")
smensep (usr)
sopmenitm (usr, getlang (675).."\\"..getlang (336), table_cmnds ["cmndadd"].." %[line:<"..getlang (193)..">] %[line:<"..getlang (171)..">]")
sopmenitm (usr, getlang (675).."\\"..getlang (338), table_cmnds ["cmndlist"])
smensep (usr)
sopmenitm (usr, getlang (675).."\\"..getlang (337), table_cmnds ["cmnddel"].." %[line:<"..getlang (193)..">]")
smensep (usr)
sopmenitm (usr, getlang (675).."\\"..getlang (296), table_cmnds ["cmndexadd"].." %[line:<"..getlang (193)..">]")
sopmenitm (usr, getlang (675).."\\"..getlang (298), table_cmnds ["cmndexlist"])
smensep (usr)
sopmenitm (usr, getlang (675).."\\"..getlang (297), table_cmnds ["cmndexdel"].." %[line:<"..getlang (193)..">]")
end

-- custom nicks

if ucl >= table_sets ["mincommandclass"] then
sopmenitm (usr, getlang (676).."\\"..getlang (467), table_cmnds ["rename"].." %[line:<"..getlang (178)..">] %[line:<"..getlang (178)..">]")
smensep (usr)
sopmenitm (usr, getlang (676).."\\"..getlang (329), table_cmnds ["custdel"].." %[line:<"..getlang (178)..">]")
end

if ucl >= table_sets ["custnickclass"] then
if ucl >= table_sets ["mincommandclass"] then
smensep (usr)
end

susmenitm (usr, getlang (676).."\\"..getlang (247), table_cmnds ["nick"].." %[line:<"..getlang (178)..">]")
--susmenitm (usr, getlang (676).."\\"..getlang (247), table_cmnds ["nick"])
end

susmenitm (usr, getlang (676).."\\"..getlang (367), table_cmnds ["realnick"].." %[line:<"..getlang (178)..">]")
susmenitm (usr, getlang (676).."\\"..getlang (154), table_cmnds ["custlist"])

-- registered users

if ucl >= table_sets ["mincommandclass"] then
sopmenitm (usr, getlang (677).."\\"..getlang (486), table_cmnds ["regname"].." %[line:<"..getlang (178)..">] %[line:<"..getlang (178)..">]")
sopmenitm (usr, getlang (677).."\\"..getlang (164), table_cmnds ["reglist"].." %[line:<"..getlang (171)..">] %[line:<"..getlang (149)..">]")
sopmenitm (usr, getlang (677).."\\"..getlang (686), table_cmnds ["regfind"].." %[line:<"..getlang (178)..">]")
sopmenitm (usr, getlang (677).."\\"..getlang (687), table_cmnds ["regstats"])
end

-- hublist

if ucl >= table_sets ["mincommandclass"] then
sopmenitm (usr, getlang (678).."\\"..getlang (524), table_cmnds ["hubadd"].." %[line:<"..getlang (522)..">] \"%[line:<"..getlang (470)..">]\" \"%[line:<"..getlang (523)..">]\"")
smensep (usr)
sopmenitm (usr, getlang (678).."\\"..getlang (525), table_cmnds ["hubdel"].." %[line:<"..getlang (522)..">]")
end

if ucl >= table_sets ["minusrcommandclass"] then
if ucl >= table_sets ["mincommandclass"] then
smensep (usr)
end

susmenitm (usr, getlang (678).."\\"..getlang (526), table_cmnds ["showhubs"])
end

-- chat

if ucl >= table_sets ["chatmodeclass"] then
if ucl >= table_sets ["mincommandclass"] then
sopmenitm (usr, getlang (679).."\\"..getlang (630), table_cmnds ["mode"].." %[line:<"..getlang (193)..">] %[line:<"..getlang (632)..">]")
sopmenitm (usr, getlang (679).."\\"..getlang (635), table_cmnds ["mode"])
end

susmenitm (usr, getlang (679).."\\"..getlang (630), table_cmnds ["mode"].." %[line:<"..getlang (632)..">]")
end

if ucl >= table_sets ["sayclass"] then
if (ucl >= table_sets ["chatmodeclass"]) and (ucl >= table_sets ["mincommandclass"]) then
smensep (usr)
end

sopmenitm (usr, getlang (679).."\\"..getlang (165), table_cmnds ["say"].." %[line:<"..getlang (178)..">] %[line:<"..getlang (44)..">]")
end

	if ucl >= table_sets ["clearclass"] then
		smensep (usr)
		sopmenitm (usr, getlang (679).."\\"..getlang (684), table_cmnds ["clear"])
	end

	-- ip gag
	if ucl >= table_sets ["mincommandclass"] then
		sopmenitm (usr, getlang (680) .. "\\" .. getlang (641), table_cmnds ["gagipadd"] .. " %[line:<" .. getlang (193) .. ">] %[line:<" .. getlang (126) .. ">]")
		sopmenitm (usr, getlang (680) .. "\\" .. getlang (646), table_cmnds ["gagiplist"])
		smensep (usr)
		sopmenitm (usr, getlang (680) .. "\\" .. getlang (648), table_cmnds ["gagipdel"] .. " %[line:<" .. getlang (193) .. " " .. getlang (197) .. " *>]")
	end

	-- cc gag
	if ucl >= table_sets ["mincommandclass"] then
		sopmenitm (usr, getlang (876).."\\"..getlang (877), table_cmnds ["gagccadd"].." %[line:<"..getlang (789)..">] %[line:<"..getlang (126)..">]")
		sopmenitm (usr, getlang (876).."\\"..getlang (882), table_cmnds ["gagcclist"])
		smensep (usr)
		sopmenitm (usr, getlang (876).."\\"..getlang (884), table_cmnds ["gagccdel"].." %[line:<"..getlang (789).." "..getlang (197).." *>]")
	end

	-- user logger

	if ucl >= table_sets ["mincommandclass"] then
		sopmenitm (usr, getlang (681) .. "\\" .. getlang (703), table_cmnds ["userinfo"] .. " %[line:<" .. getlang (178) .. ">]")
		sopmenitm (usr, getlang (681) .. "\\" .. getlang (930), table_cmnds ["ipinfo"] .. " %[line:<" .. getlang (243) .. ">]")
		sopmenitm (usr, getlang (681) .. "\\" .. getlang (406), table_cmnds ["ulog"] .. " %[line:<" .. getlang (48) .. ">] %[line:<" .. getlang (120) .. ">] %[line:<" .. getlang (209) .. ">]")
		sopmenitm (usr, getlang (681) .. "\\" .. string.format (getlang (637), "http://www.te-home.net/?do=hublist"), table_cmnds ["seen"] .. " %[line:<" .. getlang (178) .. ">]")
	end

	-- todo: no pm
	-- todo: rc menu

	-- other

	if ucl >= table_sets ["mincommandclass"] then
		sopmenitm (usr, getlang (682) .. "\\" .. getlang (919), table_cmnds ["dropip"] .. " %[line:<" .. getlang (243) .. ">]")
		smensep (usr)
		sopmenitm (usr, getlang (682) .. "\\" .. getlang (172), table_cmnds ["cleanup"] .. " %[line:<" .. getlang (48) .. ">] %[line:<" .. getlang (4) .. " " .. getlang (197) .. " *>] %[line:<" .. getlang (171) .. ">]")
		--sopmenitm (usr, getlang (682) .. "\\" .. getlang (172), table_cmnds ["cleanup"] .. " %[line:<" .. getlang (48) .. ">] %[line:<" .. getlang (4) .. ">]")
		sopmenitm (usr, getlang (682) .. "\\" .. getlang (293), table_cmnds ["readlog"] .. " %[line:<" .. getlang (292) .. ">] %[line:<" .. getlang (209) .. ">]")
	end

if ucl >= table_sets ["minusrcommandclass"] then
if ucl >= table_sets ["mincommandclass"] then
smensep (usr)
end

susmenitm (usr, getlang (682).."\\"..getlang (480), table_cmnds ["calculate"].." %[line:<"..getlang (479)..">]")
susmenitm (usr, getlang (682).."\\"..getlang (181), table_cmnds ["showtopic"])
end

-- configuration

if ucl >= table_sets ["mincommandclass"] then
sopmenitm (usr, getlang (683).."\\"..getlang (176), table_cmnds ["ledoconf"])
sopmenitm (usr, getlang (683).."\\"..getlang (177), table_cmnds ["ledoset"].." %[line:<"..getlang (204)..">] %[line:<"..getlang (205)..">]")
sopmenitm (usr, getlang (683).."\\"..getlang (10), table_cmnds ["ledover"])
sopmenitm (usr, getlang (683).."\\"..getlang (179), table_cmnds ["ledohelp"])
sopmenitm (usr, getlang (683).."\\"..getlang (188), table_cmnds ["ledostats"])
end
end

----- ---- --- -- -

function sopmenitm (usr, txt, cmd)
VH:SendDataToUser ("$UserCommand 1 3 "..table_sets ["usermenuname"].."\\.:: "..txt.." $<%[mynick]> "..string.sub (getconfig ("cmd_start_op"), 1, 1)..cmd.."&#124;|", usr)
end

----- ---- --- -- -

function susmenitm (usr, txt, cmd)
VH:SendDataToUser ("$UserCommand 1 3 "..table_sets ["usermenuname"].."\\.:: "..txt.." $<%[mynick]> "..string.sub (getconfig ("cmd_start_user"), 1, 1)..cmd.."&#124;|", usr)
end

----- ---- --- -- -

function smensep (usr)
VH:SendDataToUser ("$UserCommand 0 3|", usr)
end

----- ---- --- -- -

function sethubconf (line)
	local _, _, cname, cvalu = string.find (line, "^%s*(%S+) (.*)$")
	local _, _, nospval = string.find (cvalu, "^%s*(%S+)%s*$") -- truncate spaces

	if cname == "hub_security" then
		table_othsets ["botnick"] = nospval

		if table_sets ["addledobot"] == 0 then
			table_othsets ["sendfrom"] = nospval
		end

	elseif cname == "opchat_name" then
		table_othsets ["opchatnick"] = nospval

		if table_sets ["addledobot"] == 0 and table_sets ["useextrafeed"] == 0 then
			table_othsets ["feednick"] = nospval
		end

	elseif cname == "cmd_start_op" then
		table_othsets ["optrig"] = "["

		for pos = 1, string.len (nospval) do
			table_othsets ["optrig"] = table_othsets ["optrig"] .. "%" .. string.sub (nospval, pos, pos)
		end

		table_othsets ["optrig"] = table_othsets ["optrig"] .. "]"

	elseif cname == "cmd_start_user" then
		table_othsets ["ustrig"] = "["

		for pos = 1, string.len (nospval) do
			table_othsets ["ustrig"] = table_othsets ["ustrig"] .. "%" .. string.sub (nospval, pos, pos)
		end

		table_othsets ["ustrig"] = table_othsets ["ustrig"] .. "]"
	end
end

----- ---- --- -- -

function getledoconf (var)
	local _, rows = VH:SQLQuery ("select `value` from `"..tbl_sql ["conf"].."` where `variable` = '"..repsqlchars (var).."' limit 1")

	if rows > 0 then
		local _, cfg = VH:SQLFetch (0)
		return tonumber (cfg) or cfg
	else
		return nil
	end
end

----- ---- --- -- -

function setledocmd (nick, ucls, line)
local _, _, orig, cnew = string.find (line, "^(%S+) (%S+)$")

if not table_cmnds [orig] then
	commandanswer (nick, string.format (getlang (423), orig))
else
	table_cmnds [orig] = cnew
	VH:SQLQuery ("update `"..tbl_sql ["ledocmd"].."` set `new` = '"..repsqlchars (cnew).."' where `original` = '"..repsqlchars (orig).."' limit 1")
	commandanswer (nick, string.format (getlang (422), orig, cnew))
	opsnotify (table_sets ["classnoticom"], string.format (getlang (425), nick, ucls, orig, cnew))
end
end

----- ---- --- -- -

function showledocmd (nick)
local list = ""
local c = 1

for k, v in pairs (table_cmnds) do
	if v ~= k then
		list = list.." "..c..". "..k.." => "..v.."\r\n"
		c = c + 1
	end
end

if list == "" then
	commandanswer (nick, getlang (653))
else
	commandanswer (nick, getlang (652)..":\r\n\r\n"..list)
end
end

----- ---- --- -- -

function resetledocmd (nick)
local cnum = 0

for k, v in pairs (table_cmnds) do
	if v ~= k then
		cnum = cnum + 1
		table_cmnds [k] = k
		k = repsqlchars (k)
		VH:SQLQuery ("update `"..tbl_sql ["ledocmd"].."` set `new` = '"..k.."' where `original` = '"..k.."' limit 1")
	end
end

commandanswer (nick, string.format (getlang (427), cnum))
end

----- ---- --- -- -

function setledoconf (nick, ucls, line)
local _, _, tvar, setto = string.find (line, "^(%S+) (.*)$")
local num, ok = true, false
if tonumber (setto) then setto = tonumber (setto) else num = false end

----- ---- --- -- -

	if tvar == "enableantispam" then
		if num == true then
			if (setto == 0) or (setto == 1) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "checkcmdspam" then
		if num == true then
			if (setto == 0) or (setto == 1) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

elseif tvar == "allowspamtoops" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

	----- ---- --- -- -

	elseif tvar == "kickunkusers" then
		if num == true then
			if (setto == 0) or (setto == 1) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

	----- ---- --- -- -

	elseif tvar == "unkbeforelogin" then
		if num == true then
			if (setto == 0) or (setto == 1) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

	----- ---- --- -- -

elseif tvar == "chatrunning" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true

if table_sets [tvar] ~= setto then
if setto == 0 then
uninstallchatrooms ()
else
installchatrooms ()
end
end

else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "ccroomrunning" then
if num == true then
if (setto == 0) or (setto == 1) then
if (setto == 1) and (table_othsets ["func_getcc"] == false) then commandanswer (nick, string.format (getlang (514), "Verlihub 0.9.8e")) end
if (table_sets [tvar] ~= setto) and (setto == 0) then uninstallccrooms () end
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "roomusernotify" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "ccroomautocls" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5 "..getlang (197).." 10"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "ccroommancls" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5 "..getlang (197).." 10"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

	elseif tvar == "ccroomstyle" then
		if string.len (setto) > 0 then
			if (not string.find (setto, "<cc>")) and (not string.find (setto, "<cn>")) then
				commandanswer (nick, string.format (getlang (613), "<cc> "..getlang (197).." <cn>"))
			else
				setto = string.gsub (setto, string.char (32), string.char (160)) -- space to non-breaking space
				ok = true
			end
		else
			commandanswer (nick, string.format (getlang (320), tvar))
		end

----- ---- --- -- -

	elseif tvar == "codetext" then
		if string.len (setto) > 0 then
			if not string.find (setto, "<code>") then
				commandanswer (nick, string.format (getlang (613), "<code>"))
			else
				ok = true
			end
		else
			commandanswer (nick, string.format (getlang (320), tvar))
		end

----- ---- --- -- -

elseif tvar == "thirdacttime" then
if string.len (setto) > 0 then
ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "sixthactaddr" then
if string.len (setto) > 0 then
ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "ninthactrepmsg" then
	if string.len (setto) > 0 then
		ok = true
	else
		commandanswer (nick, string.format (getlang (320), tvar))
	end

----- ---- --- -- -

	elseif tvar == "seventhacttime" then
		ok = true

----- ---- --- -- -

	elseif tvar == "codecharsep" then
		ok = true

----- ---- --- -- -

	elseif tvar == "codecharlist" then
		if string.len (setto) > 0 then
			ok = true
		else
			commandanswer (nick, string.format (getlang (320), tvar))
		end

----- ---- --- -- -

	elseif tvar == "unktbantime" then
		ok = true

----- ---- --- -- -

elseif tvar == "unkkickreason" then
if string.len (setto) > 0 then
ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "enablesearfilt" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "scanbelowclass" then
if num == true then
if ((setto >= 1) and (setto <= 5)) or (setto == 10) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "1, 2, 3, 4, 5 "..getlang (197).." 10"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

	----- ---- --- -- -

	elseif tvar == "antibelowclass" then
		if num == true then
			if ((setto >= 1) and (setto <= 5)) or (setto == 10) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "1, 2, 3, 4, 5 " .. getlang (197) .. " 10"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "regkickaction" then
		if num == true then
			if (setto >= 0) and (setto <= 2) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0, 1 "..getlang (197).." 2"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "regmechatcnt" then
		if num == true then
			if (setto >= 0) and (setto <= 100) then
				if setto == 0 then table_regm = {} end
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (199).." 100"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "regmeuptime" then
		if num == true then
			if (setto >= 0) and (setto <= 1440) then
				if (setto > 0) and (table_sets ["showuseruptime"] == 0) then
					commandanswer (nick, string.format (getlang (818), "showuseruptime", 1))
				end

				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (199).." 1440"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "searchuptime" then
		if num == true then
			if (setto >= 0) and (setto <= 86400) then
				if (setto > 0) and (table_sets ["showuseruptime"] == 0) then
					commandanswer (nick, string.format (getlang (818), "showuseruptime", 1))
				end

				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (199).." 86400"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "searuptimeact" then
		if num == true then
			if (setto == 0) or (setto == 1) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

elseif tvar == "showtopicowner" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "ipconantiflint" then
if num == true then
if (setto >= 0) and (setto <= 3600) then
ok = true
if setto == 0 then table_rcnn = {} end -- flush
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (199).." 3600"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "statscollint" then
	if num == true then
		if (setto >= 0) and (setto <= 1440) then
			ok = true
		else
			commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (199).." 1440"))
		end

	else
		commandanswer (nick, string.format (getlang (198), tvar))
	end

----- ---- --- -- -

elseif tvar == "userrecmsg" then
	if string.len (setto) > 0 then
		if not string.find (setto, "<new>") then
			commandanswer (nick, string.format (getlang (613), "<new>"))
		else
			ok = true
		end

	else
		commandanswer (nick, string.format (getlang (320), tvar))
	end

----- ---- --- -- -

elseif tvar == "sharerecmsg" then
	if string.len (setto) > 0 then
		if not string.find (setto, "<new>") then
			commandanswer (nick, string.format (getlang (613), "<new>"))
		else
			ok = true
		end

	else
		commandanswer (nick, string.format (getlang (320), tvar))
	end

----- ---- --- -- -

elseif tvar == "chatfloodcount" then
	if num == true then
		if (setto >= 1) and (setto <= 100) then
			ok = true
		else
			commandanswer (nick, string.format (getlang (196), tvar, "1 "..getlang (199).." 100"))
		end

	else
		commandanswer (nick, string.format (getlang (198), tvar))
	end

----- ---- --- -- -

	elseif tvar == "chatfloodallcount" then
		if num == true then
			if (setto >= 1) and (setto <= 250) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "1 "..getlang (199).." 250"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "protofloodctmcnt" then
		if num == true then
			if (setto >= 0) and (setto <= 1000) then
				if setto == 0 then table_prfl ["ctm"] = {} end -- flush
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (199).." 1000"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "chatfloodint" then
		if num == true then
			if (setto >= 1) and (setto <= 3600) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "1 "..getlang (199).." 3600"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "chatfloodallint" then
		if num == true then
			if (setto >= 1) and (setto <= 3600) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "1 "..getlang (199).." 3600"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

	----- ---- --- -- -

	elseif tvar == "protofloodctmact" then
		if num == true then
			if setto >= 0 and setto <= 3 then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 " .. getlang (199) .. " 3"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

	----- ---- --- -- -

	elseif tvar == "protofloodctmint" then
		if num == true then
			if (setto >= 1) and (setto <= 3600) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "1 "..getlang (199).." 3600"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "codelength" then
		if num == true then
			if (setto >= 1) and (setto <= 25) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "1 "..getlang (199).." 25"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

elseif tvar == "pmminclass" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5 "..getlang (197).." 10"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

	elseif tvar == "ctmminclass" then
		if num == true then
			if ((setto >= 0) and (setto <= 5)) or (setto == 10) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5 "..getlang (197).." 10"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "ctmmsginterval" then
		if num == true then
			if (setto >= 0) and (setto <= 3600) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (199).." 3600"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "ctmblockmsg" then
		if string.len (setto) > 0 then
			ok = true
		else
			commandanswer (nick, string.format (getlang (320), tvar))
		end

----- ---- --- -- -

elseif tvar == "chatmodeclass" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

	elseif tvar == "chatcodeon" then
		if num == true then
			if (setto >= 0) and (setto <= 2) then
				if setto == 0 then table_code = {} end -- flush
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (199).." 2"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

elseif tvar == "codemaxclass" then
if num == true then
if (setto >= 0) and (setto <= 2) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (199).." 2"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

	elseif tvar == "enableuserlog" then
		if num == true then
			if (setto == 0) or (setto == 1) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 " .. getlang (197) .. " 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "ulogautoclean" then
		if num == true then
			if (setto >= 0) and (setto <= 365) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 " .. getlang (199) .. " 365"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "enableipwatch" then
		if num == true then
			if (setto == 0) or (setto == 1) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "chatantiflood" then
		if num == true then
			if (setto == 0) or (setto == 1) then
				ok = true
				if setto == 0 then table_flod = {} end -- flush
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "enablehardban" then
		if num == true then
			if (setto == 0) or (setto == 1) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "useblacklist" then
		if num == true then
			if (setto == 0) or (setto == 1) then
				if setto == 0 then
					table_blst = {} -- flush
					ok = true
				elseif table_sets ["useblacklist"] == 0 then -- load
					commandanswer (nick, string.format (getlang (855), "blacklist.txt"))

					if loadblacklist () == true then
						ok = true
						commandanswer (nick, string.format (getlang (856), "blacklist.txt"))
					else
						commandanswer (nick, string.format (getlang (857), "blacklist.txt"))
					end
				end
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "chatfloodcmdgag" then
		if num == true then
			if (setto == 0) or (setto == 1) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

elseif tvar == "chatfloodaction" then
	if num == true then
		if (setto >= 0) and (setto <= 5) then
			ok = true
		else
			commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4 "..getlang (197).." 5"))
		end

	else
		commandanswer (nick, string.format (getlang (198), tvar))
	end

----- ---- --- -- -

elseif tvar == "logallmyinfos" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "funrandomchat" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

	elseif tvar == "useripsupport" then
		if num == true then
			if (setto == 0) or (setto == 1) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

elseif tvar == "useripinchat" then
	if num == true then
		if (setto >= 0) and (setto <= 2) then
			ok = true
		else
			commandanswer (nick, string.format (getlang (196), tvar, "0, 1 "..getlang (197).." 2"))
		end

	else
		commandanswer (nick, string.format (getlang (198), tvar))
	end

----- ---- --- -- -

elseif tvar == "enablecmdlog" then
	if num == true then
		if (setto >= 0) and (setto <= 2) then
			ok = true
		else
			commandanswer (nick, string.format (getlang (196), tvar, "0, 1 "..getlang (197).." 2"))
		end

	else
		commandanswer (nick, string.format (getlang (198), tvar))
	end

	----- ---- --- -- -

	elseif tvar == "instusermenu" then
		if num == true then
			if setto == 0 or setto == 1 then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 " .. getlang (197) .. " 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

	----- ---- --- -- -

	elseif tvar == "instrcmenu" then
		if num == true then
			if setto == 0 or setto == 1 then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 " .. getlang (197) .. " 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

	--[[

	----- ---- --- -- -

	elseif tvar == "hublistpingint" then
		if num == true then
			if (setto >= 0) and (setto <= 1440) then
				ok = true

				if (setto > 0) and (not lsock) then
					commandanswer (nick, string.format (getlang (625), "LuaSocket"))
				end

				if setto == 0 then -- reset
					VH:SQLQuery ("update `" .. tbl_sql ["hubs"] .. "` set `status` = 0")
				end
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 " .. getlang (199) .. " 1440"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

	----- ---- --- -- -

	elseif tvar == "hubpingtimeout" then
		if num == true then
			if (setto >= 0) and (setto <= 10) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 " .. getlang (199) .. " 10"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

	]]--

----- ---- --- -- -

elseif tvar == "chatrankclass" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
if setto > table_sets [tvar] then cleantablebyclass (setto, tbl_sql ["chran"]) end
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "oprankclass" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
if setto > table_sets [tvar] then cleantablebyclass (setto, tbl_sql ["opran"]) end
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "searrankclass" then
	if num == true then
		if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
			ok = true
		else
			commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
		end

	else
		commandanswer (nick, string.format (getlang (198), tvar))
	end

----- ---- --- -- -

elseif tvar == "sharerankclass" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
if setto > table_sets [tvar] then cleantablebyclass (setto, tbl_sql ["shran"]) end
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "wordrankclass" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

	----- ---- --- -- -

	elseif tvar == "ccstatsclass" then
		if num == true then
			if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
				if setto < 11 then
					if table_othsets ["func_getcc"] == false then
						commandanswer (nick, string.format (getlang (514), "Verlihub 0.9.8e"))
					end

					if table_othsets ["func_getusercity"] == false then
						commandanswer (nick, string.format (getlang (514), "Verlihub 1.0"))
					end
				end

				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 " .. getlang (197) .. " 11"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

	----- ---- --- -- -

elseif tvar == "savecchistory" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true

if setto == 1 then -- set first date
if table_othsets ["func_getcc"] == false then
commandanswer (nick, string.format (getlang (514), "Verlihub 0.9.8e"))
else
VH:SQLQuery ("insert ignore into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('date_ccstats', "..(os.time () + table_sets ["srvtimediff"])..")")
end
end

else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

	elseif tvar == "showuseruptime" then
		if num == true then
			if (setto == 0) or (setto == 1) then
				ok = true

				if setto == 0 then -- flush
					table_usup = {}
				end
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

elseif tvar == "ranklimit" then
if num == true then
if (setto >= 1) and (setto <= 1000) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "1 "..getlang (199).." 1000"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "shareranmin" then
if num == true then
if (setto >= 1) and (setto <= 102400) then
ok = true

if setto > table_sets [tvar] then
VH:SQLQuery ("delete from `"..tbl_sql ["shran"].."` where `rank` < "..(setto * 1073741824))
end

else
commandanswer (nick, string.format (getlang (196), tvar, "1 "..getlang (199).." 1024"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "wordranmin" then
if num == true then
if (setto >= 1) and (setto <= 25) then
ok = true
if setto > table_sets [tvar] then cleanwordrank (setto, 0) end
else
commandanswer (nick, string.format (getlang (196), tvar, "1 "..getlang (199).." 25"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "wordranmax" then
if num == true then
if (setto >= 1) and (setto <= 100) then
ok = true

if setto < table_sets [tvar] then
cleanwordrank (setto, 1)
end

else
commandanswer (nick, string.format (getlang (196), tvar, "1 "..getlang (199).." 100"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "classnotianti" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "classnotiex" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "classnotisefi" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

	elseif tvar == "classnotimich" then
		if num == true then
			if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

elseif tvar == "classnotiflood" then
	if num == true then
		if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
			ok = true
		else
			commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
		end

	else
		commandanswer (nick, string.format (getlang (198), tvar))
	end

----- ---- --- -- -

elseif tvar == "classnotigagip" then
	if num == true then
		if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
			ok = true
		else
			commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
		end

	else
		commandanswer (nick, string.format (getlang (198), tvar))
	end

----- ---- --- -- -

elseif tvar == "classnoticom" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "classnotisay" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

	----- ---- --- -- -

	elseif tvar == "classnotirepl" then
		if num == true then
			if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 " .. getlang (197) .. " 11"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

elseif tvar == "classnotikick" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

	----- ---- --- -- -

	elseif tvar == "classnotiban" then
		if num == true then
			if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 " .. getlang (197) .. " 11"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

elseif tvar == "classnotireg" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "classnoticonfig" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "classnotiredir" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "classnotibadctm" then
	if num == true then
		if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
			ok = true
		else
			commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
		end

	else
		commandanswer (nick, string.format (getlang (198), tvar))
	end

----- ---- --- -- -

elseif tvar == "classnotiunk" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "classnotioff" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "classnotiledoact" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

	elseif tvar == "classnotiprotoflood" then
		if num == true then
			if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

elseif tvar == "classnotiauth" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "classnotiwelcome" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "classnotibotpm" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

	elseif tvar == "classnotihardban" then
		if num == true then
			if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "classnotiipwatch" then
		if num == true then
			if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "classnotiblist" then
		if num == true then
			if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

elseif tvar == "classnoticust" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "classnotipeakts" then
	if num == true then
		if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
			ok = true
		else
			commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
		end

	else
		commandanswer (nick, string.format (getlang (198), tvar))
	end

----- ---- --- -- -

elseif tvar == "classnotipeakuc" then
	if num == true then
		if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
			ok = true
		else
			commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
		end

	else
		commandanswer (nick, string.format (getlang (198), tvar))
	end

----- ---- --- -- -

elseif tvar == "mincommandclass" then
if num == true then
if ((setto >= 3) and (setto <= 5)) or (setto == 10) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "3, 4, 5 "..getlang (197).." 10"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "minusrcommandclass" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5 "..getlang (197).." 10"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

	elseif tvar == "custnickclass" then
		if num == true then
			if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
				ok = true
				if setto > table_sets [tvar] then cleancustnick (setto, 1) end
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

elseif tvar == "welcomeclass" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
if setto > table_sets [tvar] then cleantablebyclass (setto, tbl_sql ["wm"]) end
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "opkeyclass" then
	if num == true then
		if ((setto >= 0) and (setto <= 2)) or (setto == 11) then
			if setto == 11 then -- flush
				for k, v in pairs (table_opks) do
					if v == 1 then -- class
						table_opks [k] = nil
					end
				end
			end

			ok = true
		else
			commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2 "..getlang (197).." 11"))
		end
	else
		commandanswer (nick, string.format (getlang (198), tvar))
	end

----- ---- --- -- -

	elseif tvar == "opkeyself" then
		if num == true then
			if ((setto >= 0) and (setto <= 2)) or (setto == 11) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2 "..getlang (197).." 11"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

elseif tvar == "opkeyshare" then
	if num == true then
		if (setto >= 0) and (setto <= 10240) then
			if setto == 0 then -- flush
				for k, v in pairs (table_opks) do
					if v == 2 then -- share
						table_opks [k] = nil
					end
				end
			end

			ok = true
		else
			commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (199).." 10240"))
		end

	else
		commandanswer (nick, string.format (getlang (198), tvar))
	end

----- ---- --- -- -

	elseif tvar == "relmodclass" then
		if num == true then
			if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

elseif tvar == "antimessage" then
if string.len (setto) > 0 then
ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "usermenuname" then
if string.len (setto) > 0 then
ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "authmessage" then
if string.len (setto) > 0 then
ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "searfiltmsg" then
if string.len (setto) > 0 then
ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "antikreason" then
if string.len (setto) > 0 then
ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "sefireason" then
if string.len (setto) > 0 then
ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "authrunning" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "savecustnicks" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

	elseif tvar == "remrunning" then
		if num == true then
			if (setto == 0) or (setto == 1) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "replrunning" then
		if num == true then
			if (setto == 0) or (setto == 1) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

elseif tvar == "resprunning" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true
if setto == 0 then table_resp = {} end -- flush
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "respdelay" then
if num == true then
if (setto >= 1) and (setto <= 60) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "1 "..getlang (199).." 60"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "custmaxlen" then
if num == true then
if (setto >= 3) and (setto <= 64) then
ok = true
if setto < table_sets [tvar] then cleancustnick (setto, 0) end
else
commandanswer (nick, string.format (getlang (196), tvar, "3 "..getlang (199).." 64"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "micheck" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "micallall" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "michnick" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "michdesc" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "michtag" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "michconn" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "michemail" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "michshare" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "michip" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

	----- ---- --- -- -

	elseif tvar == "michdns" then
		if num == true then
			if (setto == 0) or (setto == 1) then
				if (setto == 1) and (getconfig ("dns_lookup") == 0) then
					commandanswer (nick, string.format (getlang (758), "dns_lookup", 1))
				end

				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

	----- ---- --- -- -

	elseif tvar == "michsup" then
		if num == true then
			if (setto == 0) or (setto == 1) then
				if (setto == 1) and (table_othsets ["func_getusersupports"] == false) then
					commandanswer (nick, string.format (getlang (899), "Verlihub"))
				end

				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 " .. getlang (197) .. " 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

	----- ---- --- -- -

	elseif tvar == "michver" then
		if num == true then
			if (setto == 0) or (setto == 1) then
				if (setto == 1) and (table_othsets ["func_getuserversion"] == false) then
					commandanswer (nick, string.format (getlang (899), "Verlihub"))
				end

				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 " .. getlang (197) .. " 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "michcc" then
		if num == true then
			if (setto == 0) or (setto == 1) then
				if (setto == 1) and (table_othsets ["func_getcc"] == false) then
					commandanswer (nick, string.format (getlang (514), "Verlihub 0.9.8e"))
				--else
					--ok = true
				end

				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "michfakenum" then
		if num == true then
			if ((setto >= 4) and (setto <= 15)) or (setto == 0) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "4 "..getlang (199).." 15 "..getlang (197).." 0"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "michfakediv" then
		if num == true then
			if (setto == 0) or (setto == 1) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

	elseif tvar == "michclone" then
		if num == true then
			if (setto >= 0) and (setto <= 2) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (199).." 2"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

elseif tvar == "michsameip" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

	----- ---- --- -- -

	elseif tvar == "enablevipkick" then
		if num == true then
			if setto == 0 or setto == 1 then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 " .. getlang (197) .. " 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

	----- ---- --- -- -

	elseif tvar == "votekickclass" then
		if num == true then
			if (setto >= 0 and setto <= 5) or setto == 10 or setto == 11 then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 " .. getlang (197) .. " 11"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

	----- ---- --- -- -

	elseif tvar == "votekickcount" then
		if num == true then
			if setto >= 1 and setto <= 100 then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "1 " .. getlang (199) .. " 100"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

	----- ---- --- -- -

	elseif tvar == "mitbantime" then
		ok = true

	----- ---- --- -- -

	elseif tvar == "miclonekicktime" then
		ok = true

----- ---- --- -- -

elseif tvar == "minickmessage" then
if string.len (setto) > 0 then
ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "midescmessage" then
if string.len (setto) > 0 then
ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "mitagmessage" then
if string.len (setto) > 0 then
ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "miconnmessage" then
if string.len (setto) > 0 then
ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "miemailmessage" then
if string.len (setto) > 0 then
ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "misharemessage" then
if string.len (setto) > 0 then
ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "miipmessage" then
if string.len (setto) > 0 then
ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

	----- ---- --- -- -

	elseif tvar == "midnsmessage" then
		if string.len (setto) > 0 then
			ok = true
		else
			commandanswer (nick, string.format (getlang (320), tvar))
		end

	----- ---- --- -- -

	elseif tvar == "misupmessage" then
		if string.len (setto) > 0 then
			ok = true
		else
			commandanswer (nick, string.format (getlang (320), tvar))
		end

	----- ---- --- -- -

	elseif tvar == "mivermessage" then
		if string.len (setto) > 0 then
			ok = true
		else
			commandanswer (nick, string.format (getlang (320), tvar))
		end

	----- ---- --- -- -

	elseif tvar == "miccmessage" then
		if string.len (setto) > 0 then
			ok = true
		else
			commandanswer (nick, string.format (getlang (320), tvar))
		end

----- ---- --- -- -

elseif tvar == "mifakemessage" then
if string.len (setto) > 0 then
ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "miclonemessage" then
if string.len (setto) > 0 then
ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "misameipmessage" then
if string.len (setto) > 0 then
ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "offmsgclass" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

	----- ---- --- -- -

	elseif tvar == "mchistclass" then
		if num == true then
			if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 " .. getlang (197) .. " 11"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

	----- ---- --- -- -

elseif tvar == "sayclass" then
if num == true then
if ((setto >= 3) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

	elseif tvar == "clearclass" then
		if num == true then
			if ((setto >= 3) and (setto <= 5)) or (setto == 10) or (setto == 11) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "3, 4, 5, 10 "..getlang (197).." 11"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

elseif tvar == "newsclass" then
if num == true then
if ((setto >= 0) and (setto <= 5)) or (setto == 10) or (setto == 11) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0, 1, 2, 3, 4, 5, 10 "..getlang (197).." 11"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "histbotmsg" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "histautolines" then
if num == true then
if (setto >= 0) and (setto <= 100) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (199).." 100"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "ophistautolines" then
if num == true then
if (setto >= 0) and (setto <= 100) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (199).." 100"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

	----- ---- --- -- -

	elseif tvar == "histautonewlinedel" then
		if num == true then
			if (setto == 0) or (setto == 1) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 " .. getlang (197) .. " 1"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

	----- ---- --- -- -

	elseif tvar == "histautolinemax" then
		if num == true then
			if (setto >= 0) and (setto <= 1000) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 " .. getlang (199) .. " 1000"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

	----- ---- --- -- -

	elseif tvar == "autoupdcheck" then
		if num == true then
			if (setto >= 0) and (setto <= 168) then
				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (199).." 168"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

elseif tvar == "newsautolines" then
if num == true then
if (setto >= 0) and (setto <= 100) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (199).." 100"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "histlimit" then
	if num == true then
		if (setto >= 0) and (setto <= 10000) then
			ok = true
			cleanhistory (nick, setto, 1, ucls)
		else
			commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (199).." 10000"))
		end

	else
		commandanswer (nick, string.format (getlang (198), tvar))
	end

----- ---- --- -- -

elseif tvar == "translitmode" then
if num == true then
if (setto >= 0) and (setto <= 2) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (199).." 2"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "tolowcharcase" then
	if num == true then
		if (setto == 0) or (setto == 1) then
			ok = true
		else
			commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
		end

	else
		commandanswer (nick, string.format (getlang (198), tvar))
	end

----- ---- --- -- -

	elseif tvar == "langfileprefix" then
		ok = true
		loadlangfile (nick, setto)

----- ---- --- -- -

elseif tvar == "srvtimediff" then
if num == true then
if (setto >= -43200) and (setto <= 43200) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "-43200 "..getlang (199).." 43200"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

	----- ---- --- -- -

	elseif tvar == "longdateformat" then
		if string.len (setto) > 0 then
			ok = true
		else
			commandanswer (nick, string.format (getlang (320), tvar))
		end

	----- ---- --- -- -

	elseif tvar == "dateformat" then
		if string.len (setto) > 0 then
			ok = true
		else
			commandanswer (nick, string.format (getlang (320), tvar))
		end

----- ---- --- -- -

elseif tvar == "timeformat" then
if string.len (setto) > 0 then
ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "shrtuptimefmt" then
if string.len (setto) > 0 then
ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "timebotint" then
if num == true then
if (setto >= 0) and (setto <= 86400) then
ok = true

if (table_sets [tvar] ~= setto) and (setto == 0) and table_othsets ["lasttimenick"] then
	if table_sets ["fasttimebot"] == 1 then
		VH:SendDataToAll ("$Quit "..table_othsets ["lasttimenick"].."|", 0, 10)
	else
		delhubrobot (table_othsets ["lasttimenick"])
	end

	table_othsets ["lasttimenick"] = nil
end

else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (199).." 86400"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "rolltopicint" then
if num == true then
if (setto >= 0) and (setto <= 3600) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (199).." 3600"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "rolltopicspace" then
if num == true then
if (setto >= 0) and (setto <= 10) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (199).." 10"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "timebotnick" then
if string.len (setto) > 0 then
setto = repnickchars (setto)

if (setto == table_sets [tvar]) or (getstatus (setto) == 1) then
-- isbot (setto) == true
commandanswer (nick, getlang (511))
return nil
end

ok = true
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "fasttimebot" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true

if (table_sets [tvar] ~= setto) and table_othsets ["lasttimenick"] then
	if table_sets [tvar] == 1 then
		VH:SendDataToAll ("$Quit "..table_othsets ["lasttimenick"].."|", 0, 10)
	else
		delhubrobot (table_othsets ["lasttimenick"])
	end

	table_othsets ["lasttimenick"] = nil
end

else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "addledobot" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true

if table_sets [tvar] ~= setto then
if setto == 0 then
if table_sets ["useextrafeed"] == 0 then table_othsets ["feednick"] = table_othsets ["opchatnick"] end
table_othsets ["sendfrom"] = table_othsets ["botnick"]
delhubrobot (table_sets ["ledobotnick"])
else

addhubrobot (table_sets ["ledobotnick"], table_othsets ["ledobotdesc"]..table_othsets ["ledobottag"], 2, table_sets ["ledobotmail"], getownsize (true, table_sets ["ledobotsize"]))
if table_sets ["useextrafeed"] == 0 then table_othsets ["feednick"] = table_sets ["ledobotnick"] end
table_othsets ["sendfrom"] = table_sets ["ledobotnick"]
end
end

else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

	elseif tvar == "ledobotsize" then
		if num == true then
			if (setto >= -1) and (setto <= 21990232555520) then
				if table_sets ["addledobot"] == 1 then
					delhubrobot (table_sets ["ledobotnick"])
					addhubrobot (table_sets ["ledobotnick"], table_othsets ["ledobotdesc"]..table_othsets ["ledobottag"], 2, table_sets ["ledobotmail"], getownsize (true, setto))
				end

				ok = true
			else
				commandanswer (nick, string.format (getlang (196), tvar, "-1 "..getlang (199).." 21990232555520"))
			end
		else
			commandanswer (nick, string.format (getlang (198), tvar))
		end

----- ---- --- -- -

elseif tvar == "addspecialver" then
	if num == true then
		if (setto == 0) or (setto == 1) then
			if (setto ~= table_sets [tvar]) and (setto == 0) then
				VH:SetConfig ("config", "hub_version_special", "")
			elseif setto == 1 then
				VH:SetConfig ("config", "hub_version_special", string.format (getlang (765), "Ledokol "..ver_ledo))
			end

			ok = true
		else
			commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
		end

	else
		commandanswer (nick, string.format (getlang (198), tvar))
	end

----- ---- --- -- -

	elseif tvar == "ledobotnick" then
		if string.len (setto) > 0 then
			setto = repnickchars (setto)

			if (setto == table_sets [tvar]) or (getstatus (setto) == 1) then
				-- isbot (setto) == true
				commandanswer (nick, getlang (511))
				return nil
			end

			ok = true

			if table_sets ["addledobot"] == 1 then
				delhubrobot (table_sets [tvar])
				addhubrobot (setto, table_othsets ["ledobotdesc"]..table_othsets ["ledobottag"], 2, table_sets ["ledobotmail"], getownsize (true, table_sets ["ledobotsize"]))
				if table_sets ["useextrafeed"] == 0 then table_othsets ["feednick"] = setto end
				table_othsets ["sendfrom"] = setto
			end
		else
			commandanswer (nick, string.format (getlang (320), tvar))
		end

----- ---- --- -- -

elseif tvar == "ledobotmail" then
ok = true

----- ---- --- -- -

elseif tvar == "useextrafeed" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true

if setto == 1 then
table_othsets ["feednick"] = table_sets ["extrafeednick"]
else

if table_sets ["addledobot"] == 0 then
table_othsets ["feednick"] = table_othsets ["opchatnick"]
else
table_othsets ["feednick"] = table_sets ["ledobotnick"]
end
end

else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

elseif tvar == "extrafeednick" then
if string.len (setto) > 0 then
ok = true
setto = repnickchars (setto)
if table_sets ["useextrafeed"] == 1 then table_othsets ["feednick"] = setto end
else
commandanswer (nick, string.format (getlang (320), tvar))
end

----- ---- --- -- -

elseif tvar == "commandstopm" then
if num == true then
if (setto == 0) or (setto == 1) then
ok = true
else
commandanswer (nick, string.format (getlang (196), tvar, "0 "..getlang (197).." 1"))
end

else
commandanswer (nick, string.format (getlang (198), tvar))
end

----- ---- --- -- -

else -- unknown variable
commandanswer (nick, string.format (getlang (200), tvar))
end

if ok == true then -- finalize
commandanswer (nick, string.format (getlang (195), tvar, table_sets [tvar], setto))
opsnotify (table_sets ["classnoticonfig"], string.format (getlang (50), nick, ucls, tvar, table_sets [tvar], setto))
VH:SQLQuery ("update `"..tbl_sql ["conf"].."` set `value` = '"..repsqlchars (setto).."' where `variable` = '"..tvar.."' limit 1")
table_sets [tvar] = setto
oprankaccept (nick, ucls)
end
end

----- ---- --- -- -

function checkblacklist (ip)
	for _, bld in pairs (table_blst) do
		if ipinrange (bld.r, ip) == true then
			opsnotify (table_sets ["classnotiblist"], string.format (getlang (861), ip .. tryipcc (ip), repnmdcoutchars (bld.d))) -- notify
			return true
		end
	end

	return false
end

----- ---- --- -- -

function loadblacklist ()
	local f = io.open (table_othsets ["cfgdir"].."blacklist.txt")

	if f then
		f:close ()

		for l in io.lines (table_othsets ["cfgdir"].."blacklist.txt") do
			local p = string.find (l, ":")

			if p then
				table.insert (table_blst, {d = string.sub (l, 1, p - 1), r = string.sub (l, p + 1)})
			end
		end
	else
		return false
	end

	return true
end

----- ---- --- -- -

function sendhelp (nick)
local help = "\r\n\r\n .:: "..getlang (155)..":\r\n\r\n"
	local optrig = string.sub (getconfig ("cmd_start_op"), 1, 1)

	-- antispam
	help = help .. " " .. optrig .. table_cmnds ["antiadd"] .. " <" .. getlang (193) .. "> <" .. getlang (30) .. "> <" .. getlang (194) .. "> <" .. getlang (126) .. "> - " .. getlang (156) .. "\r\n"
help = help.." "..optrig..table_cmnds ["antilist"].." - "..getlang (131).."\r\n"
help = help.." "..optrig..table_cmnds ["antidel"].." <"..getlang (193).."> - "..getlang (158).."\r\n"
help = help.." "..optrig..table_cmnds ["antiexadd"].." <"..getlang (193).."> - "..getlang (159).."\r\n"
help = help.." "..optrig..table_cmnds ["antiexlist"].." - "..getlang (137).."\r\n"
help = help.." "..optrig..table_cmnds ["antiexdel"].." <"..getlang (193).."> - "..getlang (160).."\r\n\r\n"

-- search filter
help = help.." "..optrig..table_cmnds ["sefiadd"].." <"..getlang (193).."> <"..getlang (30).."> <"..getlang (194).."> <"..getlang (48).."> - "..getlang (225).."\r\n"
help = help.." "..optrig..table_cmnds ["sefilist"].." - "..getlang (222).."\r\n"
help = help.." "..optrig..table_cmnds ["sefidel"].." <"..getlang (193).."> - "..getlang (226).."\r\n"
help = help.." "..optrig..table_cmnds ["sefiexadd"].." <"..getlang (193).."> - "..getlang (284).."\r\n"
help = help.." "..optrig..table_cmnds ["sefiexlist"].." - "..getlang (286).."\r\n"
help = help.." "..optrig..table_cmnds ["sefiexdel"].." <"..getlang (193).."> - "..getlang (285).."\r\n\r\n"

	-- myinfo check
	help = help.." "..optrig..table_cmnds ["myinfadd"].." <"..getlang (48).."> <"..getlang (193).."> ["..getlang (318).."] - "..getlang (161).."\r\n"
	help = help.." "..optrig..table_cmnds ["myinflist"].." <"..getlang (48).."> - "..getlang (163).."\r\n"
	help = help.." "..optrig..table_cmnds ["myinfdel"].." <"..getlang (48).."> <"..getlang (193).."> - "..getlang (162).."\r\n\r\n"

-- protection list
help = help.." "..optrig..table_cmnds ["protadd"].." <"..getlang (193).."> - "..getlang (124).."\r\n"
help = help.." "..optrig..table_cmnds ["protlist"].." - "..getlang (607).."\r\n"
help = help.." "..optrig..table_cmnds ["protdel"].." <"..getlang (193).."> - "..getlang (125).."\r\n\r\n"

-- ip authorization
help = help.." "..optrig..table_cmnds ["authadd"].." <"..getlang (178).."> <"..getlang (193).."> - "..getlang (241).."\r\n"
help = help.." "..optrig..table_cmnds ["authmod"].." <"..getlang (185).."> <"..getlang (193).."> - "..getlang (785).."\r\n"
help = help.." "..optrig..table_cmnds ["authlist"].." - "..getlang (239).."\r\n"
help = help.." "..optrig..table_cmnds ["authdel"].." <"..getlang (185).."> - "..getlang (242).."\r\n\r\n"

-- ranks
help = help.." "..optrig..table_cmnds ["myoprank"].." - "..getlang (175).."\r\n"
help = help.." "..optrig..table_cmnds ["ranexadd"].." <"..getlang (178).."> - "..getlang (216).."\r\n"
help = help.." "..optrig..table_cmnds ["ranexlist"].." - "..getlang (214).."\r\n"
help = help.." "..optrig..table_cmnds ["ranexdel"].." <"..getlang (178).."> - "..getlang (217).."\r\n"
help = help.." "..optrig..table_cmnds ["randel"].." <"..getlang (48).."> <"..getlang (205).."> - "..getlang (166).."\r\n"
help = help.." "..optrig..table_cmnds ["ranclean"].." <"..getlang (48).."> <"..getlang (373).."> - "..getlang (372).."\r\n\r\n"

-- welcome messages
help = help.." "..optrig..table_cmnds ["wmforce"].." <"..getlang (48).."> <"..getlang (178).."> ["..getlang (44).."] - "..getlang (484).."\r\n"
help = help.." "..optrig..table_cmnds ["wmlist"].." - "..getlang (252).."\r\n"
help = help.." "..optrig..table_cmnds ["wmdel"].." <"..getlang (178).."> - "..getlang (253).."\r\n\r\n"

-- chatrooms
help = help.." "..optrig..table_cmnds ["chatadd"].." <"..getlang (178).."> <"..getlang (269).."> <"..getlang (270).."> <"..getlang (271).."> <"..getlang (789).."> - "..getlang (266).."\r\n"
help = help.." "..optrig..table_cmnds ["chatlist"].." - "..getlang (267).."\r\n"
help = help.." "..optrig..table_cmnds ["chatdel"].." <"..getlang (178).."> - "..getlang (268).."\r\n\r\n"

-- reminders
help = help.." "..optrig..table_cmnds ["remadd"].." <"..getlang (185).."> <"..getlang (380).."> <"..getlang (270).."> <"..getlang (271).."> <"..getlang (381).."> <"..getlang (382).."> - "..getlang (383).."\r\n"
help = help.." "..optrig..table_cmnds ["remlist"].." - "..getlang (385).."\r\n"
help = help.." "..optrig..table_cmnds ["remshow"].." <"..getlang (185).."> - "..getlang (509).."\r\n"
help = help.." "..optrig..table_cmnds ["remdel"].." <"..getlang (185).."> - "..getlang (384).."\r\n\r\n"

	-- no pm
	help = help.." "..optrig..table_cmnds ["nopmadd"].." <"..getlang (178).."> <"..getlang (194).."> <"..getlang (271).."> <"..getlang (828).."> - "..getlang (829).."\r\n"
	help = help.." "..optrig..table_cmnds ["nopmlist"].." - "..getlang (831).."\r\n"
	help = help.." "..optrig..table_cmnds ["nopmdel"].." <"..getlang (178).."> - "..getlang (830).."\r\n\r\n"

	-- right click menu
	help = help .. " " .. optrig .. table_cmnds ["rcmenuadd"] .. " <\"" .. getlang (823) .. "\"> <\"" .. getlang (420) .. "\"> <" .. getlang (48) .. "> <" .. getlang (104) .. "> <" .. getlang (150) .. "> <" .. getlang (270) .. "> <" .. getlang (271) .. "> - " .. getlang (858) .. "\r\n"
	help = help .. " " .. optrig .. table_cmnds ["rcmenulist"] .. " - " .. getlang (860) .. "\r\n"
	help = help .. " " .. optrig .. table_cmnds ["rcmenudel"] .. " <" .. getlang (185) .. "> - " .. getlang (859) .. "\r\n"
	help = help .. " " .. optrig .. table_cmnds ["rcmenuord"] .. " <" .. getlang (185) .. "> <" .. getlang (150) .. "> - " .. getlang (208) .. "\r\n\r\n"

	-- ip watch
	help = help.." "..optrig..table_cmnds ["ipwatadd"].." <"..getlang (193).."> <\""..getlang (828).."\"> <"..getlang (866).."> - "..getlang (863).."\r\n"
	help = help.." "..optrig..table_cmnds ["ipwatlist"].." - "..getlang (865).."\r\n"
	help = help.." "..optrig..table_cmnds ["ipwatdel"].." <"..getlang (193).."> - "..getlang (864).."\r\n\r\n"

	-- hard ban
	help = help.." "..optrig..table_cmnds ["hban"].." <"..getlang (193).."> <\""..getlang (828).."\"> - "..getlang (845).."\r\n"
	help = help.." "..optrig..table_cmnds ["hbans"].." - "..getlang (847).."\r\n"
	help = help.." "..optrig..table_cmnds ["hunban"].." <"..getlang (193).."> - "..getlang (846).."\r\n\r\n"

-- news
help = help.." "..optrig..table_cmnds ["newsadd"].." <"..getlang (120).."> - "..getlang (453).."\r\n"
help = help.." "..optrig..table_cmnds ["newsdel"].." <"..getlang (102).."> - "..getlang (454).."\r\n\r\n"

-- chat replacer
help = help.." "..optrig..table_cmnds ["repladd"].." <\""..getlang (193).."\"> <\""..getlang (810).."\"> <"..getlang (271).."> - "..getlang (811).."\r\n"
help = help.." "..optrig..table_cmnds ["repllist"].." - "..getlang (801).."\r\n"
help = help.." "..optrig..table_cmnds ["repldel"].." <"..getlang (185).."> - "..getlang (812).."\r\n"
help = help.." "..optrig..table_cmnds ["replexadd"].." <"..getlang (178).." "..getlang (197).." "..getlang (243).."> - "..getlang (813).."\r\n"
help = help.." "..optrig..table_cmnds ["replexlist"].." - "..getlang (808).."\r\n"
help = help.." "..optrig..table_cmnds ["replexdel"].." <"..getlang (178).." "..getlang (197).." "..getlang (243).."> - "..getlang (814).."\r\n\r\n"

-- chat responder
help = help.." "..optrig..table_cmnds ["respadd"].." <\""..getlang (193).."\"> <\""..getlang (400).."\"> <"..getlang (271).."> - "..getlang (401).."\r\n"
help = help.." "..optrig..table_cmnds ["resplist"].." - "..getlang (403).."\r\n"
help = help.." "..optrig..table_cmnds ["respdel"].." <"..getlang (185).."> - "..getlang (402).."\r\n"
help = help.." "..optrig..table_cmnds ["respexadd"].." <"..getlang (178).." "..getlang (197).." "..getlang (243).."> - "..getlang (412).."\r\n"
help = help.." "..optrig..table_cmnds ["respexlist"].." - "..getlang (414).."\r\n"
help = help.." "..optrig..table_cmnds ["respexdel"].." <"..getlang (178).." "..getlang (197).." "..getlang (243).."> - "..getlang (413).."\r\n\r\n"

-- offline messenger
help = help.." "..optrig..table_cmnds ["offlist"].." - "..getlang (168).."\r\n"
help = help.." "..optrig..table_cmnds ["offdel"].." <"..getlang (102).."> - "..getlang (169).."\r\n"
help = help.." "..optrig..table_cmnds ["offclean"].." - "..getlang (170).."\r\n\r\n"

	-- history
	help = help .. " " .. optrig .. table_cmnds ["ophistory"] .. " <" .. getlang (209) .. "> - " .. getlang (173) .. "\r\n"
	help = help .. " " .. optrig .. table_cmnds ["histclean"] .. " - " .. getlang (174) .. "\r\n\r\n"

-- commands
help = help.." "..optrig..table_cmnds ["cmndset"].." <"..getlang (420).."> <"..getlang (420).."> - "..getlang (421).."\r\n"
help = help.." "..optrig..table_cmnds ["cmndshow"].." - "..getlang (651).."\r\n"
help = help.." "..optrig..table_cmnds ["cmndreset"].." - "..getlang (426).."\r\n"
help = help.." "..optrig..table_cmnds ["clog"].." <"..getlang (209).."> - "..getlang (779).."\r\n"
help = help.." "..optrig..table_cmnds ["cmndadd"].." <"..getlang (193).."> <"..getlang (171).."> - "..getlang (336).."\r\n"
help = help.." "..optrig..table_cmnds ["cmndlist"].." - "..getlang (338).."\r\n"
help = help.." "..optrig..table_cmnds ["cmnddel"].." <"..getlang (193).."> - "..getlang (337).."\r\n"
help = help.." "..optrig..table_cmnds ["cmndexadd"].." <"..getlang (193).."> - "..getlang (296).."\r\n"
help = help.." "..optrig..table_cmnds ["cmndexlist"].." - "..getlang (298).."\r\n"
help = help.." "..optrig..table_cmnds ["cmndexdel"].." <"..getlang (193).."> - "..getlang (297).."\r\n\r\n"

-- custom nicks
help = help.." "..optrig..table_cmnds ["rename"].." <"..getlang (178).."> <"..getlang (178).."> - "..getlang (467).."\r\n"
help = help.." "..optrig..table_cmnds ["custdel"].." <"..getlang (178).."> - "..getlang (329).."\r\n\r\n"

-- registered users
help = help.." "..optrig..table_cmnds ["regname"].." <"..getlang (178).."> <"..getlang (178).."> - "..getlang (486).."\r\n"
help = help.." "..optrig..table_cmnds ["reglist"].." <"..getlang (171).."> <"..getlang (149).."> - "..getlang (164).."\r\n"
help = help.." "..optrig..table_cmnds ["regfind"].." <"..getlang (178).."> - "..getlang (686).."\r\n"
help = help.." "..optrig..table_cmnds ["regstats"].." - "..getlang (687).."\r\n\r\n"

-- hublist
help = help.." "..optrig..table_cmnds ["hubadd"].." <"..getlang (522).."> <\""..getlang (470).."\"> <\""..getlang (523).."\"> - "..getlang (524).."\r\n"
help = help.." "..optrig..table_cmnds ["hubdel"].." <"..getlang (522).."> - "..getlang (525).."\r\n\r\n"

-- chat
help = help.." "..optrig..table_cmnds ["mode"].." <"..getlang (193).."> <"..getlang (632).."> - "..getlang (630).."\r\n"
help = help.." "..optrig..table_cmnds ["mode"].." - "..getlang (635).."\r\n"
help = help.." "..optrig..table_cmnds ["say"].." <"..getlang (178).."> <"..getlang (44).."> - "..getlang (165).."\r\n"
help = help.." "..optrig..table_cmnds ["clear"].." - "..getlang (684).."\r\n\r\n"

	-- ip gag
	help = help .. " " .. optrig .. table_cmnds ["gagipadd"] .. " <" .. getlang (193) .. "> <" .. getlang (126) .. "> - " .. getlang (641) .. "\r\n"
	help = help .. " " .. optrig .. table_cmnds ["gagiplist"] .. " - " .. getlang (646) .. "\r\n"
	help = help .. " " .. optrig .. table_cmnds ["gagipdel"] .. " <" .. getlang (193) .. " " .. getlang (197) .. " *> - " .. getlang (648) .. "\r\n\r\n"

	-- cc gag
	help = help.." "..optrig..table_cmnds ["gagccadd"].." <"..getlang (789).."> <"..getlang (126).."> - "..getlang (877).."\r\n"
	help = help.." "..optrig..table_cmnds ["gagcclist"].." - "..getlang (882).."\r\n"
	help = help.." "..optrig..table_cmnds ["gagccdel"].." <"..getlang (789).." "..getlang (197).." *> - "..getlang (884).."\r\n\r\n"

	-- user logger
	help = help .. " " .. optrig .. table_cmnds ["userinfo"] .. " <" .. getlang (178) .. "> - " .. getlang (703) .. "\r\n"
	help = help .. " " .. optrig .. table_cmnds ["ipinfo"] .. " <" .. getlang (243) .. "> - " .. getlang (930) .. "\r\n"
	help = help .. " " .. optrig .. table_cmnds ["ulog"] .. " <" .. getlang (48) .. "> <" .. getlang (120) .. "> <" .. getlang (209) .. "> - " .. getlang (406) .. "\r\n"
	help = help .. " " .. optrig .. table_cmnds ["seen"] .. " <" .. getlang (178) .. "> - " .. string.format (getlang (637), "http://www.te-home.net/?do=hublist") .. "\r\n\r\n"

	-- other
	help = help .. " " .. optrig .. table_cmnds ["dropip"] .. " <" .. getlang (243) .. "> - " .. getlang (919) .. "\r\n"
	help = help .. " " .. optrig .. table_cmnds ["cleanup"] .. " <" .. getlang (48) .. "> <" .. getlang (4) .. " " .. getlang (197) .. " *> [" .. getlang (171) .. "] - " .. getlang (172) .. "\r\n"
	help = help .. " " .. optrig .. table_cmnds ["readlog"] .. " <" .. getlang (292) .. "> <" .. getlang (209) .. "> - " .. getlang (293) .. "\r\n\r\n"

-- ledokol commands
help = help.." "..optrig..table_cmnds ["ledoconf"].." - "..getlang (176).."\r\n"
help = help.." "..optrig..table_cmnds ["ledoset"].." <"..getlang (204).."> <"..getlang (205).."> - "..getlang (177).."\r\n"
help = help.." "..optrig..table_cmnds ["ledover"].." - "..getlang (10).."\r\n"
help = help.." "..optrig..table_cmnds ["ledohelp"].." - "..getlang (179).."\r\n"
help = help.." "..optrig..table_cmnds ["ledostats"].." - "..getlang (188).."\r\n\r\n"

	-- experts only commands
	if getclass (nick) == 10 then
		help = help.." .:: "..getlang (844)..":\r\n\r\n"

		if getledoconf ("allow_sql") == 1 then
			help = help.." "..optrig..table_cmnds ["ledosql"].." <"..getlang (841).."> - "..getlang (842).."\r\n"
		end

		if getledoconf ("allow_shell") == 1 then
			help = help.." "..optrig..table_cmnds ["ledoshell"].." <"..getlang (420).."> - "..getlang (843).."\r\n"
		end

		help = help.." "..optrig..table_cmnds ["ledokoluninstallisconfirmed"].." - "..getlang (769).."\r\n\r\n"
	end

	help = help.." .:: "..getlang (180)..":\r\n\r\n"

	local ustrig = string.sub (getconfig ("cmd_start_user"), 1, 1)

-- ranks
help = help.." "..ustrig..table_cmnds ["mychatrank"].." - "..getlang (182).."\r\n"
help = help.." "..ustrig..table_cmnds ["mysharerank"].." - "..getlang (323).."\r\n"
help = help.." "..ustrig..table_cmnds ["chatranks"].." - "..string.format (getlang (116), table_sets ["ranklimit"]).."\r\n"
help = help.." "..ustrig..table_cmnds ["shareranks"].." - "..string.format (getlang (324), table_sets ["ranklimit"]).."\r\n"
help = help.." "..ustrig..table_cmnds ["opranks"].." - "..string.format (getlang (118), table_sets ["ranklimit"]).."\r\n"
help = help.." "..ustrig..table_cmnds ["searranks"].." - "..string.format (getlang (694), table_sets ["ranklimit"]).."\r\n"
help = help.." "..ustrig..table_cmnds ["wordranks"].." - "..string.format (getlang (439), table_sets ["ranklimit"]).."\r\n"
	help = help .. " " .. ustrig .. table_cmnds ["cclive"] .. " - " .. getlang (512) .. "\r\n"
	help = help .. " " .. ustrig .. table_cmnds ["citylive"] .. " <" .. getlang (789) .. "> - " .. getlang (923) .. "\r\n"
	help = help .. " " .. ustrig .. table_cmnds ["cchist"] .. " - " .. getlang (513) .. "\r\n\r\n"

-- releases
help = help.." "..ustrig..table_cmnds ["reladd"].." <\""..getlang (470).."\"> <\""..getlang (471).."\"> ["..getlang (472).."] - "..getlang (473).."\r\n"
help = help.." "..ustrig..table_cmnds ["reldel"].." <"..getlang (48).."> <"..getlang (470).."> - "..getlang (474).."\r\n"
help = help.." "..ustrig..table_cmnds ["rellist"].." <"..getlang (48).."> <"..getlang (209).."> ["..getlang (471).." "..getlang (197).." "..getlang (310).."] - "..getlang (475).."\r\n"
help = help.." "..ustrig..table_cmnds ["relfind"].." <"..getlang (470).."> - "..getlang (476).."\r\n\r\n"

-- welcome messages
help = help.." "..ustrig..table_cmnds ["wmset"].." <"..getlang (48).."> ["..getlang (44).."] - "..getlang (249).."\r\n"
help = help.." "..ustrig..table_cmnds ["wmshow"].." - "..getlang (251).."\r\n\r\n"

-- custom nicks
help = help.." "..ustrig..table_cmnds ["nick"].." ["..getlang (178).."] - "..getlang (247).."\r\n"
help = help.." "..ustrig..table_cmnds ["realnick"].." <"..getlang (178).."> - "..getlang (367).."\r\n"
help = help.." "..ustrig..table_cmnds ["custlist"].." - "..getlang (154).."\r\n\r\n"

	-- chat history
	help = help .. " " .. ustrig .. table_cmnds ["history"] .. " <" .. getlang (209) .. "> - " .. getlang (187) .. "\r\n"
	help = help .. " " .. ustrig .. table_cmnds ["myhistory"] .. " <" .. getlang (209) .. "> - " .. getlang (464) .. "\r\n\r\n"

	-- other

	help = help .. " " .. ustrig .. table_cmnds ["votekick"] .. " <" .. getlang (178) .. "> - " .. getlang (964) .. "\r\n"
help = help.." "..ustrig..table_cmnds ["mode"].." <"..getlang (632).."> - "..getlang (630).."\r\n"
help = help.." "..ustrig..table_cmnds ["offmsg"].." <"..getlang (178).."> <"..getlang (44).."> - "..getlang (186).."\r\n"
help = help.." "..ustrig..table_cmnds ["calculate"].." <"..getlang (479).."> - "..getlang (480).."\r\n"
help = help.." "..ustrig..table_cmnds ["hubnews"].." <"..getlang (209).."> - "..getlang (455).."\r\n"
help = help.." "..ustrig..table_cmnds ["showtopic"].." - "..getlang (181).."\r\n"
help = help.." "..ustrig..table_cmnds ["showhubs"].." - "..getlang (526).."\r\n\r\n"

help = help.." .:: "..getlang (624)..":\r\n\r\n"

-- chatroom commands
help = help..chatroomhelp ().."\r\n"

	-- help notes
	help = help .. " .:: " .. getlang (926) .. ":\r\n\r\n"

	help = help .. " " .. string.format (getlang (928), "<" .. getlang (927) .. ">", "[" .. getlang (927) .. "]") .. "\r\n"
	help = help .. " " .. string.format (getlang (929), "<\"" .. getlang (927) .. "\">", "[\"" .. getlang (927) .. "\"]") .. "\r\n\r\n"

help = help.." .:: "..getlang (768)..":\r\n\r\n"

-- additional help
help = help.." dchub://"..table_othsets ["vazhub"].."/ - VAZ\r\n"

commandanswer (nick, help)
end

----- ---- --- -- -

function sendstats (nick)
local entchatran = counttable (tbl_sql ["chran"])
local cntchatran = countranks (tbl_sql ["chran"])
local mesperuser = 0
if entchatran > 0 then mesperuser = cntchatran / entchatran end

local stats = "\r\n\r\n .:: "..getlang (188)..":\r\n"
stats = stats.."\r\n "..string.format (getlang (189), ver_ledo).." ["..table_othsets ["langver"].."]"
stats = stats.."\r\n "..string.format (getlang (201), "Verlihub", (getconfig ("hub_version") or getlang (184)))
stats = stats.."\r\n "..string.format (getlang (536), "Lua", (table_othsets ["ver_luaplug"] or getlang (184)))
stats = stats.."\r\n "..string.format (getlang (207), "Lua", (table_othsets ["ver_lua"] or getlang (184)))
	--stats = stats .. "\r\n " .. string.format (getlang (201), "LuaSocket", (table_othsets ["ver_sock"] or getlang (202)))
	--stats = stats .. "\r\n " .. string.format (getlang (201), "LTN12", (table_othsets ["ver_ltn12"] or getlang (184)))
stats = stats.."\r\n "..string.format (getlang (201), "MySQL", (table_othsets ["ver_sql"] or getlang (184)))
stats = stats.."\r\n "..string.format (getlang (201), "cURL", (table_othsets ["ver_curl"] or getlang (184)))
	--stats = stats .. "\r\n " .. string.format (getlang (201), "iConv", (table_othsets ["ver_iconv"] or getlang (184)))
stats = stats.."\r\n"
stats = stats.."\r\n "..string.format (getlang (433), formatuptime (table_othsets ["uptime"], false))
local mu = makesize (getmemusg ()) -- memory

if table_sets ["statscollint"] > 0 then
	local _, rows = VH:SQLQuery ("select `count` from `"..tbl_sql ["stat"].."` where `type` = 'memory_peak' limit 1")

	if rows > 0 then
		local _, pmu = VH:SQLFetch (0)
		mu = mu.." ][ "..makesize (pmu)
	end
end

stats = stats.."\r\n "..string.format (getlang (465), mu)
stats = stats.."\r\n "..string.format (getlang (654), getownlinecnt (), makesize (getownsize (false, nil)))

if table_othsets ["func_getuptime"] == true then -- hub uptime
	local ut = formatuptime ((os.time () - getuptime ()), true)

	if table_sets ["statscollint"] > 0 then
		local _, rows = VH:SQLQuery ("select `count` from `"..tbl_sql ["stat"].."` where `type` = 'uptime_peak' limit 1")

		if rows > 0 then
			local _, put = VH:SQLFetch (0)
			ut = ut.." ][ "..formatuptime ((os.time () - tonumber (put)), true)
		end
	end

	stats = stats.."\r\n "..string.format (getlang (773), ut)
end

	local uc = getusercount () -- users
	local val = uc

	if table_sets ["statscollint"] > 0 then
		local _, rows = VH:SQLQuery ("select `count` from `"..tbl_sql ["stat"].."` where `type` = 'users_peak' limit 1")

		if rows > 0 then
			local _, puc = VH:SQLFetch (0)
			val = uc.." ][ "..puc
		end
	end

	stats = stats.."\r\n "..string.format (getlang (774), val)

	local ts = gettotsharesize () -- share
	val = makesize (ts)

	if table_sets ["statscollint"] > 0 then
		local _, rows = VH:SQLQuery ("select `count` from `"..tbl_sql ["stat"].."` where `type` = 'share_peak' limit 1")

		if rows > 0 then
			local _, pts = VH:SQLFetch (0)
			val = val.." ][ "..makesize (pts)
		end
	end

	stats = stats.."\r\n "..string.format (getlang (775), val)

	-- average share per user

	if (uc > 0) and (ts > 0) then
		val = makesize (roundint ((ts / uc), 0))

		if table_sets ["statscollint"] > 0 then
			local _, rows = VH:SQLQuery ("select `count` from `"..tbl_sql ["stat"].."` where `type` = 'avgshare_peak' limit 1")

			if rows > 0 then
				local _, pavg = VH:SQLFetch (0)
				val = val.." ][ "..makesize (pavg)
			end
		end

		stats = stats.."\r\n "..string.format (getlang (826), val)
	end

stats = stats.."\r\n "..string.format (getlang (692), table_othsets ["cfgdir"])
stats = stats.."\r\n "..string.format (getlang (702), (getulimit () or getlang (184)))
stats = stats.."\r\n"
stats = stats.."\r\n "..string.format (getlang (190), cntchatran)
stats = stats.."\r\n "..string.format (getlang (113), makesize (countranks (tbl_sql ["shran"])))
stats = stats.."\r\n "..string.format (getlang (191), countranks (tbl_sql ["opran"]))
stats = stats.."\r\n "..string.format (getlang (344), countranks (tbl_sql ["srran"]))
stats = stats.."\r\n "..string.format (getlang (444), countranks (tbl_sql ["wdran"]))
stats = stats.."\r\n "..string.format (getlang (192), roundint (mesperuser, 2))
stats = stats.."\r\n"
stats = stats.."\r\n "..string.format (getlang (230), counttable ("kicklist"), "C", (getledoconf ("limcleankick") or 0), fromunixtime ((getledoconf ("lastcleankick") or 0), true))
stats = stats.."\r\n "..string.format (getlang (231), counttable ("banlist"), "C", (getledoconf ("limcleanban") or 0), fromunixtime ((getledoconf ("lastcleanban") or 0), true))
stats = stats.."\r\n "..string.format (getlang (232), counttable ("unbanlist"), "C", (getledoconf ("limcleanunban") or 0), fromunixtime ((getledoconf ("lastcleanunban") or 0), true))
stats = stats.."\r\n "..string.format (getlang (333), counttable ("reglist"), "C", (getledoconf ("limcleanreg") or 0), fromunixtime ((getledoconf ("lastcleanreg") or 0), true))
stats = stats.."\r\n "..string.format (getlang (123), counttable (tbl_sql ["ulog"]), "C", (getledoconf ("limcleanulog") or 0), fromunixtime ((getledoconf ("lastcleanulog") or 0), true))
stats = stats.."\r\n "..string.format (getlang (783), counttable (tbl_sql ["clog"]), "C", (getledoconf ("limcleanclog") or 0), fromunixtime ((getledoconf ("lastcleanclog") or 0), true))
stats = stats.."\r\n "..string.format (getlang (604), counttable (tbl_sql ["rel"]), "C", (getledoconf ("limcleanrel") or 0), fromunixtime ((getledoconf ("lastcleanrel") or 0), true))
stats = stats.."\r\n "..string.format (getlang (377), counttable (tbl_sql ["chran"]), "C", (getledoconf ("limcleanchran") or 0), fromunixtime ((getledoconf ("lastcleanchran") or 0), true))
stats = stats.."\r\n "..string.format (getlang (378), counttable (tbl_sql ["shran"]), "C", (getledoconf ("limcleanshran") or 0), fromunixtime ((getledoconf ("lastcleanshran") or 0), true))
stats = stats.."\r\n "..string.format (getlang (379), counttable (tbl_sql ["opran"]), "C", (getledoconf ("limcleanopran") or 0), fromunixtime ((getledoconf ("lastcleanopran") or 0), true))
stats = stats.."\r\n "..string.format (getlang (699), counttable (tbl_sql ["srran"]), "C", (getledoconf ("limcleansrran") or 0), fromunixtime ((getledoconf ("lastcleansrran") or 0), true))
stats = stats.."\r\n "..string.format (getlang (443), counttable (tbl_sql ["wdran"]), "C", (getledoconf ("limcleanwdran") or 0), fromunixtime ((getledoconf ("lastcleanwdran") or 0), true))
stats = stats.."\r\n "..string.format (getlang (700), counttable (tbl_sql ["ccstat"]), "C", fromunixtime ((getledoconf ("date_ccstats") or 0), true))
stats = stats.."\r\n "..string.format (getlang (233), counttable ("pi_iplog"), "C", (getledoconf ("limcleaniplog") or 0), fromunixtime ((getledoconf ("lastcleaniplog") or 0), true))
stats = stats.."\r\n "..string.format (getlang (234), counttable ("pi_stats"), "C", (getledoconf ("limcleanstats") or 0), fromunixtime ((getledoconf ("lastcleanstats") or 0), true)).."\r\n"

commandanswer (nick, stats)
end

----- ---- --- -- -

function showledoconf (nick)
local conf = getlang (176)..":\r\n"

conf = conf.."\r\n [::] mincommandclass = "..table_sets ["mincommandclass"]
conf = conf.."\r\n [::] minusrcommandclass = "..table_sets ["minusrcommandclass"]
conf = conf.."\r\n [::] commandstopm = "..table_sets ["commandstopm"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] scanbelowclass = "..table_sets ["scanbelowclass"]
conf = conf.."\r\n [::] thirdacttime = "..table_sets ["thirdacttime"]
conf = conf.."\r\n [::] seventhacttime = "..table_sets ["seventhacttime"]
conf = conf.."\r\n [::] sixthactaddr = "..table_sets ["sixthactaddr"]
conf = conf.."\r\n [::] ninthactrepmsg = "..table_sets ["ninthactrepmsg"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] enableantispam = "..table_sets ["enableantispam"]
	conf = conf .. "\r\n [::] antibelowclass = " .. table_sets ["antibelowclass"]
conf = conf.."\r\n [::] allowspamtoops = "..table_sets ["allowspamtoops"]
conf = conf.."\r\n [::] checkcmdspam = "..table_sets ["checkcmdspam"]
conf = conf.."\r\n [::] antikreason = "..table_sets ["antikreason"]
conf = conf.."\r\n [::] antimessage = "..table_sets ["antimessage"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] enablesearfilt = "..table_sets ["enablesearfilt"]
conf = conf.."\r\n [::] sefireason = "..table_sets ["sefireason"]
conf = conf.."\r\n [::] searfiltmsg = "..table_sets ["searfiltmsg"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] classnotianti = "..table_sets ["classnotianti"]
conf = conf.."\r\n [::] classnotiex = "..table_sets ["classnotiex"]
conf = conf.."\r\n [::] classnotisefi = "..table_sets ["classnotisefi"]
conf = conf.."\r\n [::] classnotimich = "..table_sets ["classnotimich"]
conf = conf.."\r\n [::] classnotiflood = "..table_sets ["classnotiflood"]
conf = conf.."\r\n [::] classnotigagip = "..table_sets ["classnotigagip"]
conf = conf.."\r\n [::] classnoticom = "..table_sets ["classnoticom"]
conf = conf.."\r\n [::] classnotisay = "..table_sets ["classnotisay"]
	conf = conf .. "\r\n [::] classnotirepl = " .. table_sets ["classnotirepl"]
	conf = conf .. "\r\n [::] classnotikick = " .. table_sets ["classnotikick"]
	conf = conf .. "\r\n [::] classnotiban = " .. table_sets ["classnotiban"]
conf = conf.."\r\n [::] classnotireg = "..table_sets ["classnotireg"]
conf = conf.."\r\n [::] classnoticonfig = "..table_sets ["classnoticonfig"]
conf = conf.."\r\n [::] classnotiredir = "..table_sets ["classnotiredir"]
conf = conf.."\r\n [::] classnotibadctm = "..table_sets ["classnotibadctm"]
conf = conf.."\r\n [::] classnotiunk = "..table_sets ["classnotiunk"]
conf = conf.."\r\n [::] classnotioff = "..table_sets ["classnotioff"]
conf = conf.."\r\n [::] classnotiledoact = "..table_sets ["classnotiledoact"]
conf = conf.."\r\n [::] classnotiprotoflood = "..table_sets ["classnotiprotoflood"]
conf = conf.."\r\n [::] classnotiauth = "..table_sets ["classnotiauth"]
conf = conf.."\r\n [::] classnotiwelcome = "..table_sets ["classnotiwelcome"]
conf = conf.."\r\n [::] classnotibotpm = "..table_sets ["classnotibotpm"]
conf = conf.."\r\n [::] classnotihardban = "..table_sets ["classnotihardban"]
conf = conf.."\r\n [::] classnotiipwatch = "..table_sets ["classnotiipwatch"]
conf = conf.."\r\n [::] classnotiblist = "..table_sets ["classnotiblist"]
conf = conf.."\r\n [::] classnoticust = "..table_sets ["classnoticust"]
conf = conf.."\r\n [::] classnotipeakuc = "..table_sets ["classnotipeakuc"]
conf = conf.."\r\n [::] classnotipeakts = "..table_sets ["classnotipeakts"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] micheck = "..table_sets ["micheck"]
conf = conf.."\r\n [::] micallall = "..table_sets ["micallall"]
conf = conf.."\r\n [::] michnick = "..table_sets ["michnick"]
conf = conf.."\r\n [::] michdesc = "..table_sets ["michdesc"]
conf = conf.."\r\n [::] michtag = "..table_sets ["michtag"]
conf = conf.."\r\n [::] michconn = "..table_sets ["michconn"]
conf = conf.."\r\n [::] michemail = "..table_sets ["michemail"]
conf = conf.."\r\n [::] michshare = "..table_sets ["michshare"]
conf = conf.."\r\n [::] michip = "..table_sets ["michip"]
conf = conf.."\r\n [::] michcc = "..table_sets ["michcc"]
conf = conf.."\r\n [::] michdns = "..table_sets ["michdns"]
	conf = conf .. "\r\n [::] michsup = " .. table_sets ["michsup"]
	conf = conf .. "\r\n [::] michver = " .. table_sets ["michver"]
conf = conf.."\r\n [::] michfakenum = "..table_sets ["michfakenum"]
conf = conf.."\r\n [::] michfakediv = "..table_sets ["michfakediv"]
conf = conf.."\r\n [::] michclone = "..table_sets ["michclone"]
conf = conf.."\r\n [::] michsameip = "..table_sets ["michsameip"]
conf = conf.."\r\n [::] minickmessage = "..table_sets ["minickmessage"]
conf = conf.."\r\n [::] midescmessage = "..table_sets ["midescmessage"]
conf = conf.."\r\n [::] mitagmessage = "..table_sets ["mitagmessage"]
conf = conf.."\r\n [::] miconnmessage = "..table_sets ["miconnmessage"]
conf = conf.."\r\n [::] miemailmessage = "..table_sets ["miemailmessage"]
conf = conf.."\r\n [::] misharemessage = "..table_sets ["misharemessage"]
conf = conf.."\r\n [::] miipmessage = "..table_sets ["miipmessage"]
conf = conf.."\r\n [::] miccmessage = "..table_sets ["miccmessage"]
conf = conf.."\r\n [::] midnsmessage = "..table_sets ["midnsmessage"]
	conf = conf .. "\r\n [::] misupmessage = " .. table_sets ["misupmessage"]
	conf = conf .. "\r\n [::] mivermessage = " .. table_sets ["mivermessage"]
conf = conf.."\r\n [::] mifakemessage = "..table_sets ["mifakemessage"]
conf = conf.."\r\n [::] miclonemessage = "..table_sets ["miclonemessage"]
conf = conf.."\r\n [::] misameipmessage = "..table_sets ["misameipmessage"]
	conf = conf .. "\r\n [::] mitbantime = " .. table_sets ["mitbantime"]
	conf = conf .. "\r\n [::] miclonekicktime = " .. table_sets ["miclonekicktime"]
	conf = conf .. "\r\n"
conf = conf .. "\r\n [::] kickunkusers = " .. table_sets ["kickunkusers"]
conf = conf .. "\r\n [::] unkbeforelogin = " .. table_sets ["unkbeforelogin"]
conf = conf.."\r\n [::] unktbantime = "..table_sets ["unktbantime"]
conf = conf.."\r\n [::] unkkickreason = "..table_sets ["unkkickreason"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] authrunning = "..table_sets ["authrunning"]
conf = conf.."\r\n [::] authmessage = "..table_sets ["authmessage"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] regkickaction = "..table_sets ["regkickaction"]
conf = conf.."\r\n [::] regmechatcnt = "..table_sets ["regmechatcnt"]
conf = conf.."\r\n [::] regmeuptime = "..table_sets ["regmeuptime"]
conf = conf.."\r\n [::] searchuptime = "..table_sets ["searchuptime"]
conf = conf.."\r\n [::] searuptimeact = "..table_sets ["searuptimeact"]
conf = conf.."\r\n [::] showuseruptime = "..table_sets ["showuseruptime"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] custnickclass = "..table_sets ["custnickclass"]
conf = conf.."\r\n [::] custmaxlen = "..table_sets ["custmaxlen"]
conf = conf.."\r\n [::] savecustnicks = "..table_sets ["savecustnicks"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] opkeyclass = "..table_sets ["opkeyclass"]
conf = conf.."\r\n [::] opkeyshare = "..table_sets ["opkeyshare"]
conf = conf.."\r\n [::] opkeyself = "..table_sets ["opkeyself"]
	conf = conf .. "\r\n"
	conf = conf .. "\r\n [::] enablevipkick = " .. table_sets ["enablevipkick"]
	conf = conf .. "\r\n [::] votekickclass = " .. table_sets ["votekickclass"]
	conf = conf .. "\r\n [::] votekickcount = " .. table_sets ["votekickcount"]
	conf = conf .. "\r\n"
conf = conf.."\r\n [::] relmodclass = "..table_sets ["relmodclass"]
conf = conf.."\r\n [::] welcomeclass = "..table_sets ["welcomeclass"]
conf = conf.."\r\n [::] offmsgclass = "..table_sets ["offmsgclass"]
	conf = conf .. "\r\n [::] mchistclass = " .. table_sets ["mchistclass"]
conf = conf.."\r\n [::] chatmodeclass = "..table_sets ["chatmodeclass"]
conf = conf.."\r\n [::] sayclass = "..table_sets ["sayclass"]
conf = conf.."\r\n [::] clearclass = "..table_sets ["clearclass"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] chatrunning = "..table_sets ["chatrunning"]
conf = conf.."\r\n [::] ccroomrunning = "..table_sets ["ccroomrunning"]
conf = conf.."\r\n [::] ccroomstyle = "..table_sets ["ccroomstyle"]
conf = conf.."\r\n [::] ccroomautocls = "..table_sets ["ccroomautocls"]
conf = conf.."\r\n [::] ccroommancls = "..table_sets ["ccroommancls"]
conf = conf.."\r\n [::] roomusernotify = "..table_sets ["roomusernotify"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] remrunning = "..table_sets ["remrunning"]
conf = conf.."\r\n [::] replrunning = "..table_sets ["replrunning"]
conf = conf.."\r\n [::] resprunning = "..table_sets ["resprunning"]
conf = conf.."\r\n [::] respdelay = "..table_sets ["respdelay"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] newsclass = "..table_sets ["newsclass"]
conf = conf.."\r\n [::] newsautolines = "..table_sets ["newsautolines"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] chatrankclass = "..table_sets ["chatrankclass"]
conf = conf.."\r\n [::] sharerankclass = "..table_sets ["sharerankclass"]
conf = conf.."\r\n [::] shareranmin = "..table_sets ["shareranmin"]
conf = conf.."\r\n [::] oprankclass = "..table_sets ["oprankclass"]
conf = conf.."\r\n [::] searrankclass = "..table_sets ["searrankclass"]
conf = conf.."\r\n [::] wordrankclass = "..table_sets ["wordrankclass"]
conf = conf.."\r\n [::] wordranmin = "..table_sets ["wordranmin"]
conf = conf.."\r\n [::] wordranmax = "..table_sets ["wordranmax"]
conf = conf.."\r\n [::] ranklimit = "..table_sets ["ranklimit"]
conf = conf.."\r\n [::] ccstatsclass = "..table_sets ["ccstatsclass"]
conf = conf.."\r\n [::] savecchistory = "..table_sets ["savecchistory"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] histlimit = "..table_sets ["histlimit"]
conf = conf.."\r\n [::] histbotmsg = "..table_sets ["histbotmsg"]
conf = conf.."\r\n [::] histautolines = "..table_sets ["histautolines"]
conf = conf.."\r\n [::] ophistautolines = "..table_sets ["ophistautolines"]
	conf = conf .. "\r\n [::] histautolinemax = " .. table_sets ["histautolinemax"]
	conf = conf .. "\r\n [::] histautonewlinedel = " .. table_sets ["histautonewlinedel"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] autoupdcheck = "..table_sets ["autoupdcheck"]
conf = conf.."\r\n [::] addspecialver = "..table_sets ["addspecialver"]
conf = conf.."\r\n [::] addledobot = "..table_sets ["addledobot"]
conf = conf.."\r\n [::] ledobotnick = "..table_sets ["ledobotnick"]
conf = conf.."\r\n [::] ledobotmail = "..table_sets ["ledobotmail"]
conf = conf.."\r\n [::] ledobotsize = "..table_sets ["ledobotsize"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] useextrafeed = "..table_sets ["useextrafeed"]
conf = conf.."\r\n [::] extrafeednick = "..table_sets ["extrafeednick"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] timebotint = "..table_sets ["timebotint"]
conf = conf.."\r\n [::] timebotnick = "..table_sets ["timebotnick"]
conf = conf.."\r\n [::] fasttimebot = "..table_sets ["fasttimebot"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] srvtimediff = "..table_sets ["srvtimediff"]
	conf = conf .. "\r\n [::] longdateformat = " .. table_sets ["longdateformat"]
	conf = conf .. "\r\n [::] dateformat = " .. table_sets ["dateformat"]
conf = conf.."\r\n [::] timeformat = "..table_sets ["timeformat"]
conf = conf.."\r\n [::] shrtuptimefmt = "..table_sets ["shrtuptimefmt"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] statscollint = "..table_sets ["statscollint"]
conf = conf.."\r\n [::] userrecmsg = "..table_sets ["userrecmsg"]
conf = conf.."\r\n [::] sharerecmsg = "..table_sets ["sharerecmsg"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] rolltopicint = "..table_sets ["rolltopicint"]
conf = conf.."\r\n [::] rolltopicspace = "..table_sets ["rolltopicspace"]
conf = conf.."\r\n [::] showtopicowner = "..table_sets ["showtopicowner"]
conf = conf.."\r\n"
	--conf = conf .. "\r\n [::] hublistpingint = " .. table_sets ["hublistpingint"]
	--conf = conf .. "\r\n [::] hubpingtimeout = " .. table_sets ["hubpingtimeout"]
	--conf = conf .. "\r\n"
conf = conf.."\r\n [::] chatantiflood = "..table_sets ["chatantiflood"]
conf = conf.."\r\n [::] chatfloodallcount = "..table_sets ["chatfloodallcount"]
conf = conf.."\r\n [::] chatfloodallint = "..table_sets ["chatfloodallint"]
conf = conf.."\r\n [::] chatfloodcount = "..table_sets ["chatfloodcount"]
conf = conf.."\r\n [::] chatfloodint = "..table_sets ["chatfloodint"]
conf = conf.."\r\n [::] chatfloodaction = "..table_sets ["chatfloodaction"]
conf = conf.."\r\n [::] chatfloodcmdgag = "..table_sets ["chatfloodcmdgag"]
conf = conf.."\r\n [::] ipconantiflint = "..table_sets ["ipconantiflint"]
conf = conf.."\r\n [::] enablehardban = "..table_sets ["enablehardban"]
conf = conf.."\r\n [::] useblacklist = "..table_sets ["useblacklist"]
	conf = conf .. "\r\n"
	conf = conf .. "\r\n [::] protofloodctmcnt = " .. table_sets ["protofloodctmcnt"]
	conf = conf .. "\r\n [::] protofloodctmint = " .. table_sets ["protofloodctmint"]
	conf = conf .. "\r\n [::] protofloodctmact = " .. table_sets ["protofloodctmact"]
	conf = conf .. "\r\n"
conf = conf .. "\r\n [::] enableuserlog = " .. table_sets ["enableuserlog"]
conf = conf .. "\r\n [::] ulogautoclean = " .. table_sets ["ulogautoclean"]
conf = conf.."\r\n [::] logallmyinfos = "..table_sets ["logallmyinfos"]
conf = conf.."\r\n [::] enableipwatch = "..table_sets ["enableipwatch"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] chatcodeon = "..table_sets ["chatcodeon"]
conf = conf.."\r\n [::] codemaxclass = "..table_sets ["codemaxclass"]
conf = conf.."\r\n [::] codelength = "..table_sets ["codelength"]
conf = conf.."\r\n [::] codecharlist = "..table_sets ["codecharlist"]
conf = conf.."\r\n [::] codecharsep = "..table_sets ["codecharsep"]
conf = conf.."\r\n [::] codetext = "..table_sets ["codetext"]
conf = conf.."\r\n [::] pmminclass = "..table_sets ["pmminclass"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] ctmminclass = "..table_sets ["ctmminclass"]
conf = conf.."\r\n [::] ctmmsginterval = "..table_sets ["ctmmsginterval"]
conf = conf.."\r\n [::] ctmblockmsg = "..table_sets ["ctmblockmsg"]
conf = conf.."\r\n"
	conf = conf .. "\r\n [::] instusermenu = " .. table_sets ["instusermenu"]
	conf = conf .. "\r\n [::] instrcmenu = " .. table_sets ["instrcmenu"]
conf = conf.."\r\n [::] usermenuname = "..table_sets ["usermenuname"]
conf = conf.."\r\n [::] enablecmdlog = "..table_sets ["enablecmdlog"]
conf = conf.."\r\n"
conf = conf.."\r\n [::] funrandomchat = "..table_sets ["funrandomchat"]
conf = conf .. "\r\n [::] useripsupport = " .. table_sets ["useripsupport"]
conf = conf.."\r\n [::] useripinchat = "..table_sets ["useripinchat"]
conf = conf.."\r\n [::] tolowcharcase = "..table_sets ["tolowcharcase"]
conf = conf.."\r\n [::] translitmode = "..table_sets ["translitmode"]
conf = conf.."\r\n [::] langfileprefix = "..table_sets ["langfileprefix"].."\r\n"

commandanswer (nick, conf)
end

----- ---- --- -- -

function createtables ()
-- settings
VH:SQLQuery ("create table if not exists `"..tbl_sql ["conf"].."` (`variable` varchar(255) not null, `value` text not null, primary key (`variable`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

	-- antispam
	VH:SQLQuery ("create table if not exists `" .. tbl_sql ["anti"] .. "` (`antispam` varchar(255) not null, `occurred` bigint(20) unsigned not null default 0, `priority` tinyint(1) unsigned not null default 0, `action` tinyint(2) unsigned not null default 0, `flags` tinyint(1) unsigned not null default 3, primary key (`antispam`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
	VH:SQLQuery ("create table if not exists `" .. tbl_sql ["antiex"] .. "` (`exception` varchar(255) not null, `occurred` bigint(20) unsigned not null default 0, primary key (`exception`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

-- search filter
VH:SQLQuery ("create table if not exists `"..tbl_sql ["sefi"].."` (`filter` varchar(255) not null, `occurred` bigint(20) unsigned not null default 0, `priority` tinyint(1) unsigned not null default 0, `action` tinyint(1) unsigned not null default 0, `type` tinyint(1) unsigned not null default 1, primary key (`filter`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
VH:SQLQuery ("create table if not exists `"..tbl_sql ["sefiex"].."` (`exception` varchar(255) not null, `occurred` bigint(20) unsigned not null default 0, primary key (`exception`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

-- myinfo
VH:SQLQuery ("create table if not exists `"..tbl_sql ["minick"].."` (`nick` varchar(255) not null, `time` varchar(10) not null, `occurred` bigint(20) unsigned not null default 0, primary key (`nick`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
VH:SQLQuery ("create table if not exists `"..tbl_sql ["midesc"].."` (`description` varchar(255) not null, `time` varchar(10) not null, `occurred` bigint(20) unsigned not null default 0, primary key (`description`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
VH:SQLQuery ("create table if not exists `"..tbl_sql ["mitag"].."` (`tag` varchar(255) not null, `time` varchar(10) not null, `occurred` bigint(20) unsigned not null default 0, primary key (`tag`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
VH:SQLQuery ("create table if not exists `"..tbl_sql ["miconn"].."` (`connection` varchar(255) not null, `time` varchar(10) not null, `occurred` bigint(20) unsigned not null default 0, primary key (`connection`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
VH:SQLQuery ("create table if not exists `"..tbl_sql ["miemail"].."` (`email` varchar(255) not null, `time` varchar(10) not null, `occurred` bigint(20) unsigned not null default 0, primary key (`email`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
VH:SQLQuery ("create table if not exists `"..tbl_sql ["mishare"].."` (`share` varchar(255) not null, `time` varchar(10) not null, `occurred` bigint(20) unsigned not null default 0, primary key (`share`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
VH:SQLQuery ("create table if not exists `"..tbl_sql ["miip"].."` (`ip` varchar(255) not null, `time` varchar(10) not null, `occurred` bigint(20) unsigned not null default 0, primary key (`ip`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
VH:SQLQuery ("create table if not exists `"..tbl_sql ["micc"].."` (`cc` varchar(255) not null, `time` varchar(10) not null, `occurred` bigint(20) unsigned not null default 0, primary key (`cc`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
VH:SQLQuery ("create table if not exists `"..tbl_sql ["midns"].."` (`dns` varchar(255) not null, `time` varchar(10) not null, `occurred` bigint(20) unsigned not null default 0, primary key (`dns`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
	VH:SQLQuery ("create table if not exists `" .. tbl_sql ["misup"] .. "` (`supports` varchar(255) not null, `time` varchar(10) not null, `occurred` bigint(20) unsigned not null default 0, primary key (`supports`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
	VH:SQLQuery ("create table if not exists `" .. tbl_sql ["miver"] .. "` (`version` varchar(255) not null, `time` varchar(10) not null, `occurred` bigint(20) unsigned not null default 0, primary key (`version`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
	VH:SQLQuery ("create table if not exists `" .. tbl_sql ["miex"] .. "` (`exception` varchar(255) not null, `occurred` bigint(20) unsigned not null default 0, primary key (`exception`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

-- welcome messages
VH:SQLQuery ("create table if not exists `"..tbl_sql ["wm"].."` (`nick` varchar(255) not null, `in` text not null, `out` text not null, primary key (`nick`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

-- custom nicks
VH:SQLQuery ("create table if not exists `"..tbl_sql ["cust"].."` (`nick` varchar(255) not null, `custom` varchar(255) not null, primary key (`nick`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

-- chatrooms
VH:SQLQuery ("create table if not exists `"..tbl_sql ["chat"].."` (`room` varchar(255) not null, `description` varchar(255) not null, `minclass` tinyint(2) unsigned not null default 0, `maxclass` tinyint(2) unsigned not null default 10, `cc` varchar(2) not null default '*', primary key (`room`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

-- reminders
VH:SQLQuery ("create table if not exists `"..tbl_sql ["rem"].."` (`id` varchar(255) not null, `content` text not null, `minclass` tinyint(2) unsigned not null default 0, `maxclass` tinyint(2) unsigned not null default 10, `dest` tinyint(1) unsigned not null default 0, `interval` smallint(5) unsigned not null default 10080, `timer` smallint(5) unsigned not null default 0, primary key (`id`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

-- news
VH:SQLQuery ("create table if not exists `"..tbl_sql ["news"].."` (`id` bigint(20) unsigned not null auto_increment, `date` int(10) unsigned not null, `by` varchar(255) not null, `item` text not null, primary key (`id`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

-- chat replacer
VH:SQLQuery ("create table if not exists `"..tbl_sql ["mcrepl"].."` (`id` bigint(20) unsigned not null auto_increment, `message` varchar(255) not null, `replace` text not null, `maxclass` tinyint(2) unsigned not null default 10, `occurred` bigint(20) unsigned not null default 0, primary key (`id`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
VH:SQLQuery ("create table if not exists `"..tbl_sql ["replex"].."` (`exception` varchar(255) not null, `occurred` bigint(20) unsigned not null default 0, primary key (`exception`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

-- chat responder
VH:SQLQuery ("create table if not exists `"..tbl_sql ["mcresp"].."` (`id` bigint(20) unsigned not null auto_increment, `message` varchar(255) not null, `reply` text not null, `maxclass` tinyint(2) unsigned not null default 10, `occurred` bigint(20) unsigned not null default 0, primary key (`id`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
VH:SQLQuery ("create table if not exists `"..tbl_sql ["respex"].."` (`exception` varchar(255) not null, `occurred` bigint(20) unsigned not null default 0, primary key (`exception`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

-- ip authorization
VH:SQLQuery ("create table if not exists `"..tbl_sql ["auth"].."` (`id` bigint(20) unsigned not null auto_increment, `nick` varchar(255) not null, `ip` varchar(255) not null, `badip` varchar(15) not null default '0.0.0.0', `good` bigint(20) unsigned not null default 0, `bad` bigint(20) unsigned not null default 0, primary key (`id`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

-- releases
VH:SQLQuery ("create table if not exists `"..tbl_sql ["rel"].."` (`release` varchar(255) not null, `category` varchar(255) not null, `tth` varchar(255) not null, `by` varchar(255) not null, `date` int(10) unsigned not null, primary key (`release`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

-- ranks
VH:SQLQuery ("create table if not exists `"..tbl_sql ["chran"].."` (`nick` varchar(255) not null, `rank` bigint(20) unsigned not null default 1, primary key (`nick`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
VH:SQLQuery ("create table if not exists `"..tbl_sql ["opran"].."` (`nick` varchar(255) not null, `rank` bigint(20) unsigned not null default 1, primary key (`nick`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
VH:SQLQuery ("create table if not exists `"..tbl_sql ["shran"].."` (`nick` varchar(255) not null, `rank` bigint(20) unsigned not null default 1, primary key (`nick`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
VH:SQLQuery ("create table if not exists `"..tbl_sql ["srran"].."` (`search` varchar(255) not null, `rank` bigint(20) unsigned not null default 1, primary key (`search`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
VH:SQLQuery ("create table if not exists `"..tbl_sql ["wdran"].."` (`word` varchar(255) not null, `rank` bigint(20) unsigned not null default 1, primary key (`word`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
VH:SQLQuery ("create table if not exists `"..tbl_sql ["ccstat"].."` (`nick` varchar(255) not null, `cc` varchar(2) not null, primary key (`nick`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
VH:SQLQuery ("create table if not exists `"..tbl_sql ["ranex"].."` (`nick` varchar(255) not null, `occurred` bigint(20) unsigned not null default 0, primary key (`nick`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

-- offline messenger
VH:SQLQuery ("create table if not exists `"..tbl_sql ["off"].."` (`id` bigint(20) unsigned not null auto_increment, `from` varchar(255) not null, `ip` varchar(15) not null, `to` varchar(255) not null, `date` int(10) unsigned not null, `message` text not null, primary key (`id`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

-- chat history
VH:SQLQuery ("create table if not exists `"..tbl_sql ["mchist"].."` (`id` bigint(20) unsigned not null auto_increment, `realnick` varchar(255) not null, `nick` varchar(255) not null, `date` int(10) unsigned not null, `message` text not null, primary key (`id`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
VH:SQLQuery ("create table if not exists `"..tbl_sql ["ophist"].."` (`id` bigint(20) unsigned not null auto_increment, `nick` varchar(255) not null, `date` int(10) unsigned not null, `message` text not null, primary key (`id`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

-- commands
VH:SQLQuery ("create table if not exists `"..tbl_sql ["ledocmd"].."` (`original` varchar(255) not null, `new` varchar(255) not null, primary key (`original`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
VH:SQLQuery ("create table if not exists `"..tbl_sql ["cmd"].."` (`command` varchar(255) not null, `class` tinyint(2) unsigned not null default 11, `occurred` bigint(20) unsigned not null default 0, primary key (`command`)) engine = myisam default character set utf8 collate utf8_unicode_ci")
VH:SQLQuery ("create table if not exists `"..tbl_sql ["cmdex"].."` (`exception` varchar(255) not null, `occurred` bigint(20) unsigned not null default 0, primary key (`exception`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

-- user log
VH:SQLQuery ("create table if not exists `"..tbl_sql ["ulog"].."` (`id` bigint(20) unsigned not null auto_increment, `time` int(10) unsigned not null, `nick` varchar(255) not null, `ip` varchar(15) not null, `desc` varchar(255) not null, `tag` varchar(255) not null, `conn` varchar(255) not null, `email` varchar(255) not null, `share` bigint(20) unsigned not null, primary key (`id`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

-- command log
VH:SQLQuery ("create table if not exists `"..tbl_sql ["clog"].."` (`id` bigint(20) unsigned not null auto_increment, `time` bigint(20) unsigned not null, `nick` varchar(255) not null, `class` tinyint(2) unsigned not null, `command` text not null, primary key (`id`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

-- hublist
VH:SQLQuery ("create table if not exists `"..tbl_sql ["hubs"].."` (`address` varchar(255) not null, `name` varchar(255) not null, `owner` varchar(255) not null, `status` tinyint(1) not null default 0, primary key (`address`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

-- protected list
VH:SQLQuery ("create table if not exists `"..tbl_sql ["prot"].."` (`protected` varchar(255) not null, `occurred` bigint(20) unsigned not null default 0, primary key (`protected`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

-- statistics
VH:SQLQuery ("create table if not exists `"..tbl_sql ["stat"].."` (`type` varchar(255) not null, `time` bigint(20) unsigned not null default 0, `count` text not null, primary key (`type`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

	-- no pm
	VH:SQLQuery ("create table if not exists `"..tbl_sql ["nopm"].."` (`nick` varchar(255) not null, `action` tinyint(1) unsigned not null default 0, `maxclass` tinyint(2) unsigned not null default 2, `password` varchar(255) not null, `reason` text not null, primary key (`nick`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

	-- hard ban
	VH:SQLQuery ("create table if not exists `"..tbl_sql ["hban"].."` (`ip` varchar(255) not null, `reason` text not null, primary key (`ip`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

	-- ip watch
	VH:SQLQuery ("create table if not exists `"..tbl_sql ["ipwa"].."` (`ip` varchar(255) not null, `reason` text not null, `result` tinyint(1) unsigned not null default 0, primary key (`ip`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

	-- ip gag
	VH:SQLQuery ("create table if not exists `" .. tbl_sql ["ipgag"] .. "` (`ip` varchar(255) not null, `flag` tinyint(1) unsigned not null default 0, primary key (`ip`)) engine = myisam default character set utf8 collate utf8_unicode_ci")

	-- right click menu
	VH:SQLQuery ("create table if not exists `" .. tbl_sql ["rcmenu"] .. "` (`id` bigint(20) unsigned not null auto_increment primary key, `menu` varchar(255) not null, `command` varchar(255) not null, `type` tinyint(3) unsigned not null default 1, `cont` tinyint(2) unsigned not null default 3, `order` smallint(5) unsigned not null default 0, `minclass` tinyint(2) unsigned not null default 0, `maxclass` tinyint(2) unsigned not null default 10) engine = myisam default character set utf8 collate utf8_unicode_ci")
end

----- ---- --- -- -

function droptables ()
for _, v in pairs (tbl_sql) do
	VH:SQLQuery ("drop table `"..v.."`")
end
end

----- ---- --- -- -

function renametables ()
VH:SQLQuery ("alter ignore table `script_ledokol_settings` rename to `"..tbl_sql ["conf"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_antispam` rename to `"..tbl_sql ["anti"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_exceptions` rename to `"..tbl_sql ["antiex"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_searchfilter` rename to `"..tbl_sql ["sefi"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_sefiexceptions` rename to `"..tbl_sql ["sefiex"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_nicks` rename to `"..tbl_sql ["minick"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_descriptions` rename to `"..tbl_sql ["midesc"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_tags` rename to `"..tbl_sql ["mitag"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_connections` rename to `"..tbl_sql ["miconn"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_emails` rename to `"..tbl_sql ["miemail"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_shares` rename to `"..tbl_sql ["mishare"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_miips` rename to `"..tbl_sql ["miip"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_myinfoexceptions` rename to `"..tbl_sql ["miex"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_authorization` rename to `"..tbl_sql ["auth"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_releases` rename to `"..tbl_sql ["rel"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_welcomemessages` rename to `"..tbl_sql ["wm"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_customnicks` rename to `"..tbl_sql ["cust"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_chatrooms` rename to `"..tbl_sql ["chat"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_reminders` rename to `"..tbl_sql ["rem"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_hubnews` rename to `"..tbl_sql ["news"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_mcresponder` rename to `"..tbl_sql ["mcresp"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_respexceptions` rename to `"..tbl_sql ["respex"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_chatranks` rename to `"..tbl_sql ["chran"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_opranks` rename to `"..tbl_sql ["opran"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_shareranks` rename to `"..tbl_sql ["shran"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_wordranks` rename to `"..tbl_sql ["wdran"].."`")
VH:SQLQuery ("alter ignore table `script_ccstats` rename to `"..tbl_sql ["ccstat"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_rankexceptions` rename to `"..tbl_sql ["ranex"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_offline` rename to `"..tbl_sql ["off"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_mchistory` rename to `"..tbl_sql ["mchist"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_ophistory` rename to `"..tbl_sql ["ophist"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_ledocommands` rename to `"..tbl_sql ["ledocmd"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_commands` rename to `"..tbl_sql ["cmd"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_cmdexceptions` rename to `"..tbl_sql ["cmdex"].."`")
VH:SQLQuery ("alter ignore table `script_ledokol_userlog` rename to `"..tbl_sql ["ulog"].."`")
end

----- ---- --- -- -

function altertables ()
-- todo: alter tables to default character set utf8 collate utf8_unicode_ci

-- settings
VH:SQLQuery ("alter ignore table `"..tbl_sql ["conf"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["conf"].."` change column `variable` `variable` varchar(255) not null") -- variable
VH:SQLQuery ("alter ignore table `"..tbl_sql ["conf"].."` change column `value` `value` text not null") -- value

-- antispam
VH:SQLQuery ("alter ignore table `"..tbl_sql ["anti"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["anti"].."` change column `antispam` `antispam` varchar(255) not null") -- antispam
VH:SQLQuery ("alter ignore table `"..tbl_sql ["anti"].."` change column `occured` `occurred` bigint(20) unsigned not null default 0") -- occurred
VH:SQLQuery ("alter ignore table `"..tbl_sql ["anti"].."` add column `priority` tinyint(1) unsigned not null default 0 after `occurred`") -- priority
VH:SQLQuery ("alter ignore table `"..tbl_sql ["anti"].."` change column `action` `action` tinyint(2) unsigned not null default 0") -- action
VH:SQLQuery ("alter ignore table `"..tbl_sql ["anti"].."` add column `flags` tinyint(1) unsigned not null default 3 after `action`") -- flags

VH:SQLQuery ("alter ignore table `"..tbl_sql ["antiex"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["antiex"].."` change column `exception` `exception` varchar(255) not null") -- exception
VH:SQLQuery ("alter ignore table `"..tbl_sql ["antiex"].."` change column `occured` `occurred` bigint(20) unsigned not null default 0") -- occurred

-- search filter
VH:SQLQuery ("alter ignore table `"..tbl_sql ["sefi"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["sefi"].."` change column `filter` `filter` varchar(255) not null") -- filter
VH:SQLQuery ("alter ignore table `"..tbl_sql ["sefi"].."` change column `occured` `occurred` bigint(20) unsigned not null default 0") -- occurred
VH:SQLQuery ("alter ignore table `"..tbl_sql ["sefi"].."` add column `priority` tinyint(1) unsigned not null default 0 after `occurred`") -- priority
VH:SQLQuery ("alter ignore table `"..tbl_sql ["sefi"].."` change column `action` `action` tinyint(1) unsigned not null default 0") -- action
VH:SQLQuery ("alter ignore table `"..tbl_sql ["sefi"].."` add column `type` tinyint(1) unsigned not null default 1 after `action`") -- type

VH:SQLQuery ("alter ignore table `"..tbl_sql ["sefiex"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["sefiex"].."` change column `exception` `exception` varchar(255) not null") -- exception
VH:SQLQuery ("alter ignore table `"..tbl_sql ["sefiex"].."` change column `occurred` `occurred` bigint(20) unsigned not null default 0") -- occurred

-- myinfo
VH:SQLQuery ("alter ignore table `"..tbl_sql ["minick"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["minick"].."` change column `nick` `nick` varchar(255) not null") -- nick
VH:SQLQuery ("alter ignore table `"..tbl_sql ["minick"].."` add column `time` varchar(10) not null default '"..table_sets ["mitbantime"].."' after `nick`") -- time
VH:SQLQuery ("alter ignore table `"..tbl_sql ["minick"].."` change column `occured` `occurred` bigint(20) unsigned not null default 0") -- occurred

VH:SQLQuery ("alter ignore table `"..tbl_sql ["midesc"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["midesc"].."` change column `description` `description` varchar(255) not null") -- description
VH:SQLQuery ("alter ignore table `"..tbl_sql ["midesc"].."` add column `time` varchar(10) not null default '"..table_sets ["mitbantime"].."' after `description`") -- time
VH:SQLQuery ("alter ignore table `"..tbl_sql ["midesc"].."` change column `occured` `occurred` bigint(20) unsigned not null default 0") -- occurred

VH:SQLQuery ("alter ignore table `"..tbl_sql ["mitag"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["mitag"].."` change column `tag` `tag` varchar(255) not null") -- tag
VH:SQLQuery ("alter ignore table `"..tbl_sql ["mitag"].."` add column `time` varchar(10) not null default '"..table_sets ["mitbantime"].."' after `tag`") -- time
VH:SQLQuery ("alter ignore table `"..tbl_sql ["mitag"].."` change column `occured` `occurred` bigint(20) unsigned not null default 0") -- occurred

VH:SQLQuery ("alter ignore table `"..tbl_sql ["miconn"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["miconn"].."` change column `connection` `connection` varchar(255) not null") -- connection
VH:SQLQuery ("alter ignore table `"..tbl_sql ["miconn"].."` add column `time` varchar(10) not null default '"..table_sets ["mitbantime"].."' after `connection`") -- time
VH:SQLQuery ("alter ignore table `"..tbl_sql ["miconn"].."` change column `occured` `occurred` bigint(20) unsigned not null default 0") -- occurred

VH:SQLQuery ("alter ignore table `"..tbl_sql ["miemail"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["miemail"].."` change column `email` `email` varchar(255) not null") -- email
VH:SQLQuery ("alter ignore table `"..tbl_sql ["miemail"].."` add column `time` varchar(10) not null default '"..table_sets ["mitbantime"].."' after `email`") -- time
VH:SQLQuery ("alter ignore table `"..tbl_sql ["miemail"].."` change column `occured` `occurred` bigint(20) unsigned not null default 0") -- occurred

VH:SQLQuery ("alter ignore table `"..tbl_sql ["mishare"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["mishare"].."` change column `share` `share` varchar(255) not null") -- share
VH:SQLQuery ("alter ignore table `"..tbl_sql ["mishare"].."` add column `time` varchar(10) not null default '"..table_sets ["mitbantime"].."' after `share`") -- time
VH:SQLQuery ("alter ignore table `"..tbl_sql ["mishare"].."` change column `occured` `occurred` bigint(20) unsigned not null default 0") -- occurred

VH:SQLQuery ("alter ignore table `"..tbl_sql ["miip"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["miip"].."` change column `ip` `ip` varchar(255) not null") -- ip
VH:SQLQuery ("alter ignore table `"..tbl_sql ["miip"].."` add column `time` varchar(10) not null default '"..table_sets ["mitbantime"].."' after `ip`") -- time
VH:SQLQuery ("alter ignore table `"..tbl_sql ["miip"].."` change column `occured` `occurred` bigint(20) unsigned not null default 0") -- occurred

	-- myinfo cc
	-- not added

	VH:SQLQuery ("alter ignore table `" .. tbl_sql ["midns"] .. "` add column `time` varchar(10) not null default '" .. table_sets ["mitbantime"] .. "' after `dns`") -- time

	-- myinfo supports
	-- not added

	-- myinfo version
	-- not added

VH:SQLQuery ("alter ignore table `"..tbl_sql ["miex"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["miex"].."` change column `exception` `exception` varchar(255) not null") -- exception
VH:SQLQuery ("alter ignore table `"..tbl_sql ["miex"].."` change column `occured` `occurred` bigint(20) unsigned not null default 0") -- occurred

-- ip authorization
VH:SQLQuery ("alter ignore table `"..tbl_sql ["auth"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["auth"].."` drop primary key")
VH:SQLQuery ("alter ignore table `"..tbl_sql ["auth"].."` add column `id` bigint(20) unsigned auto_increment first, add primary key (`id`)") -- id
VH:SQLQuery ("alter ignore table `"..tbl_sql ["auth"].."` change column `nick` `nick` varchar(255) not null") -- nick
VH:SQLQuery ("alter ignore table `"..tbl_sql ["auth"].."` change column `ip` `ip` varchar(255) not null") -- ip
VH:SQLQuery ("alter ignore table `"..tbl_sql ["auth"].."` add column `badip` varchar(15) not null default '0.0.0.0' after `ip`") -- badip
VH:SQLQuery ("alter ignore table `"..tbl_sql ["auth"].."` change column `badip` `badip` varchar(15) not null default '0.0.0.0'") -- badip
VH:SQLQuery ("alter ignore table `"..tbl_sql ["auth"].."` change column `good` `good` bigint(20) unsigned not null default 0") -- good
VH:SQLQuery ("alter ignore table `"..tbl_sql ["auth"].."` change column `bad` `bad` bigint(20) unsigned not null default 0") -- bad

-- releases
VH:SQLQuery ("alter ignore table `"..tbl_sql ["rel"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["rel"].."` change column `release` `release` varchar(255) not null") -- release
VH:SQLQuery ("alter ignore table `"..tbl_sql ["rel"].."` change column `category` `category` varchar(255) not null") -- category
VH:SQLQuery ("alter ignore table `"..tbl_sql ["rel"].."` add column `tth` varchar(255) not null after `category`") -- tth
VH:SQLQuery ("alter ignore table `"..tbl_sql ["rel"].."` change column `by` `by` varchar(255) not null") -- by
VH:SQLQuery ("alter ignore table `"..tbl_sql ["rel"].."` change column `date` `date` int(10) unsigned not null") -- date

-- welcome messages
VH:SQLQuery ("alter ignore table `"..tbl_sql ["wm"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["wm"].."` change column `nick` `nick` varchar(255) not null") -- nick
VH:SQLQuery ("alter ignore table `"..tbl_sql ["wm"].."` change column `in` `in` text not null") -- in
VH:SQLQuery ("alter ignore table `"..tbl_sql ["wm"].."` change column `out` `out` text not null") -- out

-- custom nicks
VH:SQLQuery ("alter ignore table `"..tbl_sql ["cust"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["cust"].."` change column `nick` `nick` varchar(255) not null") -- nick
VH:SQLQuery ("alter ignore table `"..tbl_sql ["cust"].."` change column `custom` `custom` varchar(255) not null") -- custom

-- chatrooms
VH:SQLQuery ("alter ignore table `"..tbl_sql ["chat"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["chat"].."` change column `room` `room` varchar(255) not null") -- room
VH:SQLQuery ("alter ignore table `"..tbl_sql ["chat"].."` change column `description` `description` varchar(255) not null") -- description
VH:SQLQuery ("alter ignore table `"..tbl_sql ["chat"].."` change column `minclass` `minclass` tinyint(2) unsigned not null default 0") -- minclass
VH:SQLQuery ("alter ignore table `"..tbl_sql ["chat"].."` change column `maxclass` `maxclass` tinyint(2) unsigned not null default 10") -- maxclass
VH:SQLQuery ("alter ignore table `"..tbl_sql ["chat"].."` add column `cc` varchar(2) not null default '*' after `maxclass`") -- cc

-- reminders
VH:SQLQuery ("alter ignore table `"..tbl_sql ["rem"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["rem"].."` change column `id` `id` varchar(255) not null") -- id
VH:SQLQuery ("alter ignore table `"..tbl_sql ["rem"].."` change column `content` `content` text not null") -- content
VH:SQLQuery ("alter ignore table `"..tbl_sql ["rem"].."` change column `minclass` `minclass` tinyint(2) unsigned not null default 0") -- minclass
VH:SQLQuery ("alter ignore table `"..tbl_sql ["rem"].."` change column `maxclass` `maxclass` tinyint(2) unsigned not null default 10") -- maxclass
VH:SQLQuery ("alter ignore table `"..tbl_sql ["rem"].."` change column `pm` `dest` tinyint(1) unsigned not null default 0") -- dest
VH:SQLQuery ("alter ignore table `"..tbl_sql ["rem"].."` change column `interval` `interval` smallint(5) unsigned not null default 10080") -- interval
VH:SQLQuery ("alter ignore table `"..tbl_sql ["rem"].."` change column `timer` `timer` smallint(5) unsigned not null default 0") -- timer

-- news
VH:SQLQuery ("alter ignore table `"..tbl_sql ["news"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["news"].."` change column `id` `id` bigint(20) unsigned auto_increment") -- id
VH:SQLQuery ("alter ignore table `"..tbl_sql ["news"].."` change column `date` `date` int(10) unsigned not null") -- date
VH:SQLQuery ("alter ignore table `"..tbl_sql ["news"].."` change column `by` `by` varchar(255) not null") -- by
VH:SQLQuery ("alter ignore table `"..tbl_sql ["news"].."` change column `item` `item` text not null") -- item

-- chat replacer
-- not added

-- chat responder
VH:SQLQuery ("alter ignore table `"..tbl_sql ["mcresp"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["mcresp"].."` drop primary key")
VH:SQLQuery ("alter ignore table `"..tbl_sql ["mcresp"].."` add column `id` bigint(20) unsigned auto_increment first, add primary key (`id`)") -- id
VH:SQLQuery ("alter ignore table `"..tbl_sql ["mcresp"].."` change column `message` `message` varchar(255) not null") -- message
VH:SQLQuery ("alter ignore table `"..tbl_sql ["mcresp"].."` change column `reply` `reply` text not null") -- reply
VH:SQLQuery ("alter ignore table `"..tbl_sql ["mcresp"].."` add column `maxclass` tinyint(2) unsigned not null default 10 after `reply`") -- maxclass
VH:SQLQuery ("alter ignore table `"..tbl_sql ["mcresp"].."` change column `occurred` `occurred` bigint(20) unsigned not null default 0") -- occurred

VH:SQLQuery ("alter ignore table `"..tbl_sql ["respex"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["respex"].."` change column `nick` `exception` varchar(255) not null") -- exception
VH:SQLQuery ("alter ignore table `"..tbl_sql ["respex"].."` change column `occurred` `occurred` bigint(20) unsigned not null default 0") -- occurred

-- ranks
VH:SQLQuery ("alter ignore table `"..tbl_sql ["chran"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["chran"].."` change column `nick` `nick` varchar(255) not null") -- nick
VH:SQLQuery ("alter ignore table `"..tbl_sql ["chran"].."` change column `rank` `rank` bigint(20) unsigned not null default 1") -- rank

VH:SQLQuery ("alter ignore table `"..tbl_sql ["opran"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["opran"].."` change column `nick` `nick` varchar(255) not null") -- nick
VH:SQLQuery ("alter ignore table `"..tbl_sql ["opran"].."` change column `rank` `rank` bigint(20) unsigned not null default 1") -- rank

VH:SQLQuery ("alter ignore table `"..tbl_sql ["shran"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["shran"].."` change column `nick` `nick` varchar(255) not null") -- nick
VH:SQLQuery ("alter ignore table `"..tbl_sql ["shran"].."` change column `rank` `rank` bigint(20) unsigned not null default 1") -- rank

-- search ranks
-- not added

VH:SQLQuery ("alter ignore table `"..tbl_sql ["wdran"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["wdran"].."` change column `word` `word` varchar(255) not null") -- word
VH:SQLQuery ("alter ignore table `"..tbl_sql ["wdran"].."` change column `rank` `rank` bigint(20) unsigned not null default 1") -- rank

-- user location statistics
-- not added

VH:SQLQuery ("alter ignore table `"..tbl_sql ["ranex"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["ranex"].."` change column `nick` `nick` varchar(255) not null") -- nick
VH:SQLQuery ("alter ignore table `"..tbl_sql ["ranex"].."` add column `occurred` bigint(20) unsigned not null default 0 after `nick`") -- occurred

-- offline messenger
VH:SQLQuery ("alter ignore table `"..tbl_sql ["off"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["off"].."` change column `id` `id` bigint(20) unsigned auto_increment") -- id
VH:SQLQuery ("alter ignore table `"..tbl_sql ["off"].."` change column `from` `from` varchar(255) not null") -- from
VH:SQLQuery ("alter ignore table `"..tbl_sql ["off"].."` change column `ip` `ip` varchar(15) not null") -- ip
VH:SQLQuery ("alter ignore table `"..tbl_sql ["off"].."` change column `to` `to` varchar(255) not null") -- to
VH:SQLQuery ("alter ignore table `"..tbl_sql ["off"].."` change column `date` `date` int(10) unsigned not null") -- date
VH:SQLQuery ("alter ignore table `"..tbl_sql ["off"].."` change column `message` `message` text not null") -- message

-- chat history
VH:SQLQuery ("alter ignore table `"..tbl_sql ["mchist"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["mchist"].."` change column `id` `id` bigint(20) unsigned auto_increment") -- id
VH:SQLQuery ("alter ignore table `"..tbl_sql ["mchist"].."` add column `realnick` varchar(255) not null after `id`") -- realnick
VH:SQLQuery ("alter ignore table `"..tbl_sql ["mchist"].."` change column `nick` `nick` varchar(255) not null") -- nick
VH:SQLQuery ("alter ignore table `"..tbl_sql ["mchist"].."` change column `date` `date` int(10) unsigned not null") -- date
VH:SQLQuery ("alter ignore table `"..tbl_sql ["mchist"].."` change column `message` `message` text not null") -- message

VH:SQLQuery ("alter ignore table `"..tbl_sql ["ophist"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["ophist"].."` change column `id` `id` bigint(20) unsigned auto_increment") -- id
VH:SQLQuery ("alter ignore table `"..tbl_sql ["ophist"].."` change column `nick` `nick` varchar(255) not null") -- nick
VH:SQLQuery ("alter ignore table `"..tbl_sql ["ophist"].."` change column `date` `date` int(10) unsigned not null") -- date
VH:SQLQuery ("alter ignore table `"..tbl_sql ["ophist"].."` change column `message` `message` text not null") -- message

-- commands
VH:SQLQuery ("alter ignore table `"..tbl_sql ["ledocmd"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["ledocmd"].."` change column `original` `original` varchar(255) not null") -- original
VH:SQLQuery ("alter ignore table `"..tbl_sql ["ledocmd"].."` change column `new` `new` varchar(255) not null") -- new

VH:SQLQuery ("alter ignore table `"..tbl_sql ["cmd"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["cmd"].."` change column `command` `command` varchar(255) not null") -- command
VH:SQLQuery ("alter ignore table `"..tbl_sql ["cmd"].."` change column `class` `class` tinyint(2) unsigned not null default 11") -- class
VH:SQLQuery ("alter ignore table `"..tbl_sql ["cmd"].."` add column `occurred` bigint(20) unsigned not null default 0 after `class`") -- occurred

VH:SQLQuery ("alter ignore table `"..tbl_sql ["cmdex"].."` engine = myisam") -- engine
VH:SQLQuery ("alter ignore table `"..tbl_sql ["cmdex"].."` change column `exception` `exception` varchar(255) not null") -- exception
VH:SQLQuery ("alter ignore table `"..tbl_sql ["cmdex"].."` change column `occurred` `occurred` bigint(20) unsigned not null default 0") -- occurred

-- user log
-- not added

-- command log
-- not added

-- hublist
-- not added

-- protected list
-- not added

-- statistics
VH:SQLQuery ("alter ignore table `"..tbl_sql ["stat"].."` change column `count` `count` text not null") -- count

	-- no pm
	VH:SQLQuery ("alter ignore table `"..tbl_sql ["nopm"].."` add column `maxclass` tinyint(2) unsigned not null default 2 after `action`") -- maxclass
	VH:SQLQuery ("alter ignore table `"..tbl_sql ["nopm"].."` add column `password` varchar(255) not null after `maxclass`") -- password

	-- hard ban
	-- not added

	-- ip watch
	-- not added

	-- ip gag
	-- not added
end

----- ---- --- -- -

function createsettings ()
	for k, v in pairs (table_sets) do -- create settings
		VH:SQLQuery ("insert ignore into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('"..repsqlchars (k).."', '"..repsqlchars (v).."')")
	end

	for k, v in pairs (table_cmnds) do -- create commands
		VH:SQLQuery ("insert ignore into `"..tbl_sql ["ledocmd"].."` (`original`, `new`) values ('"..repsqlchars (k).."', '"..repsqlchars (v).."')")
	end

	-- own stuff

	--local _, rows = VH:SQLQuery ("select `variable` from `"..tbl_sql ["conf"].."` where `variable` = 'cmdinstalled' limit 1") -- add commands i prefer to forbid

	--if rows == 0 then
		--VH:SQLQuery ("insert ignore into `"..tbl_sql ["cmd"].."` (`command`) values "..
		--"('"..repsqlchars ("^$").."')")
	--end

	if not getledoconf ("cmdexinstalled") then -- add commands i prefer to except
		VH:SQLQuery ("insert ignore into `"..tbl_sql ["cmdex"].."` (`exception`) values "..
		"('"..repsqlchars ("^"..table_othsets ["optrig"].."drop .+$").."'), "..
		"('"..repsqlchars ("^"..table_othsets ["optrig"].."rpass .+$").."'), "..
		"('"..repsqlchars ("^"..table_othsets ["optrig"].."rpasswd .+$").."'), "..
		"('"..repsqlchars ("^"..table_othsets ["optrig"].."regpass .+$").."'), "..
		"('"..repsqlchars ("^"..table_othsets ["optrig"].."regpasswd .+$").."'), "..
		"('"..repsqlchars ("^"..table_othsets ["ustrig"].."msgsend .+$").."'), "..
		"('"..repsqlchars ("^"..table_othsets ["ustrig"].."report .+$").."'), "..
		"('"..repsqlchars ("^"..table_othsets ["ustrig"].."passwd .*$").."'), "..
		"('"..repsqlchars ("^"..table_othsets ["ustrig"].."regme").."')")
	end

	if not getledoconf ("defmyinfnick") then -- add nicks i prefer to forbid
		VH:SQLQuery ("insert ignore into `" .. tbl_sql ["minick"] .. "` (`nick`) values ('" .. repsqlchars ("%" .. string.char (173)) .. "')")
	end

	-- update hidden variables

	local tm = os.time () + table_sets ["srvtimediff"]
	VH:SQLQuery ("insert ignore into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('cmdinstalled', 1)")
	VH:SQLQuery ("insert ignore into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('cmdexinstalled', 1)")
	VH:SQLQuery ("insert ignore into `" .. tbl_sql ["conf"] .. "` (`variable`, `value`) values ('defmyinfnick', 1)")
	VH:SQLQuery ("insert ignore into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('allow_shell', 0)")
	VH:SQLQuery ("insert ignore into `"..tbl_sql ["conf"].."` (`variable`, `value`) values ('allow_sql', 0)")
	VH:SQLQuery ("insert into `"..tbl_sql ["stat"].."` (`type`, `time`, `count`) values ('ver_ledo', "..tm..", '"..ver_ledo.."') on duplicate key update `time` = "..tm..", `count` = '"..ver_ledo.."'")
end

----- ---- --- -- -

function loadsettings ()
	for k, _ in pairs (table_sets) do -- load settings
		local val = getledoconf (k)

		if val then
			table_sets [k] = val
		end
	end

	for k, _ in pairs (table_cmnds) do -- load commands
		local _, rows = VH:SQLQuery ("select `new` from `"..tbl_sql ["ledocmd"].."` where `original` = '"..repsqlchars (k).."' limit 1")

		if rows > 0 then
			local _, val = VH:SQLFetch (0)
			table_cmnds [k] = val
		end
	end

	if table_sets ["useblacklist"] == 1 then -- blacklist
		if loadblacklist () == false then
			table_sets ["useblacklist"] = 0
		end
	end
end

----- ---- --- -- -

function loadlangfile (nick, new)
	table_lang = table_lang_def -- load default table
	local lang = new or table_sets ["langfileprefix"]
	if string.len (lang) == 0 then return nil end
	local l, err = loadfile (table_othsets ["cfgdir"].."scripts/ledo_"..lang..".txt") -- try to load the file

	if not l then -- not found or syntax error
		if nick and err then
			commandanswer (nick, string.format (getlang (466), "ledo_"..lang..".txt", err))
		end

		table_othsets ["langver"] = "EN"
	else
		l () -- define the chunk
		table_lang = f () -- return the function as a global table
		t, f = nil -- destroy
		table_othsets ["langver"] = string.upper (lang)
	end
end

----- ---- --- -- -

function getlang (var)
	local str = repnmdcoutchars (table_lang [var] or table_lang_def [var] or "[error]") -- fall back
	return str
end

----- ---- --- -- -

function convtranslit (str, mode)
local cnv = str

for _, v in pairs (tbl_cyrlet) do
	if mode == 1 then -- cyr -> lat
		cnv = string.gsub (cnv, string.char (v.cyr), reprexpchars (v.lat))
	elseif mode == 2 then -- lat -> cyr
		cnv = string.gsub (cnv, v.lat, reprexpchars (string.char (v.cyr)))
	end
end

return cnv
end

----- ---- --- -- -

function convcaps (str, to)
local cnv = str

for _, v in pairs (tbl_cyrlet) do -- cyrillic conversion
	if v.low then
		if to then
			cnv = string.gsub (cnv, string.char (v.cyr), reprexpchars (string.char (v.low)))
		else
			cnv = string.gsub (cnv, string.char (v.low), reprexpchars (string.char (v.cyr)))
		end
	end
end

if to then return string.lower (cnv) else return string.upper (cnv) end
end

----- ---- --- -- -

function addhubrobot (nick, desc, away, mail, share)
	VH:AddRobot (nick, 3, desc, string.char (away), mail, share)
	--VH:SendDataToAll ("$UserIP "..nick.." 127.0.0.1$$|", 0, 10)
end

----- ---- --- -- -

function edithubrobot (nick, desc, away, mail, share)
	VH:EditBot (nick, 3, desc, string.char (away), mail, share)
end

----- ---- --- -- -

function delhubrobot (nick)
	VH:DelRobot (nick)
end

----- ---- --- -- -

function ipinrange (r, i)
	local _, _, a1, b1, c1, d1, a2, b2, c2, d2 = string.find (r, "^(%d+)%.(%d+)%.(%d+)%.(%d+)%-(%d+)%.(%d+)%.(%d+)%.(%d+)$")

	if a1 and a2 and b1 and b2 and c1 and c2 and d1 and d2 then
		local _, _, a3, b3, c3, d3 = string.find (i, "^(%d+)%.(%d+)%.(%d+)%.(%d+)$")

		if a3 and b3 and c3 and d3 then
			a1, a2, a3 = tonumber (a1), tonumber (a2), tonumber (a3)
			b1, b2, b3 = tonumber (b1), tonumber (b2), tonumber (b3)
			c1, c2, c3 = tonumber (c1), tonumber (c2), tonumber (c3)
			d1, d2, d3 = tonumber (d1), tonumber (d2), tonumber (d3)

			if (a3 >= a1) and (a3 <= a2) and (b3 >= b1) and (b3 <= b2) and (c3 >= c1) and (c3 <= c2) and (d3 >= d1) and (d3 <= d2) then
				return true
			end
		end
	end

	return false
end

----- ---- --- -- -

function getownsize (bm, bs)
	if (bm == true) and (bs >= 0) then
		return bs
	else
		local sz = 0
		local f = io.open (table_othsets ["cfgdir"].."scripts/ledokol.lua", "r")

		if f then
			sz = f:seek ("end")
			f:close ()
		end

		return sz
	end
end

----- ---- --- -- -

function getownlinecnt ()
local f = io.open (table_othsets ["cfgdir"].."scripts/ledokol.lua", "r")
local ln = 0

if f then
	f:close ()

	for x in io.lines (table_othsets ["cfgdir"].."scripts/ledokol.lua") do
		ln = ln + 1
	end
end

return ln
end

----- ---- --- -- -

function getmemusg ()
table_othsets ["collgarb"] = os.time ()
local sz = 0

if string.sub (table_othsets ["ver_lua"], 1, 3) == "5.0" then
	collectgarbage ()
	sz, _ = gcinfo ()
else
	collectgarbage ("collect")
	sz = collectgarbage ("count")
end

return sz * 1024 -- return in bytes
end

----- ---- --- -- -

function loadcomponents ()
	local _, paths = 0, {"", "/usr/local/bin/", "/usr/bin/"} -- prepare

	-- configuration directory

	if VH.GetVHCfgDir then
		_, table_othsets ["cfgdir"] = VH:GetVHCfgDir ()
	else
		VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to run VH:GetVHCfgDir|", 5, 10)
		table_othsets ["cfgdir"] = os.getenv ("VERLIHUB_CFG")

		if not table_othsets ["cfgdir"] then
			VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to get VERLIHUB_CFG|", 5, 10)

			for _, v in pairs (paths) do
				local res = os.execute (v .. "vh_getcfg > \"./" .. table_othsets ["tmpfile"] .. "\"")

				if res then
					local f = io.open ("./" .. table_othsets ["tmpfile"], "r")

					if f then
						local line = f:read ("*line") -- read first line
						f:close ()
						os.remove ("./" .. table_othsets ["tmpfile"])

						if line and (string.len (line) > 0) then
							table_othsets ["cfgdir"] = line
							break
						end
					end
				end
			end

			if (not table_othsets ["cfgdir"]) or (string.len (table_othsets ["cfgdir"]) == 0) then
				VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Error: Unable to run vh_getcfg.sh|", 5, 10)
				return true
			end
		end
	end

	if string.sub (table_othsets ["cfgdir"], string.len (table_othsets ["cfgdir"]), -1) ~= "/" then -- small modification
		table_othsets ["cfgdir"] = table_othsets ["cfgdir"].."/"
	end

	-- nicklist

	if not VH.GetNickList then
		VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Error: Unable to run VH:GetNickList|", 5, 10)
		return true
	end

	-- plugin version

	table_othsets ["ver_luaplug"] = _PLUGINVERSION

	if not table_othsets ["ver_luaplug"] then
		VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to detect Lua plugin version|", 5, 10)
	end

	-- lua version

	for _, v in pairs (paths) do
		local res = os.execute (v .. "lua -v > \"" .. table_othsets ["cfgdir"] .. table_othsets ["tmpfile"] .. "\" 2>&1")

		if res then
			local f = io.open (table_othsets ["cfgdir"] .. table_othsets ["tmpfile"], "r")

			if f then
				local ver = f:read ("*line") -- read first line
				f:close ()
				os.remove (table_othsets ["cfgdir"] .. table_othsets ["tmpfile"])

				if ver and (string.len (ver) > 0) then
					_, _, table_othsets ["ver_lua"] = string.find (ver, "(%d+[%.%d]+)")

					if table_othsets ["ver_lua"] then
						break
					end
				end
			end
		end
	end

	if not table_othsets ["ver_lua"] then
		VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to run \"lua -v\"|", 5, 10)
		table_othsets ["ver_lua"] = string.sub (_VERSION, 5, -1)
	end

	if not table_othsets ["ver_lua"] then
		VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to detect Lua library version|", 5, 10)
	else
		if string.sub (table_othsets ["ver_lua"], 1, 3) == "5.0" then
			string.gmatch = string.gfind -- lua 5.0 fix
		end
	end

	-- mysql version

	VH:SQLQuery ("select version()")
	_, table_othsets ["ver_sql"] = VH:SQLFetch (0)

	if not table_othsets ["ver_sql"] then
		VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to detect MySQL version|", 5, 10)
	end

	-- curl version

	if os.execute ("curl -s --version > \"" .. table_othsets ["cfgdir"] .. table_othsets ["tmpfile"] .. "\" 2>&1") then
		local f = io.open (table_othsets ["cfgdir"] .. table_othsets ["tmpfile"], "r")

		if f then
			local ver = f:read ("*line") -- read first line
			f:close ()
			os.remove (table_othsets ["cfgdir"] .. table_othsets ["tmpfile"])

			if ver and (string.len (ver) > 0) then
				_, _, table_othsets ["ver_curl"] = string.find (ver, "(%d+[%.%d]+)")
			end
		end
	end

	if not table_othsets ["ver_curl"] then
		VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to run \"curl --version\"|", 5, 10)
	end

	--[[

	-- iconv version

	if os.execute ("iconv -s --version > \"" .. table_othsets ["cfgdir"] .. table_othsets ["tmpfile"] .. "\" 2>&1") then
		local f = io.open (table_othsets ["cfgdir"] .. table_othsets ["tmpfile"], "r")

		if f then
			local ver = f:read ("*line") -- read first line
			f:close ()
			os.remove (table_othsets ["cfgdir"] .. table_othsets ["tmpfile"])

			if ver and (string.len (ver) > 0) then
				_, _, table_othsets ["ver_iconv"] = string.find (ver, "(%d+[%.%d]+)")
			end
		end
	end

	if not table_othsets ["ver_iconv"] then
		VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to run \"iconv --version\"|", 5, 10)
	end

	-- load socket

	local res, err = pcall (function () lsock = require ("socket") end)

	if not res then
		--VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to load LuaSocket module: " .. repnmdcoutchars (err) .. "|", 5, 10)
	else
		-- luasocket version
		table_othsets ["ver_sock"] = string.sub (lsock._VERSION, 11, -1)

		if not table_othsets ["ver_sock"] then
			VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to detect LuaSocket version|", 5, 10)
		end

		-- load socket.http
		local res, err = pcall (function () lsockhttp = require ("socket.http") end)

		if not res then
			VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to load LuaSocket HTTP module: " .. repnmdcoutchars (err) .. "|", 5, 10)
		end

		-- load ltn12
		local res, err = pcall (function () lsockltn12 = require ("ltn12") end)

		if not res then
			VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to load LuaSocket LTN12 module: " .. repnmdcoutchars (err) .. "|", 5, 10)
		else
			-- ltn12 version
			table_othsets ["ver_ltn12"] = string.sub (lsockltn12._VERSION, 7, -1)

			if not table_othsets ["ver_ltn12"] then
				VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to detect LuaSocket LTN12 version|", 5, 10)
			end
		end
	end

	]]--

	-- getusercc function

	if VH.GetUserCC then
		table_othsets ["func_getcc"] = true
	else
		VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to run VH:GetUserCC|", 5, 10)
	end

	-- getusercity function

	if VH.GetUserCity then
		table_othsets ["func_getusercity"] = true
	else
		VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to run VH:GetUserCity|", 5, 10)
	end

	-- getipcn function

	if VH.GetIPCN then
		table_othsets ["func_getipcn"] = true
	else
		VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to run VH:GetIPCN|", 5, 10)
	end

	-- getusergeoip function

	if VH.GetUserGeoIP then
		table_othsets ["func_getusergeoip"] = true
	else
		VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to run VH:GetUserGeoIP|", 5, 10)
	end

	-- gethostgeoip function

	if VH.GetHostGeoIP then
		table_othsets ["func_gethostgeoip"] = true
	else
		VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to run VH:GetHostGeoIP|", 5, 10)
	end

	-- getbots function

	if VH.GetBots then
		table_othsets ["func_getbots"] = true
	else
		VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to run VH:GetBots|", 5, 10)
	end

	-- getuptime function

	if VH.GetUpTime then
		table_othsets ["func_getuptime"] = true
	else
		VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to run VH:GetUpTime|", 5, 10)
	end

	if VH.GetTopic then -- gettopic function
		table_othsets ["func_gettopic"] = true
	else
		VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to run VH:GetTopic|", 5, 10)
	end

	if VH.GetUserVersion then -- getuserversion function
		table_othsets ["func_getuserversion"] = true
	else
		VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to run VH:GetUserVersion|", 5, 10)
	end

	if VH.GetUserSupports then -- getusersupports function
		table_othsets ["func_getusersupports"] = true
	else
		VH:SendDataToAll ("<" .. table_sets ["ledobotnick"] .. "> Warning: Unable to run VH:GetUserSupports|", 5, 10)
	end

	return false
end

----- ---- --- -- -

function getstatus (nick)
	local lusr = string.lower (nick)

	for user in string.gmatch (getnicklist (), "([^$]+)%$%$") do
		if string.lower (user) == lusr then
			return 1
		end
	end

	return 0
end

----- ---- --- -- -

function getcsnick (nick)
	local lusr = tolow (nick)

	for usr in string.gmatch (getnicklist (), "([^$]+)%$%$") do
		if tolow (usr) == lusr then
			return usr
		end
	end

	return nil
end

----- ---- --- -- -

function getrandomnick ()
	local users = {}

	for user in string.gmatch (getnicklist (), "([^$]+)%$%$") do
		table.insert (users, user)
	end

	return users [math.random (table.getn (users))]
end

----- ---- --- -- -

function getregclass (nick)
	local _, rows = VH:SQLQuery ("select `class` from `reglist` where `nick` = '"..repsqlchars (nick).."' limit 1")

	if rows > 0 then
		local _, val = VH:SQLFetch (0)
		return tonumber (val) or -2
	else
		return nil
	end
end

----- ---- --- -- -

function getclass (nick)
	local _, cls = VH:GetUserClass (nick)

	if cls then
		return tonumber (cls) or -2
	else
		return -2
	end
end

----- ---- --- -- -

function getmyinfo (nick)
local _, mi = VH:GetMyINFO (nick)

if mi and (string.len (mi) > 0) then
	return mi
else
	return nil
end
end

----- ---- --- -- -

function getusercount ()
local _, cnt = VH:GetUsersCount ()

if cnt then
	return tonumber (cnt) or 0
else
	return 0
end
end

----- ---- --- -- -

function gettotsharesize ()
local _, sz = VH:GetTotalShareSize ()

if sz then
	return tonumber (sz) or 0
else
	return 0
end
end

----- ---- --- -- -

function getuptime ()
local _, sec = VH:GetUpTime ()

if sec then
	return tonumber (sec) or 0
else
	return 0
end
end

----- ---- --- -- -

function getnicklist ()
local _, nl = VH:GetNickList ()

if nl and (string.len (nl) > 13) then
	return string.sub (nl, 11)
else
	return nil
end
end

----- ---- --- -- -

function getip (nick)
	local _, ip = VH:GetUserIP (nick)

	if ip and (string.len (ip) > 0) then
		return ip
	else
		return "[unknown]"
	end
end

----- ---- --- -- -

function getusersbyip (ip)
	local ul = {}

	for user in string.gmatch (getnicklist (), "([^$]+)%$%$") do
		if user ~= "" then
			if getip (user) == ip then
				if getclass (user) < table_sets ["scanbelowclass"] then
					table.insert (ul, user)
				end
			end
		end
	end

	return ul
end

----- ---- --- -- -

function dropallbyip (ip)
	local ul = getusersbyip (ip)

	for _, u in pairs (ul) do
		VH:CloseConnection (u)
	end

	return table.getn (ul)
end

----- ---- --- -- -

function kickallbyip (ip, rsn)
	local ul = getusersbyip (ip)

	for _, u in pairs (ul) do
		VH:KickUser (table_othsets ["sendfrom"], u, rsn)
	end

	return table.getn (ul)
end

----- ---- --- -- -

function getcc (nick)
	local res, cc = VH:GetUserCC (nick)

	if (not res) or (not cc) or (cc == "User not found") then
		return nil
	elseif cc == "" then
		return "--"
	else
		return string.upper (cc)
	end
end

----- ---- --- -- -

function tryipcc (addr, nick)
	if nick then
		local res, code = VH:GetUserCC (nick)

		if res and code then
			if code == "--" then
				return ""
			else
				return "." .. code
			end
		end
	end

	if VH.GetIPCC then
		local res, code = VH:GetIPCC (addr)

		if res and code then
			if code == "--" then
				return ""
			else
				return "." .. code
			end
		end
	end

	return ""
end

----- ---- --- -- -

function getusercity (nick)
	local res, city = VH:GetUserCity (nick)

	if (not res) or (not city) then
		return nil
	elseif city == "" then
		return "--"
	else
		return city
	end
end

----- ---- --- -- -

function gethost (nick)
local _, host = VH:GetUserHost (nick)

if host and (string.len (host) > 0) then
	return host
else
	return "[unknown]"
end
end

----- ---- --- -- -

function getconfig (var)
	local _, cfg = VH:GetConfig ("config", var)

	if cfg then
		if cfg == "Error calling GetConfig API" then
			return nil
		else
			return tonumber (cfg) or cfg
		end
	else
		return nil
	end
end

----- ---- --- -- -

function getextconfig (grp, var)
	local _, cfg = VH:GetConfig (grp, var)

	if cfg then
		if cfg == "Error calling GetConfig API" then
			return nil
		else
			return tonumber (cfg) or cfg
		end
	else
		return nil
	end
end

----- ---- --- -- -

function getulimit ()
local res = os.execute ("ulimit -n > \""..table_othsets ["cfgdir"]..table_othsets ["tmpfile"].."\"") -- open files limit

if res then
	local f = io.open (table_othsets ["cfgdir"]..table_othsets ["tmpfile"], "r")

	if f then
		local ulim = f:read ("*line") -- read first line
		f:close ()
		os.remove (table_othsets ["cfgdir"]..table_othsets ["tmpfile"])

		if ulim and tonumber (ulim) then
			return tonumber (ulim)
		end
	end
end

return nil
end

----- ---- --- -- -

function genchatcode ()
	local vcode, code = "", ""

	for x = 1, table_sets ["codelength"] do
		--local num, chr = math.random (0, 1), ""
		local ran = math.random (1, string.len (table_sets ["codecharlist"]))
		local chr = string.sub (table_sets ["codecharlist"], ran, ran)

		--if num == 1 then
			--chr = math.random (48, 57)
		--elseif num == 0 then
			--chr = math.random (65, 90)
		--end

		if x == table_sets ["codelength"] then -- end
			vcode = vcode..chr -- string.char (chr)
		else
			vcode = vcode..chr..table_sets ["codecharsep"] -- string.char (chr)
		end

		code = code..chr -- string.char (chr)
	end

	return vcode, code
end

----- ---- --- -- -

function repexdots (str)
	local ret = str
	ret = string.gsub (ret, "%.", "%%.")
	return ret
end

----- ---- --- -- -

function repsqlchars (txt)
	local ret = string.gsub (txt, string.char (92), string.char (92, 92)) -- backslash
	ret = string.gsub (ret, string.char (34), string.char (92, 34)) -- double quote
	ret = string.gsub (ret, string.char (39), string.char (92, 39)) -- single quote
	return ret
end

----- ---- --- -- -

function encodeurl (url)
	local ret = url
	ret = string.gsub (ret, "%%", "%%25")
	ret = string.gsub (ret, "!", "%%21")
	ret = string.gsub (ret, "%*", "%%2A")
	ret = string.gsub (ret, "\"", "%%22")
	ret = string.gsub (ret, "'", "%%27")
	ret = string.gsub (ret, "%(", "%%28")
	ret = string.gsub (ret, "%)", "%%29")
	ret = string.gsub (ret, ";", "%%3B")
	ret = string.gsub (ret, ":", "%%3A")
	ret = string.gsub (ret, "@", "%%40")
	ret = string.gsub (ret, "&", "%%26")
	ret = string.gsub (ret, "=", "%%3D")
	ret = string.gsub (ret, "%+", "%%2B")
	ret = string.gsub (ret, "%$", "%%24")
	ret = string.gsub (ret, ",", "%%2C")
	ret = string.gsub (ret, "/", "%%2F")
	ret = string.gsub (ret, "%?", "%%3F")
	ret = string.gsub (ret, "#", "%%23")
	ret = string.gsub (ret, "%[", "%%5B")
	ret = string.gsub (ret, "%]", "%%5D")
	ret = string.gsub (ret, "<", "%%3C")
	ret = string.gsub (ret, ">", "%%3E")
	ret = string.gsub (ret, "~", "%%7E")
	ret = string.gsub (ret, "%.", "%%2E")
	ret = string.gsub (ret, "{", "%%7B")
	ret = string.gsub (ret, "}", "%%7D")
	ret = string.gsub (ret, "|", "%%7C")
	ret = string.gsub (ret, "\\", "%%5C")
	ret = string.gsub (ret, "%-", "%%2D")
	ret = string.gsub (ret, "`", "%%60")
	ret = string.gsub (ret, "_", "%%5F")
	ret = string.gsub (ret, "%^", "%%5E")
	return ret
end

----- ---- --- -- -

function repdatechars (txt)
	local str = string.gsub (txt, "%-", "%%-")
	return str
end

----- ---- --- -- -

function reprexpchars (s)
	local r = string.gsub (s, "%%", "%%%%")
	return r
end

----- ---- --- -- -

function reppatchars (str)
	local ret = str
	ret = string.gsub (ret, "%%", "%%%%")
	ret = string.gsub (ret, "%^", "%%^")
	ret = string.gsub (ret, "%$", "%%$")
	ret = string.gsub (ret, "%(", "%%(")
	ret = string.gsub (ret, "%)", "%%)")
	ret = string.gsub (ret, "%.", "%%.")
	ret = string.gsub (ret, "%[", "%%[")
	ret = string.gsub (ret, "%]", "%%]")
	ret = string.gsub (ret, "%*", "%%*")
	ret = string.gsub (ret, "%+", "%%+")
	ret = string.gsub (ret, "%-", "%%-")
	ret = string.gsub (ret, "%?", "%%?")
	return ret
end

----- ---- --- -- -

function tolow (s)
	local r = s

	for _, v in pairs (tbl_cyrlet) do -- cyrillic
		if v.low then
			r = string.gsub (r, string.char (v.cyr), reprexpchars (string.char (v.low)))
		end
	end

	r = string.lower (r) -- latin
	return r
end

----- ---- --- -- -

function repsrchchars (txt)
	local str = string.gsub (txt, "%$", " ")
	return str
end

----- ---- --- -- -

function repnmdcoutchars (txt)
	local ret = string.gsub (txt, "%$", "&#36;")
	ret = string.gsub (ret, "|", "&#124;")
	return ret
end

----- ---- --- -- -

function repnmdcinchars (txt)
	local ret = string.gsub (txt, "&#36;", "$")
	ret = string.gsub (ret, "&#124;", "|")
	return ret
end

----- ---- --- -- -

function repnickchars (txt)
	local ret = string.gsub (txt, "<", "_")
	ret = string.gsub (ret, ">", "_")
	ret = string.gsub (ret, string.char (32), string.char (160)) -- space to non-breaking space
	return ret
end

----- ---- --- -- -

function repwordranchars (s, stage)
	local r = ""

	if stage == 0 then
		r = string.gsub (s, string.char (190), "$") -- three fourths
		r = string.gsub (r, string.char (189), "$") -- one half
		r = string.gsub (r, string.char (188), "$") -- one fourth
		r = string.gsub (r, string.char (187), "$") -- right angle quote
		r = string.gsub (r, string.char (182), "$") -- paragraph sign
		r = string.gsub (r, string.char (174), "$") -- registered trademark
		r = string.gsub (r, string.char (171), "$") -- left angle quote
		r = string.gsub (r, string.char (169), "$") -- copyright
		r = string.gsub (r, string.char (167), "$") -- section sign
		r = string.gsub (r, string.char (166), "$") -- broken vertical bar
		r = string.gsub (r, string.char (164), "$") -- general currency sign
		r = string.gsub (r, string.char (163), "$") -- pound sterling
		r = string.gsub (r, string.char (162), "$") -- cent sign
		r = string.gsub (r, string.char (126), "$") -- tilde
		r = string.gsub (r, string.char (125), "$") -- right curly brace
		r = string.gsub (r, string.char (124), "$") -- vertical bar
		r = string.gsub (r, string.char (123), "$") -- left curly brace
		r = string.gsub (r, "%"..string.char (94), "$") -- caret
		r = string.gsub (r, "%"..string.char (93), "$") -- right square bracket
		r = string.gsub (r, string.char (92), "$") -- backslash
		r = string.gsub (r, "%"..string.char (91), "$") -- left square bracket
		r = string.gsub (r, string.char (64), "$") -- at sign
		r = string.gsub (r, "%"..string.char (63), "$") -- question mark
		r = string.gsub (r, string.char (62), "$") -- greater than sign
		r = string.gsub (r, string.char (61), "$") -- equals sign
		r = string.gsub (r, string.char (60), "$") -- less than sign
		r = string.gsub (r, string.char (59), "$") -- semicolon
		r = string.gsub (r, string.char (58), "$") -- colon
		r = string.gsub (r, string.char (47), "$") -- slash
		r = string.gsub (r, string.char (44), "$") -- comma
		r = string.gsub (r, "%"..string.char (43), "$") -- plus sign
		r = string.gsub (r, "%"..string.char (42), "$") -- asterisk
		r = string.gsub (r, "%"..string.char (41), "$") -- right parenthesis
		r = string.gsub (r, "%"..string.char (40), "$") -- left parenthesis
		r = string.gsub (r, "%"..string.char (37), "$") -- percent sign
		r = string.gsub (r, string.char (35), "$") -- number sign
		r = string.gsub (r, string.char (34), "$") -- double quotation mark
		r = string.gsub (r, string.char (33), "$") -- exclamation mark
		r = string.gsub (r, string.char (32), "$") -- space
		r = string.gsub (r, "\r", "$")
		r = string.gsub (r, "\r\n", "$")
		r = string.gsub (r, "\t", "$")
	else
		r = string.gsub (s, "^["..string.char (160).."]+", "") -- non-breaking space
		r = string.gsub (r, "["..string.char (160).."]+$", "")
		r = string.gsub (r, "^["..string.char (95).."]+", "") -- underscore
		r = string.gsub (r, "["..string.char (95).."]+$", "")
		r = string.gsub (r, "^[%"..string.char (46).."]+", "") -- period
		r = string.gsub (r, "[%"..string.char (46).."]+$", "")
		r = string.gsub (r, "^[%"..string.char (45).."]+", "") -- hyphen
		r = string.gsub (r, "[%"..string.char (45).."]+$", "")
		r = string.gsub (r, "^["..string.char (38).."]+", "") -- ampersand
		r = string.gsub (r, "["..string.char (38).."]+$", "")
		r = string.gsub (r, "%"..string.char (36), "") -- dollar sign
	end

	return r
end

----- ---- --- -- -

function reptextvars (str, var_nick, var_message)
local ntime = os.time () + table_sets ["srvtimediff"] -- current time
local txt = str

if var_nick then -- skip for reminder
	if string.find (txt, "<nick>") then
		txt = string.gsub (txt, "<nick>", reprexpchars (var_nick))
	end

	if string.find (txt, "<message>") then
		txt = string.gsub (txt, "<message>", reprexpchars (var_message))
	end
end

if string.find (txt, "<randnick>") then
	local rnick = getrandomnick ()
	txt = string.gsub (txt, "<randnick>", reprexpchars (getcustnick (rnick) or rnick))
end

if string.find (txt, "<date>") then
	local var_date = os.date (table_sets ["dateformat"], ntime)
	txt = string.gsub (txt, "<date>", reprexpchars (var_date))
end

if string.find (txt, "<time>") then
	local var_time = os.date (table_sets ["timeformat"], ntime)
	txt = string.gsub (txt, "<time>", reprexpchars (var_time))
end

if string.find (txt, "<hubname>") then
	txt = string.gsub (txt, "<hubname>", reprexpchars (getconfig ("hub_name")))
end

	if string.find (txt, "<topic>") then
		local topic = table_othsets ["topicvalue"]
		if table_othsets ["func_gettopic"] == true then topic = VH:GetTopic () end
		txt = string.gsub (txt, "<topic>", reprexpchars (topic or ""))
	end

if string.find (txt, "<hubdesc>") then
	txt = string.gsub (txt, "<hubdesc>", reprexpchars (getconfig ("hub_desc")))
end

if string.find (txt, "<hubcat>") then
	txt = string.gsub (txt, "<hubcat>", reprexpchars (getconfig ("hub_category")))
end

if string.find (txt, "<hubown>") then
	txt = string.gsub (txt, "<hubown>", reprexpchars (getconfig ("hub_owner")))
end

if string.find (txt, "<hubver>") then
	txt = string.gsub (txt, "<hubver>", reprexpchars (getconfig ("hub_version")))
end

if string.find (txt, "<optrig>") then
	txt = string.gsub (txt, "<optrig>", reprexpchars (string.sub (getconfig ("cmd_start_op"), 1, 1)))
end

if string.find (txt, "<ustrig>") then
	txt = string.gsub (txt, "<ustrig>", reprexpchars (string.sub (getconfig ("cmd_start_user"), 1, 1)))
end

if string.find (txt, "<hubbot>") then
	txt = string.gsub (txt, "<hubbot>", reprexpchars (table_othsets ["botnick"]))
end

if string.find (txt, "<hubopch>") then
	txt = string.gsub (txt, "<hubopch>", reprexpchars (table_othsets ["opchatnick"]))
end

if string.find (txt, "<hubhost>") then
	txt = string.gsub (txt, "<hubhost>", reprexpchars (getconfig ("hub_host")))
end

if string.find (txt, "<hubport>") then
	txt = string.gsub (txt, "<hubport>", reprexpchars (getconfig ("listen_port")))
end

if string.find (txt, "<hubmaxusr>") then
	txt = string.gsub (txt, "<hubmaxusr>", reprexpchars (getconfig ("max_users")))
end

if string.find (txt, "<hubminsh>") then
	txt = string.gsub (txt, "<hubminsh>", reprexpchars (makesize (getconfig ("min_share") * 1048576)))
end

if string.find (txt, "<hubmaxsh>") then
	txt = string.gsub (txt, "<hubmaxsh>", reprexpchars (makesize (getconfig ("max_share") * 1048576)))
end

if string.find (txt, "<ledover>") then
	txt = string.gsub (txt, "<ledover>", reprexpchars (ver_ledo))
end

if string.find (txt, "<suptshrt>") then
	txt = string.gsub (txt, "<suptshrt>", reprexpchars (formatuptime (table_othsets ["uptime"], true)))
end

if string.find (txt, "<suptlong>") then
	txt = string.gsub (txt, "<suptlong>", reprexpchars (formatuptime (table_othsets ["uptime"], false)))
end

if table_othsets ["func_getuptime"] == true then -- hub uptime
	local ut = os.time () - getuptime ()

	if string.find (txt, "<huptshrt>") then
		txt = string.gsub (txt, "<huptshrt>", reprexpchars (formatuptime (ut, true)))
	end

	if string.find (txt, "<huptlong>") then
		txt = string.gsub (txt, "<huptlong>", reprexpchars (formatuptime (ut, false)))
	end

	local _, rows = VH:SQLQuery ("select `time`, `count` from `"..tbl_sql ["stat"].."` where `type` = 'uptime_peak' limit 1")
	local ptm, put = ntime, 0

	if rows > 0 then
		_, ptm, put = VH:SQLFetch (0)
		put = os.time () - tonumber (put)
	end

	if string.find (txt, "<peakhuptshrt>") then
		txt = string.gsub (txt, "<peakhuptshrt>", reprexpchars (formatuptime (put, true)))
	end

	if string.find (txt, "<peakhuptlong>") then
		txt = string.gsub (txt, "<peakhuptlong>", reprexpchars (formatuptime (put, false)))
	end

	if string.find (txt, "<peakhupttime>") then
		txt = string.gsub (txt, "<peakhupttime>", reprexpchars (fromunixtime (ptm, false)))
	end

	if string.find (txt, "<peakhuptshrttime>") then
		txt = string.gsub (txt, "<peakhuptshrttime>", reprexpchars (fromunixtime (ptm, true)))
	end
end

if string.find (txt, "<usercnt>") then
	txt = string.gsub (txt, "<usercnt>", reprexpchars (getusercount ()))
end

if string.find (txt, "<peakusers>") then
	local _, rows = VH:SQLQuery ("select `time`, `count` from `"..tbl_sql ["stat"].."` where `type` = 'users_peak' limit 1")
	local ptm, puc = ntime, 0

	if rows > 0 then
		_, ptm, puc = VH:SQLFetch (0)
	end

	txt = string.gsub (txt, "<peakusers>", reprexpchars (puc))

	if string.find (txt, "<peakuserstime>") then
		txt = string.gsub (txt, "<peakuserstime>", reprexpchars (fromunixtime (ptm, false)))
	end

	if string.find (txt, "<peakusersshrttime>") then
		txt = string.gsub (txt, "<peakusersshrttime>", reprexpchars (fromunixtime (ptm, true)))
	end
end

if string.find (txt, "<totshare>") then
	txt = string.gsub (txt, "<totshare>", reprexpchars (makesize (gettotsharesize ())))
end

if string.find (txt, "<peakshare>") then
	local _, rows = VH:SQLQuery ("select `time`, `count` from `"..tbl_sql ["stat"].."` where `type` = 'share_peak' limit 1")
	local ptm, pts = ntime, 0

	if rows > 0 then
		_, ptm, pts = VH:SQLFetch (0)
	end

	txt = string.gsub (txt, "<peakshare>", reprexpchars (makesize (pts)))

	if string.find (txt, "<peaksharetime>") then
		txt = string.gsub (txt, "<peaksharetime>", reprexpchars (fromunixtime (ptm, false)))
	end

	if string.find (txt, "<peakshareshrttime>") then
		txt = string.gsub (txt, "<peakshareshrttime>", reprexpchars (fromunixtime (ptm, true)))
	end
end

	-- average share per user

	if string.find (txt, "<avgshare>") then
		local uc = getusercount ()
		local ts = gettotsharesize ()

		if (uc > 0) and (ts > 0) then
			txt = string.gsub (txt, "<avgshare>", reprexpchars (makesize (roundint ((ts / uc), 0))))
		else
			txt = string.gsub (txt, "<avgshare>", reprexpchars (makesize (0)))
		end
	end

	if string.find (txt, "<peakavgshare>") then
		local _, rows = VH:SQLQuery ("select `time`, `count` from `"..tbl_sql ["stat"].."` where `type` = 'avgshare_peak' limit 1")
		local pavgtm, pavg = ntime, 0

		if rows > 0 then
			_, pavgtm, pavg = VH:SQLFetch (0)
		end

		txt = string.gsub (txt, "<peakavgshare>", reprexpchars (makesize (pavg)))

		if string.find (txt, "<peakavgsharetime>") then
			txt = string.gsub (txt, "<peakavgsharetime>", reprexpchars (fromunixtime (pavgtm, false)))
		end

		if string.find (txt, "<peakavgshareshrttime>") then
			txt = string.gsub (txt, "<peakavgshareshrttime>", reprexpchars (fromunixtime (pavgtm, true)))
		end
	end

	-- memory usage

if string.find (txt, "<memusg>") then
	txt = string.gsub (txt, "<memusg>", reprexpchars (makesize (getmemusg ())))
end

if string.find (txt, "<peakmemusg>") then
	local _, rows = VH:SQLQuery ("select `time`, `count` from `"..tbl_sql ["stat"].."` where `type` = 'memory_peak' limit 1")
	local ptm, pmu = ntime, 0

	if rows > 0 then
		_, ptm, pmu = VH:SQLFetch (0)
	end

	txt = string.gsub (txt, "<peakmemusg>", reprexpchars (makesize (pmu)))

	if string.find (txt, "<peakmemusgtime>") then
		txt = string.gsub (txt, "<peakmemusgtime>", reprexpchars (fromunixtime (ptm, false)))
	end

	if string.find (txt, "<peakmemusgshrttime>") then
		txt = string.gsub (txt, "<peakmemusgshrttime>", reprexpchars (fromunixtime (ptm, true)))
	end
end

return txt
end

----- ---- --- -- -

function statustostr (sts)
if sts == 1 then
	return getlang (723)
elseif sts == 2 then
	return getlang (724)
elseif sts == 3 then
	return getlang (725)
elseif sts == 4 then
	return getlang (726)
elseif sts == 5 then
	return getlang (727)
elseif sts == 6 then
	return getlang (728)
elseif sts == 7 then
	return getlang (729)
elseif sts == 8 then
	return getlang (730)
elseif sts == 9 then
	return getlang (731)
elseif sts == 10 then
	return getlang (732)
elseif sts == 11 then
	return getlang (733)
elseif sts == 12 then
	return getlang (734)
elseif sts == 13 then
	return getlang (735)
elseif sts == 14 then
	return getlang (736)
elseif sts == 15 then
	return getlang (737)
elseif sts == 16 then
	return getlang (738)
elseif sts == 17 then
	return getlang (739)
elseif sts == 18 then
	return getlang (740)
elseif sts == 19 then
	return getlang (741)
elseif sts == 20 then
	return getlang (742)
elseif sts == 21 then
	return getlang (743)
elseif sts == 22 then
	return getlang (744)
elseif sts == 23 then
	return getlang (745)
elseif sts == 24 then
	return getlang (746)
elseif sts == 25 then
	return getlang (747)
elseif sts == 26 then
	return getlang (748)
elseif sts == 27 then
	return getlang (749)
elseif sts == 28 then
	return getlang (750)
elseif sts == 29 then
	return getlang (751)
elseif sts == 30 then
	return getlang (752)
elseif sts == 31 then
	return getlang (753)
else
	return sts
end
end

----- ---- --- -- -

function fromunixtime (sec, shrt, ldate)
	local ntm = tonumber (sec) or 0

	if shrt then
		return os.date (ldate or table_sets ["dateformat"], ntm)
	else
		return os.date (ldate or table_sets ["dateformat"] .. " " .. table_sets ["timeformat"], ntm)
	end
end

----- ---- --- -- -

function prezero (ml, cl)
	local zr = ""

	for x = 1, ml - string.len (cl) do
		zr = zr.."0"
	end

	return zr..cl
end

----- ---- --- -- -

function roundint (int, len)
	local nint = tonumber (string.format ("%."..(len or 0).."f", int))
	return nint
end

----- ---- --- -- -

function valor (val, bad)
	if val == bad then
		return nil
	else
		return val
	end
end

----- ---- --- -- -

function makesize (bytes)
local b = tonumber (bytes) or 0

if b >= 1152921504606846976 then -- eib
	return roundint (b / 1152921504606846976, 2).." "..getlang (366)
end

if b >= 1125899906842624 then -- pib
	return roundint (b / 1125899906842624, 2).." "..getlang (360)
end

if b >= 1099511627776 then -- tib
	return roundint (b / 1099511627776, 2).." "..getlang (361)
end

if b >= 1073741824 then -- gib
	return roundint (b / 1073741824, 2).." "..getlang (362)
end

if b >= 1048576 then -- mib
	return roundint (b / 1048576, 2).." "..getlang (363)
end

if b >= 1024 then -- kib
	return roundint (b / 1024, 2).." "..getlang (364)
end

return b.." "..getlang (365)
end

----- ---- --- -- -

function formatuptime (uptime, fmt)
local t = os.date ("!*t", os.time () - uptime)
t.month = t.month - 1
t.day = t.day - 1
local ret = ""

if fmt == true then -- short
	ret = string.format (table_sets ["shrtuptimefmt"], prezero (2, t.month), prezero (2, t.day), prezero (2, t.hour), prezero (2, t.min), prezero (2, t.sec))
else -- long
	if t.month > 0 then
		if t.month == 1 then ret = ret..t.month.." "..getlang (434).." " else ret = ret..t.month.." "..getlang (435).." " end
	end

	if t.day > 0 then
		if t.day == 1 then ret = ret..t.day.." "..getlang (436).." " else ret = ret..t.day.." "..getlang (4).." " end
	end

	if t.hour > 0 then
		if t.hour == 1 then ret = ret..t.hour.." "..getlang (437).." " else ret = ret..t.hour.." "..getlang (438).." " end
	end

	if t.min > 0 then
		if t.min == 1 then ret = ret..t.min.." "..getlang (503).." " else ret = ret..t.min.." "..getlang (206).." " end
	end

	if t.sec == 1 then ret = ret..t.sec.." "..getlang (537) else ret = ret..t.sec.." "..getlang (452) end
end

return ret
end

----- ---- --- -- -

function counttable (tbl)
	local _, rows = VH:SQLQuery ("select count(*) from `"..tbl.."`")
	local num = 0

	if rows > 0 then
		_, num = VH:SQLFetch (0)
	end

	return tonumber (num)
end

----- ---- --- -- -

function cleantablebyclass (limit, tbl)
local _, rows = VH:SQLQuery ("select `nick` from `"..tbl.."`")

if rows > 0 then
	local t = {}

	for x = 0, rows - 1 do
		local _, usr = VH:SQLFetch (x)

		if getclass (usr) < limit then
			t [usr] = x
		end
	end

	for k, _ in pairs (t) do
		VH:SQLQuery ("delete from `"..tbl.."` where `nick` = '"..repsqlchars (k).."' limit 1")
	end
end
end

----- ---- --- -- -

function isbot (nick)
if nick == table_othsets ["botnick"] then return true end -- security bot
if nick == table_othsets ["opchatnick"] then return true end -- operators chat

if table_othsets ["func_getbots"] == true then
	local bots = VH:GetBots () -- other registered bots
	if not bots then return false end

	for _, v in pairs (bots) do
		if nick == v ["sNick"] then
			return true
		end
	end
else
	if (nick == table_othsets ["lasttimenick"]) or (nick == table_sets ["ledobotnick"]) or (ischatroom (nick) == true) then return true end
end

return false
end

----- ---- --- -- -

function antiscan (nick, class, data, where, to, status)
	-- where: 1 = main chat, 2 = private message, 3 = offline message, 4 = report command

	if table_sets ["enableantispam"] == 0 then
		return 1
	end

	if class >= table_sets ["antibelowclass"] then
		return 1
	end

	if string.len (data) == 0 then
		return 1
	end

	if ((where == 2) or (where == 3)) and (table_sets ["allowspamtoops"] == 1) and (getclass (to) >= 3) then
		return 1
	end

	local _, rows = VH:SQLQuery ("select `exception` from `" .. tbl_sql ["antiex"] .. "`")
	local exlist = {}

	for x = 0, rows - 1 do
		local _, entry = VH:SQLFetch (x)
		table.insert (exlist, entry)
	end

	local lowdata = tolow (repnmdcinchars (data))
	local flag = 1

	if (where == 2) or (where == 3) then
		flag = 2
	end

	local _, rows = VH:SQLQuery ("select `antispam`, `priority`, `action` from `" .. tbl_sql ["anti"] .. "` where `flags` = " .. tostring (flag) .. " or `flags` = 3 order by `priority` desc, `occurred` desc")

	for x = 0, rows - 1 do
		local _, entry, priority, action = VH:SQLFetch (x)
		local fres, fval = pcall (string.find, lowdata, entry)

		if not fres then
			local ferr = getlang (969) .. ":\r\n\r\n"
			ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (entry) .. "\r\n"
			ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
			ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
			opsnotify (table_sets ["classnotiledoact"], ferr)
		elseif fval then
			VH:SQLQuery ("update `" .. tbl_sql ["anti"] .. "` set `occurred` = `occurred` + 1 where `antispam` = '" .. repsqlchars (entry) .. "' limit 1")

			if tonumber (priority) < 7 then -- skip exlist for 7, 8 and 9
				for _, value in pairs (exlist) do
					local fres, fval = pcall (string.find, lowdata, value)

					if not fres then
						local ferr = getlang (975) .. ":\r\n\r\n"
						ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (value) .. "\r\n"
						ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
						ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
						opsnotify (table_sets ["classnotiledoact"], ferr)
					elseif fval then
						VH:SQLQuery ("update `" .. tbl_sql ["antiex"] .. "` set `occurred` = `occurred` + 1 where `exception` = '" .. repsqlchars (value) .. "' limit 1")
						local note = 540

						if where == 2 then
							note = 541
						elseif where == 3 then
							note = 542
						elseif where == 4 then
							note = 543
						end

						local mtip = getip (nick)
						opsnotify (table_sets ["classnotiex"], string.format (getlang (note), nick, mtip .. tryipcc (mtip, nick), class, data))
						return 1
					end
				end
			end

			action = tonumber (action)

			if action == 5 then
				local note = 544

				if where == 2 then
					note = 545
				elseif where == 3 then
					note = 546
				elseif where == 4 then
					note = 547
				end

				local mtip = getip (nick)
				opsnotify (table_sets ["classnotianti"], string.format (getlang (note), nick, mtip .. tryipcc (mtip, nick), class, data))
				return 1
			end

			if action == 4 then -- special action
				if where == 1 then
					maintoself (nick, data)
				elseif where == 3 then
					if status == 1 then
						commandanswer (nick, string.format (getlang (27), to))
					else
						commandanswer (nick, string.format (getlang (28), to))
					end
				end
			elseif action == 9 then -- replace with ninthactrepmsg
				if where == 1 then
					local custnick = nick

					if table_sets ["custnickclass"] < 11 then
						custnick = getcustnick (nick) or nick
					end

					VH:SendDataToAll ("<" .. custnick .. "> " .. table_sets ["ninthactrepmsg"] .. "|", 0, 10)
					addmchistoryline (custnick, nick, table_sets ["ninthactrepmsg"])
				elseif where == 2 then
					local custnick = nick

					if table_sets ["custnickclass"] < 11 then
						custnick = getcustnick (nick) or nick
					end

					VH:SendDataToUser ("$To: " .. to .. " From: " .. nick .. " $<" .. custnick .. "> " .. table_sets ["ninthactrepmsg"] .. "|", to)
				elseif (where == 3) or (where == 4) then
					commandanswer (nick, table_sets ["antimessage"])
				end
			else
				if where == 1 then
					maintouser (nick, table_sets ["antimessage"])
				elseif where == 2 then
					pmtouser (nick, to, table_sets ["antimessage"])
				elseif (where == 3) or (where == 4) then
					commandanswer (nick, table_sets ["antimessage"])
				end
			end

			local note = 548

			if where == 2 then
				note = 549
			elseif where == 3 then
				note = 550
			elseif where == 4 then
				note = 551
			end

			local ip = getip (nick)
			opsnotify (table_sets ["classnotianti"], string.format (getlang (note), nick, ip .. tryipcc (ip, nick), class, data))

			if action == 1 then -- drop
				opsnotify (table_sets ["classnotianti"], string.format (getlang (203), nick))
				VH:CloseConnection (nick)
			elseif action == 2 then -- kick
				local reason = string.gsub (table_sets ["antikreason"], "%*", reprexpchars (data))
				VH:KickUser (table_othsets ["sendfrom"], nick, reason)
			elseif action == 3 then -- temporary ban, kick using thirdacttime
				local reason = string.gsub (table_sets ["antikreason"], "%*", reprexpchars (data))
				VH:KickUser (table_othsets ["sendfrom"], nick, reason .. "     #_ban_" .. table_sets ["thirdacttime"])
			elseif action == 4 then -- spam to self
				opsnotify (table_sets ["classnotianti"], string.format (getlang (52), nick))
			elseif action == 6 then -- redirect to sixthactaddr
				opsnotify (table_sets ["classnotianti"], string.format (getlang (356), nick))
				VH:SendDataToUser ("$ForceMove " .. table_sets ["sixthactaddr"] .. "|", nick)
				VH:CloseConnection (nick)
			elseif action == 7 then -- permanent ban, kick using seventhacttime
				local reason = string.gsub (table_sets ["antikreason"], "%*", reprexpchars (data))
				VH:KickUser (table_othsets ["sendfrom"], nick, reason .. "     #_ban_" .. table_sets ["seventhacttime"])
			elseif action == 8 then -- gag ip
				gagipadd (nil, ip .. " " .. tostring (where))
				opsnotify (table_sets ["classnotianti"], string.format (getlang (655), ip .. tryipcc (ip, nick), table.getn (getusersbyip (ip))))
			elseif action == 9 then -- replace
				if where == 1 then -- mc
					opsnotify (table_sets ["classnotianti"], string.format (getlang (890), nick))
				elseif where == 2 then -- pm
					opsnotify (table_sets ["classnotianti"], string.format (getlang (778), nick))
				end
			elseif action == 10 then -- hard ban
				addhban (nil, repexdots (ip) .. "$ \"" .. entry .. "\"")
				opsnotify (table_sets ["classnotianti"], string.format (getlang (892), ip, table.getn (getusersbyip (ip))))
				VH:CloseConnection (nick)
			end

			return 0
		end
	end

	return 1
end

----- ---- --- -- -

function sefiscan (nick, srch, cls, ip)
	local _, _, tp, str = srch:find ("^%$Search .* .*%?.*%?.*%?(.*)%?(.*)$")

	if not str or # str == 0 then
		return 1
	end

	tp = tonumber (tp) or 1

	if tp < 1 or tp > 9 then
		tp = 1
	end

	local _, rows = VH:SQLQuery ("select `exception` from `" .. tbl_sql ["sefiex"] .. "`")
	local exlist = {}

	for x = 0, rows - 1 do
		local _, ent = VH:SQLFetch (x)
		table.insert (exlist, ent)
	end

	if tp == 9 and str:sub (1, 4):lower () == "tth:" then -- remove "TTH:"
		str = str:sub (5)
	end

	str = repsrchchars (str)
	local lsr = str

	if tp ~= 9 then
		lsr = tolow (lsr)
	end

	local _, rows = VH:SQLQuery ("select `filter`, `priority`, `action` from `" .. tbl_sql ["sefi"] .. "` where `type` = " .. tostring (tp) .. " or `type` = 1 order by `priority` desc, `occurred` desc")

	for x = 0, rows - 1 do
		local _, ent, prio, act = VH:SQLFetch (x)
		local fres, fval = pcall (string.find, lsr, ent)

		if not fres then
			local ferr = getlang (973) .. ":\r\n\r\n"
			ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (ent) .. "\r\n"
			ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
			ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
			opsnotify (table_sets ["classnotiledoact"], ferr)
		elseif fval then
			VH:SQLQuery ("update `" .. tbl_sql ["sefi"] .. "` set `occurred` = `occurred` + 1 where `filter` = '" .. repsqlchars (ent) .. "' limit 1")

			if tonumber (prio) < 7 then -- skip for 7, 8 and 9
				for _, v in pairs (exlist) do
					local fres, fval = pcall (string.find, lsr, v)

					if not fres then
						local ferr = getlang (974) .. ":\r\n\r\n"
						ferr = ferr .. " " .. getlang (970) .. ": " .. repnmdcoutchars (v) .. "\r\n"
						ferr = ferr .. " " .. getlang (971) .. ": " .. repnmdcoutchars (fval or getlang (662)) .. "\r\n"
						ferr = ferr .. " " .. getlang (972) .. ": http://www.lua.org/manual/5.2/manual.html#6.4.1\r\n"
						opsnotify (table_sets ["classnotiledoact"], ferr)
					elseif fval then
						VH:SQLQuery ("update `" .. tbl_sql ["sefiex"] .. "` set `occurred` = `occurred` + 1 where `exception` = '" .. repsqlchars (v) .. "' limit 1")
						local note = 558

						if tp == 2 then
							note = 559
						elseif tp == 3 then
							note = 560
						elseif tp == 4 then
							note = 561
						elseif tp == 5 then
							note = 562
						elseif tp == 6 then
							note = 563
						elseif tp == 7 then
							note = 564
						elseif tp == 8 then
							note = 565
						elseif tp == 9 then
							note = 566
						end

						opsnotify (table_sets ["classnotiex"], string.format (getlang (note), nick, ip .. tryipcc (ip, nick), cls, str))
						return 1
					end
				end
			end

			act = tonumber (act)

			if act == 5 then
				local note = 567

				if tp == 2 then
					note = 568
				elseif tp == 3 then
					note = 569
				elseif tp == 4 then
					note = 570
				elseif tp == 5 then
					note = 571
				elseif tp == 6 then
					note = 572
				elseif tp == 7 then
					note = 573
				elseif tp == 8 then
					note = 574
				elseif tp == 9 then
					note = 575
				end

				opsnotify (table_sets ["classnotisefi"], string.format (getlang (note), nick, ip .. tryipcc (ip, nick), cls, str))
				return 1
			end

			if act ~= 4 then
				local rsn = string.gsub (table_sets ["searfiltmsg"], "%*", reprexpchars (str))
				commandanswer (nick, rsn)
			end

			local note = 576

			if tp == 2 then
				note = 577
			elseif tp == 3 then
				note = 578
			elseif tp == 4 then
				note = 579
			elseif tp == 5 then
				note = 580
			elseif tp == 6 then
				note = 581
			elseif tp == 7 then
				note = 582
			elseif tp == 8 then
				note = 583
			elseif tp == 9 then
				note = 584
			end

			opsnotify (table_sets ["classnotisefi"], string.format (getlang (note), nick, ip .. tryipcc (ip, nick), cls, str))

			if act == 1 then
				opsnotify (table_sets ["classnotisefi"], string.format (getlang (127), nick))
				VH:CloseConnection (nick)
			elseif act == 2 then
				local rsn = string.gsub (table_sets ["sefireason"], "%*", reprexpchars (str))
				VH:KickUser (table_othsets ["sendfrom"], nick, rsn)
			elseif act == 3 then
				local rsn = string.gsub (table_sets ["sefireason"], "%*", reprexpchars (str))
				VH:KickUser (table_othsets ["sendfrom"], nick, rsn .. "     #_ban_" .. table_sets ["thirdacttime"])
			elseif act == 4 then
				opsnotify (table_sets ["classnotisefi"], string.format (getlang (151), nick))
			elseif act == 6 then
				opsnotify (table_sets ["classnotisefi"], string.format (getlang (357), nick))
				VH:SendDataToUser ("$ForceMove " .. table_sets ["sixthactaddr"] .. "|", nick)
				VH:CloseConnection (nick)
			elseif act == 7 then
				local rsn = string.gsub (table_sets ["sefireason"], "%*", reprexpchars (str))
				VH:KickUser (table_othsets ["sendfrom"], nick, rsn .. "     #_ban_" .. table_sets ["seventhacttime"])
			end

			return 0
		end
	end

	return 1
end

----- ---- --- -- -

function maintoself (nick, message)
	VH:SendDataToUser ("<"..nick.."> "..message.."|", nick)
end

----- ---- --- -- -

function offlinepm (from, to, message)
	VH:SendDataToUser ("$To: "..to.." From: "..from.." $<"..from.."> "..message.."|", to)
end

----- ---- --- -- -

function pmtouser (to, from, message)
	VH:SendDataToUser ("$To: "..to.." From: "..from.." $<"..table_othsets ["sendfrom"].."> "..message.."|", to)
end

----- ---- --- -- -

function maintouser (to, message)
	VH:SendDataToUser ("<"..table_othsets ["sendfrom"].."> "..message.."|", to)
end

----- ---- --- -- -

function maintoall (message, mincl, maxcl)
	VH:SendDataToAll ("<"..table_othsets ["sendfrom"].."> "..message.."|", mincl, maxcl)
	addmchistoryline (table_othsets ["sendfrom"], table_othsets ["sendfrom"], message)
end

----- ---- --- -- -

function commandanswer (to, message) -- todo: do we need to replace nmdc characters here? i think its better here than in every function
	if table_sets ["commandstopm"] == 0 then
		VH:SendDataToUser ("<" .. table_othsets ["sendfrom"] .. "> " .. message .. "|", to)
	else
		VH:SendDataToUser ("$To: " .. to .. " From: " .. table_othsets ["botnick"] .. " $<" .. table_othsets ["sendfrom"] .. "> " .. message .. "|", to)
	end
end

----- ---- --- -- -

function ledodbg (msg)
	VH:SendDataToAll ("<Debugger> "..repnmdcoutchars (msg).."|", 10, 10)
end

----- ---- --- -- -

function opsnotify (mincls, msg) -- todo: do we need to replace nmdc characters here? i think its better here than in every function
	if mincls == 11 then return nil end
	VH:SendPMToAll ("[" .. prezero (2, mincls) .. "] " .. msg, table_othsets ["feednick"], mincls, 10)

	if (table_sets ["histbotmsg"] == 1) and (table_sets ["addledobot"] == 0) and (table_sets ["useextrafeed"] == 0) then
		addophistoryline (table_othsets ["opchatnick"], msg)
	end
end

---------------------------------------------------------------------
-- ledokol functions <<
---------------------------------------------------------------------

---------------------------------------------------------------------
-- end of file <<
---------------------------------------------------------------------
