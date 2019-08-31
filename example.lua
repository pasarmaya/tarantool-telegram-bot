#!/usr/bin/env tarantool
--[[
    This example will echo messages back to the user who sent them, with an inline keyboard
    which tells the user the JSON for the callback_query.from object.
]]

local log = require('log')
local api = require('telegram-bot')
local json = require('json')

if not arg[1] then
    log.error('Usage: %s TOKEN', arg[0])
    log.error('You can get one from @BotFather')
    os.exit(1)
end

local ok, err = api.configure(arg[1])
if not ok then
    log.error('%s', err)
    os.exit(1)
end

function api.on_update(update)
    log.info('< %s', json.encode(update))
end

function api.on_message(message)
    if message.text then
        api.send_message(
            message,
            message.text,
            nil,
            true,
            false,
            nil,
            api.inline_keyboard():row(
                api.row():callback_data_button(
                    'Button',
                    'callback_data'
                )
            )
        )
    end
end

function api.on_callback_query(callback_query)
    api.answer_callback_query(
        callback_query.id,
        json.encode(callback_query.from)
    )
end

api.run()
