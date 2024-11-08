enum QueryParameters {
    case pagination(page: Int, limit: Int)
    case search(query: String)
    case filters(category: String?, sortBy: String?)
}
