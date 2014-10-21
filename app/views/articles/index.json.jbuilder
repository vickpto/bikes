json.array!(@articles) do |article|
  json.extract! article, :id, :articleId, :articleTitle, :managerId, :publicationDate, :body, :summary, :articleState
  json.url article_url(article, format: :json)
end
