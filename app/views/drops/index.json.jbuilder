json.array!(@drops) do |drop|
  json.extract! drop, :id, :account, :scheduledrop, :actualdrop, :contactname, :contactaddress, :contactphone, :contactemail, :notes
  json.url drop_url(drop, format: :json)
end
