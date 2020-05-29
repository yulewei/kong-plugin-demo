# kong-plugin-demo

``` bash
# 添加 service
$ curl -XPOST -H 'Content-Type: application/json' \
     -d '{"name":"example.service","url":"http://httpbin.org"}' \
     http://localhost:8001/services/

# 在 service 上添加 route
$ curl -XPOST -H 'Content-Type: application/json' \
     -d '{"paths":["/"],"strip_path":false}' \
     http://localhost:8001/services/example.service/routes
```


``` bash
$ curl -i http://localhost:8000/headers
HTTP/1.1 200 OK
... 省略 ...
X-Kong-Upstream-Latency: 455
X-Kong-Proxy-Latency: 4
Via: kong/0.14.1

{
  "headers": {
    "Accept": "*/*",
    "Host": "httpbin.org",
    "User-Agent": "curl/7.58.0",
    "X-Amzn-Trace-Id": "Root=1-5ed07d78-27a559b8d0935e685dcc58a8",
    "X-Forwarded-Host": "localhost"
  }
}
```

## 开启 demo 插件

使用 LuaRocks 安装这个插件：

``` bash
$ git clone https://github.com/yulewei/kong-plugin-demo.git
$ cd kong-plugin-demo
# 安装 rock
$ sudo luarocks make
# 查看安装的 rock
$ luarocks show kong-plugin-demo
```

```
lua_package_path = /home/yulewei/kong-plugin-demo/?.lua;;
```

`kong.conf` 配置文件添加这个插件 `demo`：

```
plugins = bundled,demo
```


``` bash
# 在 service 上开启 demo 插件
$ curl -XPOST --data "name=demo" \
       http://localhost:8001/services/example.service/plugins
```

``` bash
$ curl -i -H 'X-Request-Base64: aGVsbG8ga29uZw==' http://localhost:8000/headers
HTTP/1.1 200 OK
... 省略 ...
X-Response-Decoded: hello kong
X-Kong-Upstream-Latency: 1387
X-Kong-Proxy-Latency: 37
Via: kong/0.14.1

{
  "headers": {
    "Accept": "*/*",
    "Host": "httpbin.org",
    "User-Agent": "curl/7.58.0",
    "X-Amzn-Trace-Id": "Root=1-5ecbf8b6-b8f74a140b433a1d615ab66b",
    "X-Forwarded-Host": "localhost",
    "X-Request-Base64": "aGVsbG8ga29uZw=="
  }
}
```

**参考：**

- Plugin Development <https://docs.konghq.com/1.5.x/plugin-development/>
- Kong plugin template <https://github.com/Kong/kong-plugin>
