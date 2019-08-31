package = "telegram-bot"
version = "scm-1"

source = {
    url = "git+https://github.com/rosik/tarantool-telegram-bot.git",
    branch = "master"
}

description = {
    summary = "A simple yet extensive Tarantool library for the Telegram bot API.",
    detailed = "A simple yet extensive Tarantool library for the Telegram bot API, with many tools and API-friendly functions.",
    license = "GPL-3",
    homepage = "https://github.com/rosik/tarantool-telegram-bot",
    maintainer = "Yaroslav Dynnikov <yaroslav.dynnikov@gmail.com>"
}

supported_platforms = {
    "linux",
    "macosx",
    "unix",
    "bsd"
}

dependencies = {
    'lua >= 5.1',
    'tarantool',
}

build = {
    type = "none",
    install = {
        lua = {
            ["telegram-bot"] = "telegram-bot.lua",
            ["telegram-bot.multipart"] = "telegram-bot/multipart.lua"
        }
    }
}
