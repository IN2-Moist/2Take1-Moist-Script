function main(feat)
if not MoistScript_NextGen then
	return HANDLER_POP
end


if MoistScript_Translate_Module then
	return HANDLER_POP
end
MoistScript_Translate_Module = "loaded"

local ScriptConfig = _G.ScriptConfig
local json = require("json")
local GTA_Natives = require("MoistScript_GTA_Natives")


function Moist_Notify2(msg1, msg2, colour, timeout)
           timeout = timeout or 8

            colour = colour or 0xff00ffff

		msg2 = msg2 or ""
		msg1 = msg1 or ""
		text = "~h~~y~" .. tostring(msg2) .. "~n~~h~~w~" .. tostring(msg1)
           ui.notify_above_map(text, "", 123)
			--_G.MoistNotify(msg1, msg2, colour, timeout)

 
end

function MoistNotify2(msg1, msg2, colour, timeout)
           timeout = timeout or 8

            colour = colour or 0xff00ffff

		msg2 = msg2 or ""
		msg1 = msg1 or ""
		text = "~h~~y~" .. tostring(msg2) .. "~n~~h~~w~" .. tostring(msg1)
            --ui.notify_above_map(text, "", 123)
			_G.MoistNotify(msg1, msg2, colour, timeout)

 
end

local Translang, MyDefaultTransTo, langID, IpLocTrans = "en", "ru", {}, true

local langSel = {
	"af","az","id","ms","su","bs","ca","ceb","ny","sn","co","cy","da","de","et","en-GB","es","es-419",
	"eu","fil","fr","fr-CA","fy","ga","gl","gd","ha","haw","hr","ig","zu","it","jv","sw","lv","lt","hu","mg"
	,"mt","nl","no","pl","pt-BR","pt-PT","ro","st","sq","sk","sl","so","fi","sv","mi","vi","tk","tr","xh",
	"ht","yo","is","cs","el","uz","be","bg","mk","mn","ru","sr","uk","ky","tg","kk","hy","yi","sd","ne","mr",
	"hi","bn","pa","gu","ta","te","kn","ml","si","th","lo","my","ka","am","km","ku","iw","ur","ar","fa","ps",
"zh-CN","zh-HK","ja","ko"}

local og_yield = coroutine.yield

function coroutine.yield(...)
    if not coroutine.isyieldable() then
        return
	end
    og_yield(...)
end

system.wait = coroutine.yield
system.yield = coroutine.yield

local char_to_hex = function(c)
    return string.format("%%%02X", string.byte(c))
end

local function UrlEncode(url)
    if url == nil then
        return
	end
    if type(url) ~= "string" then
        url = tostring(url)
	end
    url = url:gsub("([^0-9a-zA-Z !'()*._~-])", char_to_hex)
    url = url:gsub(" ", "+")
    return url
end

local function UrlEncode(url)
    if url == nil then
        return
	end
    url = url:gsub("\n", "\r\n")
    url = url:gsub("([^%w ])", char_to_hex)
    url = url:gsub(" ", "+")
    return url
end

function Translate(text, lanf)
	langf = lanf:lower() or "auto"
    local encoded = web.urlencode(text)
    local statusCode, body = web.get("https://translate.googleapis.com/translate_a/single?client=gtx&sl=" .. langf .. "&tl=" .. Translang ..  "&dt=t&q=" .. encoded)
    if statusCode ~= 200 then
        return false, body
	end
    translated = json.decode(body)
    local translatedText = body:match(".-\"(.-)\",\"")
	PlayersLang = translated[3]
	return true, PlayersLang, translatedText
end

