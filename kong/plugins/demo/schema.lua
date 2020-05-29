return {
    no_consumer = true,
    fields = {
        request_header = {
            type = "string",
            required = true,
            default = "X-Request-Base64"
        },
        response_header = {
            type = "string",
            required = true,
            default = "X-Response-Decoded"
        }
    }
}
