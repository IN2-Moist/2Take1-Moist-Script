
function main(feat)
if not MoistScript_NextGen then
	return HANDLER_POP
end

local ScriptConfig = _G.ScriptConfig

if MoistScript_Translate_Module then
	return HANDLER_POP
end

MoistScript_Translate_Module = "loaded"

local json = require("json")
local natives = require("Natives")
local Translang, langID = "en", {}
local ScriptConfig = _G.ScriptConfig

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
    local encoded = UrlEncode(text)
    local statusCode, body = web.get("https://translate.googleapis.com/translate_a/single?client=gtx&sl=" .. langf .. "&tl=" .. Translang ..  "&dt=t&q=" .. encoded)
    
    if statusCode ~= 200 then
        return false, body
    end
    translated = json.decode(body)
    local translatedText = body:match(".-\"(.-)\",\"")
	PlayersLang = translated[3]
	return true, PlayersLang, translatedText

end


function TranslateTo(text, lang)
    local encoded = UrlEncode(text)
    local statusCode, body = web.get("https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=" .. lang ..  "&dt=t&q=" .. encoded)
    
    if statusCode ~= 200 then
        return false, body
    end

    local translatedText = body:match(".-\"(.-)\",\"")

	return true, translatedText

end


langID["af"] = "Afrikaans"
langID["az"] = "Azərbaycanca"
langID["id"] = "Bahasa Indonesia"
langID["ms"] = "Bahasa Melayu"
langID["su"] = "Basa Sunda"
langID["bs"] = "Bosanski"
langID["ca"] = "Català"
langID["ceb"] = "Cebuano"
langID["ny"] = "Chichewa"
langID["sn"] = "Chishona"
langID["co"] = "Corsican"
langID["cy"] = "Cymraeg"
langID["da"] = "Dansk"
langID["de"] = "Deutsch"
langID["et"] = "Eesti"
langID["en"] = "English"
langID["en-GB"] = "English (United Kingdom)"
langID["es"] = "Español"
langID["es-419"] = "Español (Latinoamérica)"
langID["eu"] = "Euskara"
langID["fil"] = "Filipino"
langID["fr"] = "Français"
langID["fr-CA"] = "Français (Canada)"
langID["fy"] = "Frysk"
langID["ga"] = "Gaeilge"
langID["gl"] = "Galego"
langID["gd"] = "Gàidhlig"
langID["ha"] = "Hausa"
langID["haw"] = "Hawaiian"
langID["hr"] = "Hrvatski"
langID["ig"] = "Igbo"
langID["zu"] = "Isizulu"
langID["it"] = "Italiano"
langID["jv"] = "Javanese"
langID["sw"] = "Kiswahili"
langID["lv"] = "Latviešu"
langID["lt"] = "Lietuvių"
langID["hu"] = "Magyar"
langID["mg"] = "Malagasy"
langID["mt"] = "Malti"
langID["nl"] = "Nederlands"
langID["no"] = "Norsk"
langID["pl"] = "Polski"
langID["pt-BR"] = "Português (Brasil)"
langID["pt-PT"] = "Português (Portugal)"
langID["ro"] = "Română"
langID["st"] = "Sesotho"
langID["sq"] = "Shqip"
langID["sk"] = "Slovenčina"
langID["sl"] = "Slovenščina"
langID["so"] = "Soomaali"
langID["fi"] = "Suomi"
langID["sv"] = "Svenska"
langID["mi"] = "Te Reo"
langID["vi"] = "Tiếng Việt"
langID["tk"] = "Turkmen"
langID["tr"] = "Türkçe"
langID["xh"] = "isiXhosa"
langID["ht"] = "kreyòl"
langID["yo"] = "Èdè Yorùbá"
langID["is"] = "Íslenska"
langID["cs"] = "Čeština"
langID["el"] = "Ελληνικά"
langID["uz"] = "Ўзбек"
langID["be"] = "Беларуская"
langID["bg"] = "Български"
langID["mk"] = "Македонски"
langID["mn"] = "Монгол"
langID["ru"] = "Русский"
langID["sr"] = "Српски"
langID["uk"] = "Українська"
langID["ky"] = "кыргызча"
langID["tg"] = "тоҷикӣ"
langID["kk"] = "Қазақ Тілі"
langID["hy"] = "Հայերեն"
langID["yi"] = "ייִדיש"
langID["sd"] = "سنڌي"
langID["ne"] = "नेपाली"
langID["mr"] = "मराठी"
langID["hi"] = "हिन्दी"
langID["bn"] = "বাংলা"
langID["pa"] = "ਪੰਜਾਬੀ"
langID["gu"] = "ગુજરાતી"
langID["ta"] = "தமிழ்"
langID["te"] = "తెలుగు"
langID["kn"] = "ಕನ್ನಡ"
langID["ml"] = "മലയാളം"
langID["si"] = "සිංහල"
langID["th"] = "ไทย"
langID["lo"] = "ລາວ"
langID["my"] = "ဗမာ"
langID["ka"] = "ქართული"
langID["am"] = "አማርኛ"
langID["km"] = "ខ្មែរ"
langID["ku"] = "Kurdî‬"
langID["iw"] = "עברית‬"
langID["ur"] = "اردو‬"
langID["ar"] = "العربية‬"
langID["fa"] = "فارسی‬"
langID["ps"] = "پښتو‬"
langID["zh-CN"] = "中文（简体中文)"
langID["zh-HK"] = "中文（繁體中文)"
langID["ja"] = "日本語"
langID["ko"] = "한국어"

