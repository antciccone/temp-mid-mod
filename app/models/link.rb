class Link < ActiveRecord::Base
  belongs_to :users

  def invalid_link?
    url = self.url
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil? ? true : false
  end

  def self.top_ten
    Link.all.sort_by(&:counter).reverse[0..9]
  end
end
