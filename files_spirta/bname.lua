--[[
BY : SpirtaTEAM
Channel Files : https://t.me/spirtaFiles
]]
local function zain_spirta(data)
local msg = data.message_
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
sudos = dofile('sudo.lua')
HTTPS = require("ssl.https")
JSON = (loadfile  "./libs/dkjson.lua")()
bot_id_zain = {string.match(token, "^(%d+)(:)(.*)")}
bot_id = tonumber(bot_id_zain[1])
function is_mod(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local mod = database:sismember('spirta:'..bot_id..'mods:'..chat_id, user_id)  
local admin = database:sismember('spirta:'..bot_id..'admins:', user_id)  
local owner = database:sismember('spirta:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('spirta:'..bot_id..'creator:'..chat_id, user_id)  
if mod then var = true end
if owner then var = true end
if creator then var = true end
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local zain_add_sudo = redis:get('spirta:'..bot_id..'sudoo'..user_id..'')
if zain_add_sudo then var = true end
return var
end
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
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
function changeChatMemberStatus(chat_id, user_id, status)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat_id,
user_id_ = user_id,
status_ = {
ID = "ChatMemberStatus" .. status
},
}, dl_cb, nil)
end
function delete_msg(chatid,mid)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chatid,
message_ids_=mid
},
dl_cb, nil)
end
local msg = data.message_
text = msg.content_.text_
if text then 
if (text:match("(الغاء حظر اسم) (.*)") and is_mod(msg)) then 
e = {string.match(text, "^(الغاء حظر اسم) (.*)$")}
send(msg.chat_id_, msg.id_, 1, "🔘┇ تم الغاء حظر {"..e[2].."}", 1, 'html')
database:srem("spirta:block:name:"..bot_id..msg.chat_id_,e[2])
return "spirta"
end
if (text:match("(حظر اسم) (.*)") and is_mod(msg)) then 
e = {string.match(text, "^(حظر اسم) (.*)$")}
send(msg.chat_id_, msg.id_, 1, "☑️┇ تم حظر {"..e[2].."}", 1, 'html')
database:sadd("spirta:block:name:"..bot_id..msg.chat_id_,e[2])
end
if ((text == "مسح الاسماء المحظوره" or text == "حذف الاسماء المحظوره" or text == "مسح قائمه الاسماء المحظوره") and is_mod(msg)) then 
database:del("spirta:block:name:"..bot_id..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, "🗳┇تم المسح بنجاح", 1, 'html')
end
if ((text == "الاسماء المحظوره" or text == "قائمه الاسماء المحظوره") and is_mod(msg)) then 
names_spirta = database:smembers("spirta:block:name:"..bot_id..msg.chat_id_)
if (names_spirta and names_spirta[1] and #names_spirta ~= 0) then 
text_spirta = "⚠┇قائمة الاسماء الممنوعه ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for i=1,#names_spirta do 
text_spirta = text_spirta.."*|"..i.."|*~⪼("..names_spirta[i]..")\n"
end
send(msg.chat_id_, msg.id_, 1, text_spirta, 1, 'html')
else
send(msg.chat_id_, msg.id_, 1, "🗳┇لا يوجد اسماء محظوره", 1, 'html')
end
end
if (text == "تفعيل طرد الاسم" and is_mod(msg)) then 
send(msg.chat_id_, msg.id_, 1, "☑️┇تم التفعيل سيتم طرد العضو الذي يضع الاسماء المحظوره", 1, 'html')
database:set("spirta:block:name:stats:"..bot_id..msg.chat_id_,"spirta_block")
end
if (text == "تفعيل كتم الاسم" and is_mod(msg)) then 
send(msg.chat_id_, msg.id_, 1, "☑️┇تم التفعيل سيتم كتم العضو الذي يضع الاسماء المحظوره", 1, 'html')
database:del("spirta:block:name:stats:"..bot_id..msg.chat_id_)
end
if not is_mod(msg) then
function zain_name(t1,t2)
if t2.id_ then 
name_spirta = ((t2.first_name_ or "") .. (t2.last_name_ or ""))
if name_spirta then 
names_spirta = database:smembers("spirta:block:name:"..bot_id..msg.chat_id_) or ""
if names_spirta and names_spirta[1] then 
for i=1,#names_spirta do 
if name_spirta:match("(.*)("..names_spirta[i]..")(.*)") then 
if not database:del("spirta:block:name:stats:"..bot_id..msg.chat_id_) then 
delete_msg(msg.chat_id_,{[0] = msg.id_})
else 
changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, "Kicked")
end
end
end
end
end
end
end
getUser(msg.sender_user_id_, zain_name)
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
