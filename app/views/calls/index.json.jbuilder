json.array!(@calls) do |call|
  json.extract! call, :id, :results, :spoken, :rvm, :lvm, :date, :time
  json.url call_url(call, format: :json)
end
