FactoryBot.define do
  factory :shorten_url do 
    original_url { "https://example.com" }
    short_url { SecureRandom.hex(6) } 
  end 
end