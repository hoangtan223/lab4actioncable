# t.string   "content"
#     t.string   "ip"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false


class Message < ApplicationRecord
	validates :content, presence: true
end