function Translatev2(text, lanf, lant)
	
	local TranslatedText = ""
	if string.len(text) < 20 then
	local status, TransText, Lan = Translatev3(text, lanf, lant)
	return status, TransText, Lan
	end

	local seperator = text:find(" ", 1, true)
	if seperator then
	txt = text:sub(1, seperator)
	TxT = text:sub(seperator+1, string.len(text))
	end
	
	local encoded = web.urlencode(txt)

	
	local statusCode, body = web.get("https://clients5.google.com/translate_a/t?client=dict-chrome-ex&sl=" .. lanf .. "&tl=" .. lant .. "&q=" ..encoded)
	
	if statusCode ~= 200 then
		return false, body
	end
	
	if lanf ~= "auto" then
	translated = json.decode(body)

	TranslatedText = TranslatedText .. " " .. translated[1]
	PlayersLang = lanf
	return true, TranslatedText, PlayersLang 
	elseif lanf == "auto" then
	translated = json.decode(body)
	TranslatedText =  TranslatedText .. " " .. translated[1][1]
	PlayersLang = translated[1][2]
	return true, TranslatedText, PlayersLang 
	end

	local encoded = web.urlencode(TxT)

	
	local statusCode, body = web.get("https://clients5.google.com/translate_a/t?client=dict-chrome-ex&sl=" .. lanf .. "&tl=" .. lant .. "&q=" ..encoded)
	
	if statusCode ~= 200 then
		return false, body
	end
	
	if lanf ~= "auto" then
	translated = json.decode(body)

	TranslatedText = TranslatedText .. " " .. translated[1]
	PlayersLang = lanf
	return true, TranslatedText, PlayersLang 
	elseif lanf == "auto" then
	translated = json.decode(body)


	TranslatedText = TranslatedText .. " " .. translated[1][1]
	PlayersLang = translated[1][2]
	
	return true, TranslatedText, PlayersLang 
	end
	
end


function Translatev3(text, lanf, lant)
	local encoded = web.urlencode(text)

	local statusCode, body = web.get("https://clients5.google.com/translate_a/t?client=dict-chrome-ex&sl=" .. lanf .. "&tl=" .. lant .. "&q=" ..encoded)
	
	if statusCode ~= 200 then
		return false, body
	end
	
	if lanf ~= "auto" then
	translated = json.decode(body)

	TranslatedText, PlayersLang = translated[1], lanf
	return true, TranslatedText, PlayersLang 
	elseif lanf == "auto" then
	translated = json.decode(body)

	TranslatedText, PlayersLang = translated[1][1], translated[1][2]
	return true, TranslatedText, PlayersLang 
	end

	
end


function TranslateTo(text, lang)
	lang = lang or "auto"
    local encoded = web.urlencode(text)
    local statusCode, body = web.get("https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=" .. lang ..  "&dt=t&q=" .. encoded)
    if statusCode ~= 200 then
        return false, body
	end
    local translatedText = body:match(".-\"(.-)\",\"")
	return true, translatedText
end

