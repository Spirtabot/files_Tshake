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
local zain2 = database:get('spirta:'..bot_id.."zain:Userr"..result.id_)
if not result.username_ then 
if zain2 then 
send(msg.chat_id_, msg.id_, 1, "حذف معرفه خمطو بساع بساع  \n هاذه معرفه : @"..zain2, 1, 'html')
database:del('spirta:'..bot_id.."zain:Userr"..result.id_) 
end
end
if result.username_ then 
if zain2 and zain2 ~= result.username_ then 
local zain_text = {
  'شكو غيرت معرفك شنو نشروك بقنوات نحراف 🌞😹😹😹',
  "هاها شو غيرت معرفك بس لا هددوك 🤞😂😂",
  "شسالفه شو غيرت معرفك 😐🌝",
  "غير معرفه خمطو بساع بساع \n هاذه معرفه : @"..result.username_.."",
  'ها عار مو جان معرفك \n شكو غيرته ل @'..result.username_..' ',
  'ها يول شو مغير معرفك', 
  "منور معرف جديد : "..result.username_.."",
}
zain3 = math.random(#zain_text)
send(msg.chat_id_, msg.id_, 1, zain_text[zain3], 1, 'html')
end  
database:set('spirta:'..bot_id.."zain:Userr"..result.id_, result.username_) 
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
