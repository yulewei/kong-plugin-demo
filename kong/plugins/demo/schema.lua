return {
    no_consumer = true,
    fields = {
        request_header = {
            type = "string",
            required = true,
            default = "X-Request-Echo"
        },
        response_header = {
            type = "string",
            required = true,
            default = "X-Response-Echo"
        }
    }
}
