Factory.define :user do |f|
  f.sequence(:email) { |n| "foo#{n}@example.com" }
end

Factory.define :group do |f|
  f.sequence(:name) { |n| "G#{n}" }
end