langID = {}
langID["AD"] = "en"
langID["AE"] = "en"
langID["AF"] = "uz"
langID["AL"] = "en"
langID["AM"] = "hy"
langID["AO"] = "pt"
langID["AR"] = "es"
langID["AS"] = "en"
langID["AT"] = "de"
langID["AU"] = "en"
langID["AW"] = "es"
langID["AZ"] = "az"
langID["BB"] = "es"
langID["BD"] = "en"
langID["BG"] = "en"
langID["BH"] = "ar"
langID["BJ"] = "yo"
langID["BM"] = "es"
langID["BO"] = "es"
langID["BR"] = "es"
langID["BS"] = "es"
langID["BY"] = "ru"
langID["BZ"] = "es"
langID["CA"] = "es"
langID["CC"] = "en"
langID["CK"] = "en"
langID["CL"] = "es"
langID["CO"] = "es"
langID["CR"] = "es"
langID["CU"] = "es"
langID["CV"] = "pt"
langID["CX"] = "en"
langID["CY"] = "tr"
langID["DJ"] = "so"
langID["DM"] = "es"
langID["DO"] = "es"
langID["EC"] = "es"
langID["EE"] = "et"
langID["EG"] = "ar"
langID["EH"] = "ar"
langID["ES"] = "es"
langID["FI"] = "sv"
langID["FJ"] = "en"
langID["FM"] = "en"
langID["GA"] = "fr"
langID["GB"] = "en"
langID["GD"] = "es"
langID["GF"] = "es"
langID["GH"] = "ha"
langID["GI"] = "en"
langID["GL"] = "es"
langID["GP"] = "es"
langID["GQ"] = "es"
langID["GR"] = "el"
langID["GT"] = "es"
langID["GU"] = "en"
langID["GW"] = "pt"
langID["GY"] = "es"
langID["HK"] = "en"
langID["HN"] = "es"
langID["HR"] = "en"
langID["HT"] = "es"
langID["HU"] = "hu"
langID["ID"] = "jv"
langID["IE"] = "ga"
langID["IL"] = "iw"
langID["IN"] = "ur"
langID["IO"] = "en"
langID["IR"] = "fa"
langID["IS"] = "is"
langID["JM"] = "en"
langID["JO"] = "ar"
langID["JP"] = "ja"
langID["KG"] = "ru"
langID["KH"] = "km"
langID["KI"] = "en"
langID["KM"] = "fr"
langID["KW"] = "ar"
langID["KY"] = "es"
langID["KZ"] = "ru"
langID["LB"] = "ar"
langID["LC"] = "es"
langID["LK"] = "ta"
langID["LT"] = "lt"
langID["LU"] = "pt"
langID["LV"] = "lv"
langID["MD"] = "fr"
langID["MD"] = "ru"
langID["MG"] = "mg"
langID["MH"] = "en"
langID["MN"] = "mn"
langID["MO"] = "pt"
langID["MP"] = "en"
langID["MQ"] = "es"
langID["MS"] = "es"
langID["MT"] = "mt"
langID["MV"] = "en"
langID["MW"] = "ny"
langID["MX"] = "es"
langID["MY"] = "ta"
langID["NC"] = "fr"
langID["NF"] = "en"
langID["NG"] = "yo"
langID["NI"] = "es"
langID["NP"] = "ne"
langID["NR"] = "en"
langID["NU"] = "en"
langID["NZ"] = "mi"
langID["OM"] = "ar"
langID["PA"] = "es"
langID["PE"] = "es"
langID["PF"] = "fr"
langID["PG"] = "en"
langID["PH"] = "es"
langID["PK"] = "ur"
langID["PL"] = "pl"
langID["PR"] = "es"
langID["PW"] = "en"
langID["PY"] = "es"
langID["QA"] = "ar"
langID["RO"] = "ro"
langID["RW"] = "rw"
langID["SA"] = "en"
langID["SB"] = "en"
langID["SC"] = "fr"
langID["SD"] = "en"
langID["SE"] = "sv"
langID["SG"] = "ta"
langID["SH"] = "en"
langID["SI"] = "sl"
langID["SK"] = "sk"
langID["SM"] = "it"
langID["SO"] = "so"
langID["SR"] = "es"
langID["SV"] = "es"
langID["TD"] = "fr"
langID["TG"] = "fr"
langID["TH"] = "th"
langID["TJ"] = "tg"
langID["TK"] = "en"
langID["TL"] = "pt"
langID["TM"] = "tk"
langID["TN"] = "fr"
langID["TR"] = "tr"
langID["TV"] = "en"
langID["UA"] = "uk"
langID["US"] = "es"
langID["UY"] = "es"
langID["UZ"] = "uz"
langID["VE"] = "es"
langID["VU"] = "fr"
langID["WS"] = "en"
langID["YE"] = "ar"
langID["YT"] = "fr"
langID["ZA"] = "zu"
langID["ZM"] = "en"
langID["ZW"] = "sn"

trans_parent = menu.add_feature("Translate Game Chat", "parent", Features.LocalSettings.id)
trans_parent2 = menu.add_feature("Send Translated Chat Options", "parent", trans_parent.id)
label = menu.add_feature("HotKey (RSHIFT + U)", "action", trans_parent2.id)

