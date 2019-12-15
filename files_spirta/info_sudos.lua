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
    msg = data.message_
    text = msg.content_.text_
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
    function is_sudo(msg)
local var = false
for k,v in pairs(sudo_users) do
if msg.sender_user_id_ == v then var = true end
end
local zain_add_sudo = redis:get('spirta:'..bot_id..'sudoo'..msg.sender_user_id_..'')
if zain_add_sudo then var = true end return var
end
    if (text and text == 'تفعيل' and  is_sudo(msg)) then 
    if not database:get('spirta:'..bot_id.."charge:"..msg.chat_id_) then 
    if not database:get('spirta:'..bot_id..'azain:sudo'..bot_id..msg.sender_user_id_..msg.chat_id_) then 
    database:incrby('spirta:'..bot_id..'zain:sudo'..bot_id..msg.sender_user_id_, 1)
    database:set('spirta:'..bot_id..'azain:sudo'..bot_id..msg.sender_user_id_..msg.chat_id_, "zain")
    end  
    end
    end
  
    if (text and text == 'تعطيل' and  is_sudo(msg)) then 
    if database:get('spirta:'..bot_id.."charge:"..msg.chat_id_) then 
    if not database:get('spirta:'..bot_id..'aazain:sudo'..bot_id..msg.sender_user_id_..msg.chat_id_) then 
    database:incrby('spirta:'..bot_id..'zain:sudo2'..bot_id..msg.sender_user_id_, 1)
    database:set('spirta:'..bot_id..'aazain:sudo'..bot_id..msg.sender_user_id_..msg.chat_id_, "zain")
    end  
    end
    end
   
    if text then 
    if (text == 'احصائيات المطورين' and tonumber(msg.sender_user_id_) == tonumber(sudo_add) )then 
    local user_info = database:hgetall('spirta:'..bot_id..'user:'..sudo_add)
    local username = nil
    if user_info and user_info.username then
    username = "@"..user_info.username
    end
    local sudo_zain = redis:smembers('spirta:'..bot_id..'dev')
    local zain = "💬┇احصائيات المطورين : \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n\n"
    local zain2 = database:get('spirta:'..bot_id..'zain:sudo'..bot_id..sudo_add)
    local zain3 = database:get('spirta:'..bot_id..'zain:sudo2'..bot_id..sudo_add)
    zain = zain.."👤┇المطور الاساسي\n|0| ["..(username or sudo_add)..'] \n  مفعل ~⪼ *{'..(zain2 or 0)..'}* | معطل  ~⪼ *{'..(zain3 or 0)..'}*\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n👤┇المطورين\n'
    for i=1,#sudo_zain do
    if tonumber(sudo_zain[i]) ~= tonumber(sudo_add) then
    local user_info = database:hgetall('spirta:'..bot_id..'user:'..sudo_zain[i])
    local username = nil
    if user_info and user_info.username then
    username = "@"..user_info.username
    end
    local zain2 = database:get('spirta:'..bot_id..'zain:sudo'..bot_id..sudo_zain[i])
    local zain3 = database:get('spirta:'..bot_id..'zain:sudo2'..bot_id..sudo_zain[i])
    zain = zain.."|"..i.."| ["..(username or sudo_zain[i])..'] \n  مفعل ~⪼ *{'..(zain2 or 0)..'}* | معطل  ~⪼ *{'..(zain3 or 0)..'}*\n'
    end
    end
    if #sudo_zain == 0 or #sudo_zain == 1 and tonumber(sudo_zain[i]) == tonumber(sudo_add) then
    zain = zain.."\n ⚠️┇لا يوجد مطورين"
    end
    if #sudo_zain == 1 and tonumber(sudo_zain[1]) == tonumber(sudo_add) then
    zain = zain.."\n ⚠️┇لا يوجد مطورين"
    end
    send(msg.chat_id_, msg.id_, 1, zain, 1, 'md')
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
    