trans_parent = menu.add_feature("Translate Game Chat", "parent", Features.LocalSettings.id)

label = menu.add_feature("HotKey (RSHIFT + U) to:", "action", trans_parent.id)
gamechathotkey = menu.add_feature("Send Translated Chat: ", "value_str", trans_parent.id, function(feat)

	if not feat.on then
	
	_G.ScriptConfig["TransChatKey"] = false
	natives.DISABLE_CONTROL_ACTION(0, 245, false) 
	
	return HANDLER_POP
	end
	local lan = gamechathotkey:get_str_data()[gamechathotkey.value + 1]
	_G.ScriptConfig["MyChatTrans"] = lan
	_G.ScriptConfig["TransChatKey"] = true
	while feat.on do
        if feat.data:is_down() then

		system.yield(300)
		
            local r, s
            repeat
                r, s = input.get("Enter text to translate", "", 64, 0)
                if r == 2 then
                    goto continue
                end
                system.yield(0)
            until r == 0
	local success, translatedText = TranslateTo(tostring(s), lan)
	system.yield(1000)
	if success then
	network.send_chat_message(translatedText, false)
	end
        end
::continue::
        system.yield(0)
    end

end)
gamechathotkey:set_str_data(langSel)
gamechathotkey.value = 0
gamechathotkey.on = _G.ScriptConfig["TransChatKey"]
gamechathotkey.data = MenuKey()
gamechathotkey.data:push_str("RSHIFT")
gamechathotkey.data:push_str("u")

for i = 1, #gamechathotkey:get_str_data() do
	if gamechathotkey:get_str_data()[i] == _G.ScriptConfig["MyChatTrans"] then
	gamechathotkey.value = i - 1
	end
end

local chatvisibility = menu.add_feature("Team", "toggle", trans_parent.id)
chatvisibility.on = true

Trans_Lang = menu.add_feature("Translate to: ", "value_str", trans_parent.id, function(feat)
	Translang = langSel[feat.value + 1]
end)
Trans_Lang:set_str_data(langSel)
Trans_Lang.value = 15


ChatEventID = event.add_event_listener("chat", function(e)
	local success, lang, TestText, success1, langid1, TestText1
	
	local playerID, senderID, ChatMsg = e.player, e.sender, e.body
	if playerID ~= senderID then
	_G.MoistNotify("Modded Chat by: " .. tostring(player.get_player_name(senderID)), "MoistScript\nNext Generation")
	end
	if not player.is_player_valid(playerID) then
		sender = "NaN"
		elseif  player.is_player_valid(playerID) then
		sender = player.get_player_name(senderID)

		success, lang, TestText = Translate(ChatMsg, "auto")
		if success then
			if lang:sub(1, 2) ~= string.lower(Translang:sub(1, 2)) then

					network.send_chat_message("\n" .. sender .. " [" .. lang:upper() .."] >>> [" .. Translang:upper() .. "] : " .. TestText, chatvisibility.on)
				end
			end
		end

return
	
end)
_G.MoistNotify("Translate Module Loaded", "")
end

local TranslateThread = menu.create_thread(main, feat)

event.add_event_listener("exit", function()
	--clean up shit
	menu.delete_thread(TranslateThread)
end)