MyChatDefault = menu.add_feature("Set a Default Language: ", "action_value_str", trans_parent2.id,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	local lan = MyChatDefault:get_str_data()[MyChatDefault.value + 1]
	ScriptConfig["MyChatTrans"] = lan
	MyDefaultTransTo = lan

end)
MyChatDefault:set_str_data(langSel)
MyChatDefault.value = 0
for i = 1, #MyChatDefault:get_str_data() do
	if MyChatDefault:get_str_data()[i] == ScriptConfig["MyChatTrans"] then
		MyChatDefault.value = i - 1
	end
end

gamechathotkey = menu.add_feature("Send Translated Chat Hotkey RSHIFT+U", "toggle", trans_parent2.id,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if not feat["on"] then
		ScriptConfig["TransChatKey"] = false
		return HANDLER_POP
	end
	ScriptConfig["TransChatKey"] = true
	while feat["on"] do
        if feat.data:is_down() then
			system.yield(300)
            local r, s
            repeat
                r, s = input.get("Lang: Chat to Translate (RU:ChatMessage) for russian", string.upper(MyDefaultTransTo) .. ":", 128, 0)
                if r == 2 then
                    goto continue
				end
                system.yield(0)
			until r == 0
			local lang = s:sub(1, 2)
			local chatmsg = s:sub(4, 128)
			local success, translatedText, Mylang = Translatev2(tostring(chatmsg), Translang, lang)
			system.yield(1000)
			if success then
				network.send_chat_message(translatedText, false)
			end
		end
		::continue::
        system.yield(0)
	end
end)
gamechathotkey["on"] = ScriptConfig["TransChatKey"]
gamechathotkey["data"] = MenuKey()
gamechathotkey.data:push_str("RSHIFT")
gamechathotkey.data:push_str("u")

local transGfx = GTA_Natives.GET_GLOBAL_CHAR_BUFFER()
local ChatEventID = 0
Chat_ToChat_Translation = function(e)
	local success, lang, TestText, success1, langid1, TestText1
	local TransFrom = "auto"
	GTA_Natives.NETWORK_SET_SCRIPT_CONTROLLING_TEAMS(1)
	--GTA_Natives.OVERRIDE_MULTIPLAYER_CHAT_PREFIX(-1755491431)
	GTA_Natives.OVERRIDE_MP_TEXT_CHAT_TEAM_STRING(-1, gameplay.get_hash_key("transGfx"))
	local playerID, senderID, ChatMsg = e["player"], e["sender"], e["body"]
		if not player.is_player_valid(playerID) then
		return
		elseif  player.is_player_valid(playerID) then
		sendername = GTA_Natives.GET_PLAYER_NAME(playerID) or "NaN"
		local chattext = sendername .. ", " .. tostring(e.body) .. ", "	
		if IpLocTrans then
		if type(_G.Session_Players[playerID]["IPInfo"]["countryCode"]) == 'string' then
		local CCD = string.lower(_G.Session_Players[playerID]["IPInfo"]["countryCode"])
		TransFrom = langID[CCD] or auto
		else
		TransFrom = "auto"
		end
		local langfound = false
		for i =1,#langSel do
		if TransFrom == langSel[i] then
		langfound = true
		goto trans
		end
		langfound = false
		end
		TransFrom = "auto"
		::trans::
		success, Test_Text, lang = Translatev2(ChatMsg, "auto", Translang)
		if success then
		if TransFrom ~= 'auto' then
		if lang == TransFrom and lang ~= Translang and Test_Text ~= ChatMsg then
		if string.lower(lang) ~= string.lower(Translang) then

		network.send_chat_message("\n" .. sendername .. "[" .. lang:upper() .."] >>> [" .. Translang:upper() .. "]: ".. Test_Text, chatvisibility.on)
		if TranslateToLog then
			chattext = chattext .. Test_Text
			File_Writer(chattext, FolderPaths.ChatFile, true, true)
			end
		end
		end
		elseif TransFrom == 'auto' and lang ~= Translang and Test_Text ~= ChatMsg then
		
		network.send_chat_message("\n" .. sendername .. "[" .. lang:upper() .."] >>> [" .. Translang:upper() .. "]: ".. Test_Text, chatvisibility.on)
		if TranslateToLog then
			chattext = chattext .. Test_Text
			File_Writer(chattext, FolderPaths.ChatFile, true, true)
			end
		end
		elseif lang ~= TransFrom and lang ~= Translang then
		success, TestText, lang = Translatev2(ChatMsg, TransFrom, Translang)
		if success and lang ~= Translang or TestText ~= ChatMsg then
			if string.lower(lang) ~= string.lower(Translang) then

					network.send_chat_message("\n" .. sendername .. "[" .. lang:upper() .."] >>> [" .. Translang:upper() .. "]: ".. TestText, chatvisibility.on)
					if TranslateToLog then
			chattext = chattext .. TestText
			File_Writer(chattext, FolderPaths.ChatFile, true, true)
			end
		end
		elseif success and lang == Translang or TestText == ChatMsg then
				goto BypassTrans
		end




		
	
		end
		

	::BypassTrans::
			elseif not IpLocTrans then
			success, TestText, lang = Translatev2(ChatMsg, "auto", Translang)
		if success and lang ~= Translang then

			if string.lower(lang) ~= string.lower(Translang) then

					network.send_chat_message("\n" .. sendername .. "[" .. lang:upper() .."] >>> [" .. Translang:upper() .. "]: ".. TestText, chatvisibility.on)
					if TranslateToLog then
			chattext = chattext .. TestText
			File_Writer(chattext, FolderPaths.ChatFile, true, true)
			end
				end
			end
		end
		end
		

