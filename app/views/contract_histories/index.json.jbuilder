json.array!(@contract_histories) do |contract_history|
  json.extract! contract_history, :id, :personId, :contractDate, :finalContractDate
  json.url contract_history_url(contract_history, format: :json)
end
