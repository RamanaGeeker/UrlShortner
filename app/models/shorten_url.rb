class ShortenUrl < ApplicationRecord
	before_create :generate_shortened_url

	private

	def generate_shortened_url
		self.short_url = SecureRandom.urlsafe_base64(6)
	end
end