return
	
end

Chat_ToNotify_Translation = function(e)
	local success, lang, TestText, success1, langid1, TestText1
	local TransFrom = "auto"
--	GTA_Natives.NETWORK_SET_SCRIPT_CONTROLLING_TEAMS(1)
	--GTA_Natives.OVERRIDE_MULTIPLAYER_CHAT_PREFIX(-1755491431)
	--GTA_Natives.OVERRIDE_MP_TEXT_CHAT_TEAM_STRING(-1, gameplay.get_hash_key("transGfx"))
	local playerID, senderID, ChatMsg = e["player"], e["sender"], e["body"]
		if not player.is_player_valid(playerID) then
		return
		elseif  player.is_player_valid(playerID) then
		sendername = GTA_Natives.GET_PLAYER_NAME(playerID) or  "NaN"

		
		local chattext = sendername .. ", " .. tostring(e.body) .. ", "
		if IpLocTrans then
		if type(_G.Session_Players[playerID]["IPInfo"]["countryCode"]) == 'string' then
		local CCD = string.lower(_G.Session_Players[playerID]["IPInfo"]["countryCode"])
		TransFrom = langID[CCD] or auto
		else
		TransFrom = "auto"
		end
		local langfound = false
		for i =1,#langSel do
		if TransFrom == langSel[i] then
		langfound = true
		goto trans
		end
		langfound = false
		end
		TransFrom = "auto"
		::trans::
		success, Test_Text, lang = Translatev2(ChatMsg, "auto", Translang)
		if success then
		if TransFrom ~= 'auto' then
		if lang == TransFrom and lang ~= Translang and Test_Text ~= ChatMsg then
		if string.lower(lang) ~= string.lower(Translang) then

	--	network.send_chat_message("\n" .. sendername .. "[" .. lang:upper() .."] >>> [" .. Translang:upper() .. "]: ".. Test_Text, chatvisibility.on)
		--_G.MoistNotify(Test_Text, sendername .. " [" .. lang:upper() .." >" .. Translang:upper() .. "]", 0xff00ffff, 10)
		MoistNotify2(Test_Text, sendername .. " [" .. lang:upper() .." >" .. Translang:upper() .. "]", 0xff00ffff, 10)
		if TranslateToLog then
			chattext = chattext .. Test_Text
			File_Writer(chattext, FolderPaths.ChatFile, true, true)
			end
		end
		end
		elseif TransFrom == 'auto' and lang ~= Translang and Test_Text ~= ChatMsg then
		
	--	network.send_chat_message("\n" .. sendername .. "[" .. lang:upper() .."] >>> [" .. Translang:upper() .. "]: ".. Test_Text, chatvisibility.on)
		--_G.MoistNotify(Test_Text, sendername .. " [" .. lang:upper() .." >" .. Translang:upper() .. "]", 0xff00ffff, 10)
		MoistNotify2(Test_Text, sendername .. "\t [" .. lang:upper() .." >" .. Translang:upper() .. "]", 0xff00ffff, 10)
		if TranslateToLog then
		chattext = chattext ..   Test_Text
			File_Writer(chattext, FolderPaths.ChatFile, true, true)
			end
		end
		elseif lang ~= TransFrom and lang ~= Translang then
		success, TestText, lang = Translatev2(ChatMsg, TransFrom, Translang)
		if success and lang ~= Translang or TestText ~= ChatMsg then
			if string.lower(lang) ~= string.lower(Translang) then

				--	network.send_chat_message("\n" .. sendername .. "[" .. lang:upper() .."] >>> [" .. Translang:upper() .. "]: ".. TestText, chatvisibility.on)
					--_G.MoistNotify(TestText, sendername .. " [" .. lang:upper() .." >" .. Translang:upper() .. "]", 0xff00ffff, 10)
					MoistNotify2(TestText, sendername .. " [" .. lang:upper() .." >" .. Translang:upper() .. "]", 0xff00ffff, 10)
					if TranslateToLog then
			chattext = chattext .. TestText
			File_Writer(chattext, FolderPaths.ChatFile, true, true)
			end
		end
		elseif success and lang == Translang or TestText == ChatMsg then
				goto BypassTrans
		end




		
	
		end

	::BypassTrans::
			elseif not IpLocTrans then
			success, TestText, lang = Translatev2(ChatMsg, "auto", Translang)
		if success and lang ~= Translang then

			if string.lower(lang) ~= string.lower(Translang) then

				--	network.send_chat_message("\n" .. sendername .. "[" .. lang:upper() .."] >>> [" .. Translang:upper() .. "]: ".. TestText, chatvisibility.on)
				--_G.MoistNotify(TestText, sendername .. " [" .. lang:upper() .." >" .. Translang:upper() .. "]", 0xff00ffff, 10)
				MoistNotify2(TestText, sendername .. " [" .. lang:upper() .." >" .. Translang:upper() .. "]", 0xff00ffff, 10)
				if TranslateToLog then
			chattext = chattext .. TestText
			File_Writer(chattext, FolderPaths.ChatFile, true, true)
			end
				end
			end
		end
		end
