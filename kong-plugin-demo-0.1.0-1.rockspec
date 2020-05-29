package = "kong-plugin-demo"
version = "0.1.0-1"
source = {
  url = "https://github.com/yulewei/kong-plugin-demo"
}
description = {
  summary = "a example Kong plugin",
  homepage = "https://github.com/yulewei/kong-plugin-demo",
  license = "MIT"
}
dependencies = {
}
build = {
  type = "builtin",
  modules = {
    ["kong.plugins.demo.handler"] = "kong/plugins/demo/handler.lua",
    ["kong.plugins.demo.schema"] = "kong/plugins/demo/schema.lua"
  }
}
