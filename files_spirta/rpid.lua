--[[
BY : SpirtaTEAM
Channel Files : https://t.me/spirtaFiles
]]
local function zain_spirta(data)
local msg = data.message_
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
sudos = dofile('sudo.lua')
https = require("ssl.https")
bot_id_zain = {string.match(token, "^(%d+)(:)(.*)")}
bot_id = tonumber(bot_id_zain[1])
JSON = (loadfile  "./libs/dkjson.lua")()
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
function is_sudo(msg)
local var = false
for k,v in pairs(sudo_users) do
if msg.sender_user_id_ == v then var = true end
end
local zain_add_sudo = redis:get('spirta:'..bot_id..'sudoo'..msg.sender_user_id_..'')
if zain_add_sudo then var = true end 
if sudo_add == msg.sender_user_id_ then var = true end
return var
end
local msg = data.message_
text = msg.content_.text_

 if database:get('idspirta:'..bot_id.."zain:re"..text) and msg.reply_to_message_id_ == 0 then
  local zain_info = nil
  function zain333(extra,result,success)
  zain_info = '@'..(result.username_ or 'لا يوجد')..''
  local function getpro(extra, result, success)
  local user_msgs = database:get('spirta:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
  local edit = database:get('spirta:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
  local add = (tonumber(database:get('spirta:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
  if result.photos_[0] then
  if is_sudo(msg) then
  t = 'مطور البوت'
  elseif is_creator(msg) then
  t = 'منشئ الكروب'
  elseif is_owner(msg) then
  t = 'مدير الكروب'
  elseif is_mod(msg) then
  t = 'ادمن للكروب'
  elseif is_vip(msg) then
  t = 'عضو مميز'
  else
  t = 'عضو فقط'
  end
  if not database:get('spirta:'..bot_id..'id:mute'..msg.chat_id_) then
  if not database:get('spirta:'..bot_id..'id:photo'..msg.chat_id_) then
   
  local spirta_new_text = database:get('idspirta:'..bot_id.."zain:re"..text)
  local spirta_new_text = spirta_new_text:gsub('#username',(zain_info or 'لا يوجد'))
  local spirta_new_text = spirta_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
  local spirta_new_text = spirta_new_text:gsub('#edit',(edit or 'لا يوجد'))
  local spirta_new_text = spirta_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
  local spirta_new_text = spirta_new_text:gsub('#stast',(t or 'لا يوجد'))
  local spirta_new_text = spirta_new_text:gsub('#add',(add or 'لا يوجد'))
  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,spirta_new_text,msg.id_,msg.id_.."")
  ---
  else
  if is_sudo(msg) then
  t = 'مطور البوت'
  elseif is_creator(msg) then
  t = 'منشئ الكروب'
  elseif is_owner(msg) then
  t = 'مدير الكروب'
  elseif is_mod(msg) then
  t = 'ادمن للكروب'
  elseif is_vip(msg) then
  t = 'عضو مميز'
  else
  t = 'عضو فقط'
  end

   local spirta_new_text = database:get('idspirta:'..bot_id.."zain:re"..text)
  local spirta_new_text = spirta_new_text:gsub('#username',(zain_info or 'لا يوجد'))
  local spirta_new_text = spirta_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
  local spirta_new_text = spirta_new_text:gsub('#edit',(edit or 'لا يوجد'))
  local spirta_new_text = spirta_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
  local spirta_new_text = spirta_new_text:gsub('#stast',(t or 'لا يوجد'))   
  local spirta_new_text = spirta_new_text:gsub('#add',(add or 'لا يوجد'))
  send(msg.chat_id_, msg.id_, 1, spirta_new_text, 1, 'html')
  
  end
  else
  end
  else
  if is_sudo(msg) then
  t = 'مطور البوت'
  elseif is_creator(msg) then
  t = 'منشئ الكروب'
  elseif is_owner(msg) then
  t = 'مدير الكروب'
  elseif is_mod(msg) then
  t = 'ادمن للكروب'
  elseif is_vip(msg) then
  t = 'عضو مميز'
  else
  t = 'عضو فقط'
  end
  if not database:get('spirta:'..bot_id..'id:mute'..msg.chat_id_) then
  if not database:get('spirta:'..bot_id..'id:photo'..msg.chat_id_) then
  
  local spirta_new_text = database:get('idspirta:'..bot_id.."zain:re"..text)
  local spirta_new_text = spirta_new_text:gsub('#username',(zain_info or 'لا يوجد'))
  local spirta_new_text = spirta_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
  local spirta_new_text = spirta_new_text:gsub('#edit',(edit or 'لا يوجد'))
  local spirta_new_text = spirta_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
  local spirta_new_text = spirta_new_text:gsub('#stast',(t or 'لا يوجد'))   
  local spirta_new_text = spirta_new_text:gsub('#add',(add or 'لا يوجد'))
  send(msg.chat_id_, msg.id_, 1, spirta_new_text, 1, 'html')

  else
  if is_sudo(msg) then
  t = 'مطور البوت'
  elseif is_creator(msg) then
  t = 'منشئ الكروب'
  elseif is_owner(msg) then
  t = 'مدير الكروب'
  elseif is_mod(msg) then
  t = 'ادمن للكروب'
  elseif is_vip(msg) then
  t = 'عضو مميز'
  else
  t = 'عضو فقط'
  end
  
  local spirta_new_text = database:get('idspirta:'..bot_id.."zain:re"..text)
  local spirta_new_text = spirta_new_text:gsub('#username',(zain_info or 'لا يوجد'))
  local spirta_new_text = spirta_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
  local spirta_new_text = spirta_new_text:gsub('#edit',(edit or 'لا يوجد'))
  local spirta_new_text = spirta_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
  local spirta_new_text = spirta_new_text:gsub('#stast',(t or 'لا يوجد'))   
  local spirta_new_text = spirta_new_text:gsub('#add',(add or 'لا يوجد'))
  send(msg.chat_id_, msg.id_, 1, spirta_new_text, 1, 'html')  
 
  end
  else
  end
     end
     end
     tdcli_function ({
  ID = "GetUserProfilePhotos",
  user_id_ = msg.sender_user_id_,
  offset_ = 0,
  limit_ = 1
    }, getpro, nil)
  end
  getUser(msg.sender_user_id_, zain333)
  end

if text == "مسح ردود الايدي" and is_sudo(msg) then
local list = redis:smembers("idspirta"..bot_id.."rd:rp")
for k,v in pairs(list) do
database:del('idspirta:'..bot_id.."zain:re"..v)
database:srem("idspirta"..bot_id.."rd:rp",v)
  end
 send(msg.chat_id_, msg.id_, 1, "• `تم مسح ردود الايدي ` 🗑", 1, 'md')
    end
if  text == "ردود الايدي" and is_creator(msg) then
    local list = database:smembers("idspirta"..bot_id.."rd:rp")
    text = "💾┇قائمة ردود الايدي ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
    for k,v in pairs(list) do
  text = text.."*|"..k.."|*~⪼("..v..")\n"
	  if #text > 7000 then
    send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
	text = ""
	end
    end
    if #list == 0 then
  text = "✖┇لايوجد ردود الايدي"
  end
    send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
  end
  
if (text and text == 'اضف رد ايدي' and  is_creator(msg) ) then 
  send(msg.chat_id_, msg.id_, 1, '📜┇الان ارسل الكلمه', 1, 'md')
database:set('idspirta:'..bot_id.. msg.chat_id_.."zain:add"..msg.sender_user_id_,"yes")
  return false
end  
if text then 
local zain = database:get('idspirta:'..bot_id.. msg.chat_id_.."zain:add"..msg.sender_user_id_)
if zain == 'yes' then 
local t = [[
☑┇ ارسل الان النص
☑┇ يمكنك اضافه :
- #username > اسم المستخدم
- #msgs > عدد رسائل المستخدم
- #id > ايدي المستخدم
- #stast > موقع المستخدم 
- #edit > عدد السحكات
- #add > عدد الجهات
]]
  send(msg.chat_id_, msg.id_, 1, t, 1, 'md')
database:set('idspirta:'..bot_id.. msg.chat_id_.."zain:add"..msg.sender_user_id_,"yes2")
database:set('idspirta:'..bot_id.. msg.chat_id_.."zain:add2"..msg.sender_user_id_, text)
  return false
end
end
if text then 
  local zain = database:get('idspirta:'..bot_id.. msg.chat_id_.."zain:add"..msg.sender_user_id_)
  if zain == 'yes2' then 
    send(msg.chat_id_, msg.id_, 1, "☑️┇تم الحفظ", 1, 'md')
database:del('idspirta:'..bot_id.. msg.chat_id_.."zain:add"..msg.sender_user_id_)
local zain = database:get('idspirta:'..bot_id.. msg.chat_id_.."zain:add2"..msg.sender_user_id_)
database:set('idspirta:'..bot_id.."zain:re"..zain,text)
database:del('idspirta:'..bot_id.. msg.chat_id_.."zain:add2"..msg.sender_user_id_)
database:sadd("idspirta"..bot_id.."rd:rp",zain)
    return false
  end
  end
    if (text and text == 'حذف رد ايدي' and is_creator(msg) ) then
      send(msg.chat_id_, msg.id_, 1, '📜┇الان ارسل الكلمه', 1, 'md')
      database:set('idspirta:'..bot_id.. msg.chat_id_.."zain:add"..msg.sender_user_id_,"yes3")
      return false
    end  
    if text then 
    local zain = database:get('idspirta:'..bot_id.. msg.chat_id_.."zain:add"..msg.sender_user_id_)
if (zain and zain == 'yes3') then 
send(msg.chat_id_, msg.id_, 1, "☑️┇تم الحذف", 1, 'md')
database:del('idspirta:'..bot_id.. msg.chat_id_.."zain:add"..msg.sender_user_id_)
database:del('idspirta:'..bot_id.. "zain:re"..text)
database:srem("idspirta"..bot_id.."rd:rp",text)
      return false
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
