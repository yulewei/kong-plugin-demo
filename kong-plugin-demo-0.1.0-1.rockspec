package = "kong-plugin-demo"
version = "0.1.0-1"
source = {
   url = "https://github.com/yelewei/kong-plugin-demo"
}
description = {
   homepage = "https://github.com/yelewei/kong-plugin-demo",
   license = "MIT"
}
dependencies = {
  "kong >= 0.14"
}
build = {
   type = "builtin",
   modules = {
      ["kong.plugins.demo.handler"] = "kong/plugins/demo/handler.lua",
      ["kong.plugins.demo.schema"] = "kong/plugins/demo/schema.lua"
   }
}
