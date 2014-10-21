json.array!(@sales) do |sale|
  json.extract! sale, :id, :saleId, :sellerId, :clientId, :saleDate, :saleStatus, :note
  json.url sale_url(sale, format: :json)
end
