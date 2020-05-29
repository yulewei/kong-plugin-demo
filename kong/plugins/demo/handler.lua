local BasePlugin = require "kong.plugins.base_plugin"

local DemoHandler = BasePlugin:extend()

DemoHandler.VERSION = "0.1.0"
DemoHandler.PRIORITY = 2000

-- 在 'init_by_lua_block' 中运行
function DemoHandler:new()
    DemoHandler.super.new(self, "demo")

    kong.log("saying hi from the 'new' handler")
end

-- 在 'init_worker_by_lua_block' 中运行
function DemoHandler:init_worker()
    DemoHandler.super.init_worker(self)

    kong.log("saying hi from the 'init_worker' handler")
end

-- 在 'ssl_certificate_by_lua_block' 中运行
function DemoHandler:certificate(conf)
    DemoHandler.super.certificate(self)

    kong.log("saying hi from the 'certificate' handler")
end

-- 在 'rewrite_by_lua_block' 中运行
function DemoHandler:rewrite(conf)
    DemoHandler.super.rewrite(self)

    kong.log("saying hi from the 'rewrite' handler")
end

-- 在 'access_by_lua_block' 中运行
function DemoHandler:access(conf)
    DemoHandler.super.access(self)

    kong.log("saying hi from the 'access' handler")
end

-- 在 'header_filter_by_lua_block' 中运行
function DemoHandler:header_filter(conf)
    DemoHandler.super.header_filter(self)

    kong.log("saying hi from the 'header_filter' handler")

    local base64_str = kong.request.get_header(conf.request_header)
    if base64_str ~= nil then
        local decoded_str = ngx.decode_base64(base64_str)
        kong.response.set_header(conf.response_header, decoded_str)
    end
end

-- 在 'body_filter_by_lua_block' 中运行
function DemoHandler:body_filter(conf)
    DemoHandler.super.body_filter(self)

    kong.log("saying hi from the 'body_filter' handler")
end

-- 在 'log_by_lua_block' 中运行
function DemoHandler:log(conf)
    DemoHandler.super.log(self)

    kong.log("saying hi from the 'log' handler")
end

return DemoHandler