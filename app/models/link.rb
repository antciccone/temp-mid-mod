class Link < ActiveRecord::Base
  belongs_to :users

  def invalid_link?
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil? ? true : false
  end
end
