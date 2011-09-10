ActiveRecord::Schema.define(:version => 0) do

  create_table "groups", :force => true do |t|
    t.string   "name"
  end

  create_table "user_groups", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
  end

end
