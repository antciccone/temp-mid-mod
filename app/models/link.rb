class Link < ApplicationRecord

  has_many :reads,  dependent: :destroy
  belongs_to :user

  def self.read_links
    where(updated_at: (Time.now - 24.hours)..Time.now, read: true)
  end

  def self.all_links
    links = where(updated_at: (Time.now - 24.hours)..Time.now)
    grouped = links.group_by{|link| link.url}
    grouped.values.map {|similiar_links| similiar_links.first}.reverse
  end
end
