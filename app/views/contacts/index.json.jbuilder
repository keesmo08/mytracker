json.array!(@contacts) do |contact|
  json.extract! contact, :id, :contact_name, :contact_address, :contact_phone, :contact_email, :contact_active
  json.url contact_url(contact, format: :json)
end