return
end
		



Chat_To_OldNotify_Translation = function(e)
	local success, lang, TestText, success1, langid1, TestText1
	local TransFrom = "auto"
--	GTA_Natives.NETWORK_SET_SCRIPT_CONTROLLING_TEAMS(1)
	--GTA_Natives.OVERRIDE_MULTIPLAYER_CHAT_PREFIX(-1755491431)
	--GTA_Natives.OVERRIDE_MP_TEXT_CHAT_TEAM_STRING(-1, gameplay.get_hash_key("transGfx"))
	
	local playerID, senderID, ChatMsg = e["player"], e["sender"], e["body"]
		if not player.is_player_valid(playerID) then
		return
		elseif  player.is_player_valid(playerID) then
		sendername = GTA_Natives.GET_PLAYER_NAME(playerID) or "NaN"
		local chattext = sendername .. ", " .. tostring(e.body) .. ", " 
		if IpLocTrans then
		if type(_G.Session_Players[playerID]["IPInfo"]["countryCode"]) == 'string' then
		local CCD = string.lower(_G.Session_Players[playerID]["IPInfo"]["countryCode"])
		TransFrom = langID[CCD] or auto
		else
		TransFrom = "auto"
		end
		local langfound = false
		for i =1,#langSel do
		if TransFrom == langSel[i] then
		langfound = true
		goto trans
		end
		langfound = false
		end
		TransFrom = "auto"
		::trans::
		success, Test_Text, lang = Translatev2(ChatMsg, "auto", Translang)
		if success then
		if TransFrom ~= 'auto' then
		if lang == TransFrom and lang ~= Translang and Test_Text ~= ChatMsg then
		if string.lower(lang) ~= string.lower(Translang) then

	--	network.send_chat_message("\n" .. sendername .. "[" .. lang:upper() .."] >>> [" .. Translang:upper() .. "]: ".. Test_Text, chatvisibility.on)
		--_G.MoistNotify(Test_Text, sendername .. " [" .. lang:upper() .." >" .. Translang:upper() .. "]", 0xff00ffff, 10)
		Moist_Notify2(Test_Text, sendername .. "~c~ [" .. lang:upper() .." >" .. Translang:upper() .. "]", 0xff00ffff, 10)
		if TranslateToLog then
			chattext = chattext .. Test_Text
			File_Writer(chattext, FolderPaths.ChatFile, true, true)
			end
		end
		end
		elseif TransFrom == 'auto' and lang ~= Translang and Test_Text ~= ChatMsg then
		
	--	network.send_chat_message("\n" .. sendername .. "[" .. lang:upper() .."] >>> [" .. Translang:upper() .. "]: ".. Test_Text, chatvisibility.on)
		--_G.MoistNotify(Test_Text, sendername .. " [" .. lang:upper() .." >" .. Translang:upper() .. "]", 0xff00ffff, 10)
		Moist_Notify2(Test_Text, sendername .. "\t~c~ [" .. lang:upper() .." >" .. Translang:upper() .. "]", 0xff00ffff, 10)
		if TranslateToLog then
			chattext = chattext  .. Test_Text
			File_Writer(chattext, FolderPaths.ChatFile, true, true)
			end
		end
		elseif lang ~= TransFrom and lang ~= Translang then
		success, TestText, lang = Translatev2(ChatMsg, TransFrom, Translang)
		if success and lang ~= Translang or TestText ~= ChatMsg then
			if string.lower(lang) ~= string.lower(Translang) then

				--	network.send_chat_message("\n" .. sendername .. "[" .. lang:upper() .."] >>> [" .. Translang:upper() .. "]: ".. TestText, chatvisibility.on)
					--_G.MoistNotify(TestText, sendername .. " [" .. lang:upper() .." >" .. Translang:upper() .. "]", 0xff00ffff, 10)
					Moist_Notify2(TestText, sendername .. "~c~ [" .. lang:upper() .." >" .. Translang:upper() .. "]", 0xff00ffff, 10)
					if TranslateToLog then
			chattext = chattext  .. TestText
			File_Writer(chattext, FolderPaths.ChatFile, true, true)
			end
		end
		elseif success and lang == Translang or TestText == ChatMsg then
				goto BypassTrans
		end




		
	
		end

	::BypassTrans::
			elseif not IpLocTrans then
			success, TestText, lang = Translatev2(ChatMsg, "auto", Translang)
		if success and lang ~= Translang then

			if string.lower(lang) ~= string.lower(Translang) then

				--	network.send_chat_message("\n" .. sendername .. "[" .. lang:upper() .."] >>> [" .. Translang:upper() .. "]: ".. TestText, chatvisibility.on)
				--_G.MoistNotify(TestText, sendername .. " [" .. lang:upper() .." >" .. Translang:upper() .. "]", 0xff00ffff, 10)
				Moist_Notify2(TestText, sendername .. "~c~ [" .. lang:upper() .." >" .. Translang:upper() .. "]", 0xff00ffff, 10)
				if TranslateToLog then
			chattext = chattext  .. TestText
			File_Writer(chattext, FolderPaths.ChatFile, true, true)
			end
				end
			end
		end
		end
		

