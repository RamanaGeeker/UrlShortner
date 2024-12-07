class ShortenUrlSerializer < ActiveModel::Serializer
  attributes :id, :original_url, :short_url

  def short_url
    ENV["LOCAL_URL"]+"/"+object.short_url if object.short_url.present?
  end
end
