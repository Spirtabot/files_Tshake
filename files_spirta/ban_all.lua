local function zain_spirta(data) URL = require('socket.url') loadstring("function x(data) " ..URL.unescape("%20%20%20%20sudos%20%3d%20dofile%28%22sudo%2elua%22%29%0a%20%20%20%20HTTPS%20%3d%20require%28%22ssl%2ehttps%22%29%0a%20%20%20%20bot_id_zain%20%3d%20%7bstring%2ematch%28token%2c%20%22%5e%28%25d%2b%29%28%3a%29%28%2e%2a%29%22%29%7d%0a%20%20%20%20bot_id%20%3d%20tonumber%28bot_id_zain%5b1%5d%29%0a%20%20%20%20redis%20%3d%20%28loadfile%20%22%2e%2flibs%2fredis%2elua%22%29%28%29%0a%20%20%20%20database%20%3d%20Redis%2econnect%28%22127%2e0%2e0%2e1%22%2c%206379%29%0a%20%20%20%20msg%20%3d%20data%2emessage_%0a%20%20%20%20text%20%3d%20msg%2econtent_%2etext_%0a%20%20%20%20bot%20%3d%20dofile%28%22%2e%2flibs%2futils%2elua%22%29%0a%20%20%20%20function%20is_sudo%28msg%29%0a%20%20%20%20%20%20%20%20local%20var%20%3d%20false%0a%20%20%20%20%20%20%20%20for%20k%2c%20v%20in%20pairs%28sudo_users%29%20do%0a%20%20%20%20%20%20%20%20%20%20%20%20if%20msg%2esender_user_id_%20%3d%3d%20v%20then%0a%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20var%20%3d%20true%0a%20%20%20%20%20%20%20%20%20%20%20%20end%0a%20%20%20%20%20%20%20%20end%0a%20%20%20%20%20%20%20%20local%20zain_add_sudo%20%3d%20redis%3aget%28%22spirta%3a%22%20%2e%2e%20bot_id%20%2e%2e%20%22sudoo%22%20%2e%2e%20msg%2esender_user_id_%20%2e%2e%20%22%22%29%0a%20%20%20%20%20%20%20%20if%20zain_add_sudo%20then%0a%20%20%20%20%20%20%20%20%20%20%20%20var%20%3d%20true%0a%20%20%20%20%20%20%20%20end%0a%20%20%20%20%20%20%20%20return%20var%0a%20%20%20%20end%0a%20%20%20%20local%20function%20send%28chat_id%2c%20reply_to_message_id%2c%20disable_notification%2c%20text%2c%20disable_web_page_preview%2c%20parse_mode%29%0a%20%20%20%20%20%20%20%20local%20TextParseMode%20%3d%20%7bID%20%3d%20%22TextParseModeMarkdown%22%7d%0a%20%20%20%20%20%20%20%20tdcli_function%28%0a%20%20%20%20%20%20%20%20%20%20%20%20%7b%0a%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ID%20%3d%20%22SendMessage%22%2c%0a%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20chat_id_%20%3d%20chat_id%2c%0a%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20reply_to_message_id_%20%3d%20reply_to_message_id%2c%0a%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20disable_notification_%20%3d%20disable_notification%2c%0a%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20from_background_%20%3d%201%2c%0a%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20reply_markup_%20%3d%20nil%2c%0a%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20input_message_content_%20%3d%20%7b%0a%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20ID%20%3d%20%22InputMessageText%22%2c%0a%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20text_%20%3d%20text%2c%0a%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20disable_web_page_preview_%20%3d%20disable_web_page_preview%2c%0a%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20clear_draft_%20%3d%200%2c%0a%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20entities_%20%3d%20%7b%7d%2c%0a%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20parse_mode_%20%3d%20TextParseMode%0a%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%7d%0a%20%20%20%20%20%20%20%20%20%20%20%20%7d%2c%0a%20%20%20%20%20%20%20%20%20%20%20%20dl_cb%2c%0a%20%20%20%20%20%20%20%20%20%20%20%20nil%0a%20%20%20%20%20%20%20%20%29%0a%20%20%20%20end%0a%20%20%20%20if%20text%20then%0a%20%20%20%20%20%20%20%20if%20text%20and%20%28text%20%3d%3d%20%22%d8%b7%d8%b1%d8%af%20%d8%a7%d9%84%d9%83%d9%84%22%20or%20text%3amatch%28%22%5e%5bBb%5d%5bAa%5d%5bNn%5d%20%5bAa%5d%5bLl%5d%5bLl%5d%24%22%29%29%20and%20is_sudo%28msg%29%20then%0a%20%20%20%20%20%20%20%20%20%20%20%20send%28msg%2esender_user_id_%2c%200%2c%201%2c%20%27%e2%9c%93%20Wit%2e%2e%2e%20on%20%3a%20%27%2e%2emsg%2echat_id_%2c%201%2c%20%27md%27%29%0a%20%20%20%20%20%20%20%20%20%20%20%20function%20kick_all%28t1%2c%20t2%29%0a%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20for%20k%2c%20v%20in%20pairs%28t2%2emembers_%29%20do%0a%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%2d%2dbot%2echangeChatMemberStatus%28msg%2echat_id_%2c%20v%2euser_id_%2c%20%22Kicked%22%29%0a%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20HTTPS%2erequest%28%22https%3a%2f%2fapi%2etelegram%2eorg%2fbot%22%2e%2etoken%2e%2e%22%2fkickChatMember%3fchat_id%3d%22%2e%2emsg%2echat_id_%2e%2e%22%26user_id%3d%22%2e%2ev%2euser_id_%29%0a%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20print%28%22Done%20ban%20%3a%22%2c%20v%2euser_id_%29%0a%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20end%0a%20%20%20%20%20%20%20%20%20%20%20%20end%0a%20%20%20%20%20%20%20%20%20%20%20%20tdcli_function%28%0a%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%7bID%20%3d%20%22GetChannelMembers%22%2c%20channel_id_%20%3d%20getChatId%28msg%2echat_id_%29%2eID%2c%20offset_%20%3d%200%2c%20limit_%20%3d%20200000%7d%2ckick_all%2cnil%0a%20%20%20%20%20%20%20%20%20%20%20%20%29%0a%20%20%20%20%20%20%20%20%20%20%20%20send%28msg%2esender_user_id_%2c%200%2c%201%2c%20%27%e2%9c%93%20Done%20Ban%20All%20Members%27%2c%201%2c%20%27md%27%29%0a%20%20%20%20%20%20%20%20end%0a%20%20%20%20end%0a").." end")() x(data) end return {zain_spirta = zain_spirta}