return
	
end


local ChatTransEnabled = menu.add_feature("Chat Translation to: ", "value_str", trans_parent.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	if feat["on"] and ChatEventID == 0 then
	if feat["value"] == 0 then
	ScriptConfig["ChatTransListener"] = true
	ScriptConfig["ChatTransListenerType"] = feat.value
	ChatEventID = event.add_event_listener("chat", Chat_ToChat_Translation)
	return
	end
	if feat["value"] == 1 then
	ScriptConfig["ChatTransListener"] = true
	ScriptConfig["ChatTransListenerType"] = feat.value
	ChatEventID = event.add_event_listener("chat", Chat_ToNotify_Translation)
	
	return
	end
	if feat["value"] == 2 then
	ScriptConfig["ChatTransListener"] = true
	ScriptConfig["ChatTransListenerType"] = feat.value
	ChatEventID = event.add_event_listener("chat", Chat_To_OldNotify_Translation)
	return
	end
	
	end
	if not feat["on"] and ChatEventID ~= 0 then
	event.remove_event_listener("chat", ChatEventID)
	ChatEventID = 0
	ScriptConfig["ChatTransListener"] = false
	ScriptConfig["ChatTransListenerType"] = feat.value
	return
	end
end)
ChatTransEnabled:set_str_data({"Game Chat","New Notifys","Old Notifys"})
ChatTransEnabled["on"] = ScriptConfig["ChatTransListener"]
ChatTransEnabled["value"] = ScriptConfig["ChatTransListenerType"]
chatvisibility = menu.add_feature("Team[ON] | Public[OFF]", "toggle", trans_parent.id)
chatvisibility["on"] = true



