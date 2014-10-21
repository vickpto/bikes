json.array!(@items) do |item|
  json.extract! item, :id, :saleId, :productId, :itemAmount
  json.url item_url(item, format: :json)
end
