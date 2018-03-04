json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :mobile, :phone,:role, :priority,
                         :address, :email, :note
  json.url url_for(contact, format: :json)
end
