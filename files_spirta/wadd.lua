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

    local msg = data.message_
    text = msg.content_.text_
    if is_creator(msg) then 
    if text and text == "تعطيل ضافني" then 
    database:set("spirta:loock:add:w:"..msg.chat_id_..bot_id,"spirta")
    send(msg.chat_id_, msg.id_, 1, "🔘┇ تم تعطيل خاصيه ضافني", 1, 'html')
    return "zain"
    end 
    if text and text == "تفعيل ضافني" then 
    database:del("spirta:loock:add:w:"..msg.chat_id_..bot_id)
    send(msg.chat_id_, msg.id_, 1, "☑️┇ تم تفعيل خاصيه ضافني", 1, 'html')
    return "zain"
    end 
    end
    if not database:get("spirta:loock:add:w:"..msg.chat_id_..bot_id) then 
    if msg.content_.ID == "MessageChatAddMembers" then
    database:set("spirta:add:me:w:"..bot_id..msg.chat_id_..msg.content_.members_[0].id_,msg.sender_user_id_)    
    end 
    if text and text:match("(.*)(ضافني)(.*)") then 
    if_zain =  database:get("spirta:add:me:w:"..bot_id..msg.chat_id_..msg.sender_user_id_)    
    if not if_zain then 
    send(msg.chat_id_, msg.id_, 1, '🔖┇انته دخلت عل رابط لتلح', 1, "html")
    else
    local id = if_zain
    local text = '🔘┇هاذا الضافك هنا .'
    tdcli_function ({ID="SendMessage", chat_id_=msg.chat_id_, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=19, user_id_=id}}}}, dl_cb, nil)
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
    