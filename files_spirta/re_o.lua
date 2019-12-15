--[[
BY : SpirtaTEAM
Channel Files : https://t.me/spirtaFiles
]]

local function zain_spirta(data)
JSON = (loadfile  "./libs/dkjson.lua")()
local msg = data.message_
URL = require('socket.url')
text = msg.content_.text_
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
sudos = dofile('sudo.lua')
HTTPS = require("ssl.https")
bot_id_zain = {string.match(token, "^(%d+)(:)(.*)")}
bot_id = tonumber(bot_id_zain[1])
local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({
  ID = "SendMessage",
  chat_id_ = chat_id,
  reply_to_message_id_ = reply_to_message_id,
  disable_notification_ = disable_notification,
  from_background_ = 1,
  reply_markup_ = nil,
  input_message_content_ = {
  ID = "InputMessageText",
  text_ = text,
  disable_web_page_preview_ = disable_web_page_preview,
  clear_draft_ = 0,
  entities_ = {},
  parse_mode_ = TextParseMode,
  },
  }, dl_cb, nil)
end
function is_owner(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local admin = database:sismember('spirta:'..bot_id..'admins:', user_id)  
local owner = database:sismember('spirta:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('spirta:'..bot_id..'creator:'..chat_id, user_id)  
if owner then var = true
end if admin then
var = true end if creator then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end end
local zain_add_sudo = redis:get('spirta:'..bot_id..'sudoo'..user_id..'')
if zain_add_sudo then var = true end
return var
end
function is_creator(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local creator = database:sismember('spirta:'..bot_id..'creator:'..chat_id, user_id) 
local admin = database:sismember('spirta:'..bot_id..'admins:', user_id)
if creator then var = true end
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local zain_add_sudo = redis:get('spirta:'..bot_id..'sudoo'..user_id..'')
if zain_add_sudo then var = true end
return var
end
function is_admin(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false 
local admin = database:sismember('spirta:'..bot_id..'mods:'..chat_id, user_id)  
if admin then var = true end
return var
end

if text then 
local zain_text = nil
if is_creator(msg) then 
zain_text = database:get("spirta:re:cre:n"..bot_id..msg.chat_id_..text)
elseif is_owner(msg) then 
zain_text = database:get("spirta:re:ow:n"..bot_id..msg.chat_id_..text)
elseif is_admin(msg) then 
zain_text = database:get("spirta:re:ad:n"..bot_id..msg.chat_id_..text)
elseif (not is_admin(msg) and not is_owner(msg) and not is_creator(msg)) then 
zain_text = database:get("spirta:re:admin:n"..bot_id..msg.chat_id_..text)
end
if zain_text then 
send(msg.chat_id_, msg.id_, 1, zain_text, 1, 'md')
end
if is_creator(msg) then 
if text == "اضف رد للمنشئ" then 
send(msg.chat_id_, msg.id_, 1, "❕┇ ارسال الكلمه الان", 1, 'md')
database:set("spirta:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"cr")
return "zain"
elseif text == "اضف رد للمدير" then 
send(msg.chat_id_, msg.id_, 1, "❕┇ ارسال الكلمه الان", 1, 'md')
database:set("spirta:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"ow")
return "zain"
elseif text == "اضف رد للادمن" then 
send(msg.chat_id_, msg.id_, 1, "❕┇ ارسال الكلمه الان", 1, 'md')
database:set("spirta:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"admin")
return "zain"
elseif text == "اضف رد للعضو" then 
send(msg.chat_id_, msg.id_, 1, "❕┇ ارسال الكلمه الان", 1, 'md')
database:set("spirta:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"md")
return "zain"
end
if text == "حذف رد للمنشئ" then 
send(msg.chat_id_, msg.id_, 1, "🖲┇ ارسال الكلمه الان", 1, 'md')
database:set("spirta:del:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"cr")
return "zain"
elseif text == "حذف رد للمدير" then 
send(msg.chat_id_, msg.id_, 1, "🖲┇ ارسال الكلمه الان", 1, 'md')
database:set("spirta:del:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"ow")
return "zain"
elseif text == "حذف رد للادمن" then 
send(msg.chat_id_, msg.id_, 1, "🖲┇ ارسال الكلمه الان", 1, 'md')
database:set("spirta:del:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"admin")
return "zain"
elseif text == "حذف رد للعضو" then 
send(msg.chat_id_, msg.id_, 1, "🖲┇ ارسال الكلمه الان", 1, 'md')
database:set("spirta:del:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"md")
return "zain"
end
end
if database:get("spirta:del:re"..msg.chat_id_..bot_id..msg.sender_user_id_) then 
local spirta_s = database:get("spirta:del:re"..msg.chat_id_..bot_id..msg.sender_user_id_)
if spirta_s == "cr" then 
database:del("spirta:del:re"..msg.chat_id_..bot_id..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "🗑┇ تم حذف رد المنشئ", 1, 'md')
database:del("spirta:re:cre:n"..bot_id..msg.chat_id_..text)
elseif spirta_s == "ow" then 
database:del("spirta:del:re"..msg.chat_id_..bot_id..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "🗑┇ تم حذف رد المدير", 1, 'md')
database:del("spirta:re:ow:n"..bot_id..msg.chat_id_..text)
elseif spirta_s == "admin" then 
database:del("spirta:del:re"..msg.chat_id_..bot_id..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "🗑┇ تم حذف رد الادمن", 1, 'md')
database:del("spirta:re:ad:n"..bot_id..msg.chat_id_..text)
elseif spirta_s == "md" then 
database:del("spirta:del:re"..msg.chat_id_..bot_id..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "🗑┇ تم حذف رد العضو", 1, 'md')
database:del("spirta:re:admin:n"..bot_id..msg.chat_id_..text)  
end
end
if database:get("spirta:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_) then 
local spirta_s = database:get("spirta:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_)
if spirta_s == "cr" then 
database:set("spirta:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"cr2")
send(msg.chat_id_, msg.id_, 1, "🗳┇ ارسال الرد الان", 1, 'md')
database:set("spirta:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_,text)
return "zain"
elseif spirta_s == "ow" then
database:set("spirta:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"ow2")
send(msg.chat_id_, msg.id_, 1, "🗳┇ ارسال الرد الان", 1, 'md')
database:set("spirta:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_,text)
return "zain" 
elseif spirta_s == "admin" then
database:set("spirta:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"admin2")
send(msg.chat_id_, msg.id_, 1, "🗳┇ ارسال الرد الان", 1, 'md')
database:set("spirta:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_,text)
return "zain" 
elseif spirta_s == "md" then
database:set("spirta:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_,"md2")
send(msg.chat_id_, msg.id_, 1, "🗳┇ ارسال الرد الان", 1, 'md')
database:set("spirta:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_,text)
return "zain" 
end
if spirta_s == "cr2" then 
database:set("spirta:re:cre:n"..bot_id..msg.chat_id_..(database:get("spirta:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_)),text)
database:del("spirta:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "🔖┇ تم حفظ رد المنشئ", 1, 'md')
database:del("spirta:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_)
return "zain"
elseif spirta_s == "ow2" then
database:set("spirta:re:ow:n"..bot_id..msg.chat_id_..(database:get("spirta:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_)),text)
database:del("spirta:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "🔖┇ تم حفظ رد المدير", 1, 'md')
database:del("spirta:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_)
return "zain" 
elseif spirta_s == "admin2" then
database:set("spirta:re:ad:n"..bot_id..msg.chat_id_..(database:get("spirta:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_)),text)
database:del("spirta:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "🔖┇ تم حفظ رد الادمن", 1, 'md')
database:del("spirta:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_)
return "zain" 
elseif spirta_s == "md2" then
database:set("spirta:re:admin:n"..bot_id..msg.chat_id_..(database:get("spirta:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_)),text)
database:del("spirta:set:re"..msg.chat_id_..bot_id..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "🔖┇ تم حفظ رد العضو", 1, 'md')
database:del("spirta:set:ree"..msg.chat_id_..bot_id..msg.sender_user_id_)
return "zain" 
end

end
end 
end
return {
zain_spirta = zain_spirta,
}
--[[
 BY : SpirtaTEAM
 Channel Files : https://t.me/spirtaFiles
]]