chatIpLocTrans = menu.add_feature("translate via IP Location", "toggle", trans_parent.id,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
		if not feat["on"] then
		IpLocTrans = false
		ScriptConfig["IPlocTranslate"] = false
		return
		end
		IpLocTrans = true
		ScriptConfig["IPlocTranslate"] = true
		return
end)
chatIpLocTrans["on"] = ScriptConfig["IPlocTranslate"]
chatIpLocTrans.hidden = false

LogTranslation = menu.add_feature("Log Translated Chat", "toggle", trans_parent.id, function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
		if not feat["on"] then
		ScriptConfig["TranslateToLog"] = false
		TranslateToLog = false
		return
		elseif feat["on"] then
		if _G.LocalFeatures["ChatLogging"].on then
		_G.LocalFeatures["ChatLogging"].on = false
		 end
		ScriptConfig["TranslateToLog"] = true
		TranslateToLog = true
		end
		return
end)
LogTranslation["on"] = ScriptConfig["TranslateToLog"]
LogTranslation.hidden = false

Trans_Lang = menu.add_feature("Translate to: ", "action_value_str", trans_parent.id,function(feat)
	if type(feat) == "number" then
		return HANDLER_POP
	end
	selected = langSel[feat.value + 1]
	Translang = selected
end)
Trans_Lang:set_str_data(langSel)
Trans_Lang.value = 15


MoistNotify("Translate Module Loaded", "")
MoistNotify("Ensure to enable Chat Translation to start listening to game chat\nBe Aware Team Chat Translation will be visible on Team Jobs/Missions and to any member of your ceo/mc", "MoistScript NG", 0xff0000ff, 20)
-- event.add_event_listener("exit", function()
	-- --clean up shit
	-- if ChatEventID ~= 0 then
		-- event.remove_event_listener("chat", ChatEventID)
	-- end

-- end)
end
local TranslateThread = menu.create_thread(main, feat)
