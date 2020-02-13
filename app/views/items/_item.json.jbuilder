json.extract! item, :id, :apncode, :rrp, :lastbuyprice, :description, :author, :pcategory, :stock, :date, :time, :doc_num, :ref_num, :quantity, :extax_value, :tax, :discount, :created_at, :updated_at
json.url item_url(item, format: :json)



# [app/views/histories/_history.json.builder]
# json.extract! history, :id, :member_id, :date, :content_id, :total_price, :point_used, :point_accumulated, :is_credit, :created_at, :updated_at
# json.url history_url(history, format: :json)

# [app/views/histories/index.json.builder]
# json.array! @histories, partial: 'histories/history', as: :history


# _history.json.builder와 index.json.builder를 합친 코드는 아래와 같다고 볼 수 있다.


# json.array!(@histories) do |history| json.extract! history, :id, :member_id, :date, :content_id, :total_price, :point_used, :point_accumulated, :is_credit, :created_at, :updated_at json.url history_url(history, format: :json) end
