json.array!(@clients) do |client|
  json.extract! client, :id, :personId, :document, :personName, :lastName, :telephone, :personStatus, :birthDay, :publicity
  json.url client_url(client, format: :json)
end
