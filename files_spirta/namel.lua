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
local msg = data.message_
text = msg.content_.text_
if text then 
function zain(extra,result,success)
if result.id_ then 
local zain2 = database:get('spirta:'..bot_id.."zain:name"..result.id_)
if not result.first_name_ then 
if zain2 then 
send(msg.chat_id_, msg.id_, 1, "يولد هذا غير اسمه لك ها كلب "..zain2, 1, 'html')
database:del('spirta:'..bot_id.."zain:name"..result.id_) 
end
end
if result.first_name_ then 
if zain2 and zain2 ~= result.first_name_ then 
local zain_text = {
"اسمك الجديد { "..result.first_name_.." }\n القديم ليش غيرته 🌚😹",
  "اسمك الجديد { "..result.first_name_.." }\n مو حلو رجعه القديم ☹️👌",
  "ليش غيرت اسمك { "..result.first_name_.." }\n قطيت احد حبي ؟ 🌚😹",
  "اسمك الجديد يخبل ضلعي 🤭😹{ "..result.first_name_.." }", 
}
zain3 = math.random(#zain_text)
send(msg.chat_id_, msg.id_, 1, zain_text[zain3], 1, 'html')
end  
database:set('spirta:'..bot_id.."zain:name"..result.id_, result.first_name_) 
end
end
end
getUser(msg.sender_user_id_, zain)
end
end
return {
	zain_spirta = zain_spirta,
}
--[[
BY : SpirtaTEAM
Channel Files : https://t.me/spirtaFiles
]]
