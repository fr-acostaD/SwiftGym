    struct GptBaseURL {
        let url: String
        
        init(_ baseUrl: String) {
            url = baseUrl
        }
        
        enum paths: String {
            case posts = "/posts"
            case users = "/users"
            case comments = "/comments"
        }
    }