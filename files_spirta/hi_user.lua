--[[
BY : SpirtaTEAM
Channel Files : https://t.me/spirtaFiles
]]
local function zain_spirta(data)
    local msg = data.message_
    redis = (loadfile "./libs/redis.lua")()
    database = Redis.connect('127.0.0.1', 6379)
    sudos = dofile('sudo.lua')
    JSON = (loadfile  "./libs/dkjson.lua")()
    bot_id_zain = {string.match(token, "^(%d+)(:)(.*)")}
    bot_id = tonumber(bot_id_zain[1])
    local function openChat(chat_id,dl_cb)
    tdcli_function ({
    ID = "GetChat",
    chat_id_ = chat_id
    }, dl_cb, nil)
    end
    function getUser(user_id, cb)
    tdcli_function ({
    ID = "GetUser",
    user_id_ = user_id
    }, cb, nil)
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
    local function getMessage(chat_id, message_id,cb)
    tdcli_function ({
    ID = "GetMessage",
    chat_id_ = chat_id,
    message_id_ = message_id
    }, cb, nil)
    end
    function getChatId(id)
    local chat = {}
    local id = tostring(id)
    if id:match('^-100') then
    local channel_id = id:gsub('-100', '')
    chat = {ID = channel_id, type = 'channel'}
    else
    local group_id = id:gsub('-', '')
    chat = {ID = group_id, type = 'group'}
    end
    return chat
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
    function resolve_username(username,cb)
    tdcli_function ({
    ID = "SearchPublicChat",
    username_ = username
    }, cb, nil)
    end
    local msg = data.message_
    text = msg.content_.text_
    if not database:get("spirta:get:my:frind:gr:"..bot_id..msg.chat_id_) then 
    if text and text:match("صيح (.*)") then 
    zain_ts = {string.match(text, "^صيح (.*)")}
    if zain_ts[1]:match('(.*)[Bb][Oo][Tt]') then
    send(msg.chat_id_, msg.id_, 1, "👤┇لا يمكنني منادات بوت", 1, 'html')
    return "spirta"   
    end
    function kekko(t1,t2)
    if t2.username_ and t2.username_ == zain_ts[1] then 
    send(msg.chat_id_, msg.id_, 1, "زمال صيح نفسك ؟", 1, 'html')
    return "tshkae"
    end
    function spirta_get(y1,y2)
    if not y2.id_ then 
    send(msg.chat_id_, msg.id_, 1, "👤┇لا يوجد هاكذا معرف", 1, 'html')
    return "spirta"
    end
    id_ts = tostring(y2.id_)
    if id_ts:match('^-100') then
    send(msg.chat_id_, msg.id_, 1, "👤┇لا يمكنني منادات معرفات قنوات", 1, 'html')
    return "spirta"   
    end
    function spirta_jd(u1,u2)
    if (u2 and ((u2.status_ and u2.status_.ID == "ChatMemberStatusLeft") or u2.ID == "Error")) then 
    send(msg.chat_id_, msg.id_, 1, "👤┇العضو غير موجود في المجموعه", 1, 'html')
    return "spirta"
    end
    user_ts = (t2.username_ or msg.sender_user_id_)
    send(msg.chat_id_, msg.id_, 1, "👤┇ العضو : @["..user_ts.."]\n👥┇يصيحك : @["..zain_ts[1].."]", 1, 'html')
    end
    tdcli_function ({
    ID = "GetChatMember",
    chat_id_ = msg.chat_id_,
    user_id_ = id_ts
    }, spirta_jd, nil)
    end
    resolve_username(zain_ts[1],spirta_get)
    end
    getUser(msg.sender_user_id_, kekko)
    end
    end
    if is_creator(msg) then 
    if text and text == "تعطيل صيح" then 
    database:set("spirta:get:my:frind:gr:"..bot_id..msg.chat_id_,"spirta")
    send(msg.chat_id_, msg.id_, 1, "🔘┇ تم تعطيل صيح", 1, 'html')
    end 
    if text and text == "تفعيل صيح" then 
    database:del("spirta:get:my:frind:gr:"..bot_id..msg.chat_id_)
    send(msg.chat_id_, msg.id_, 1, "☑️┇ تم تفعيل صيح ", 1, 'html')
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
    