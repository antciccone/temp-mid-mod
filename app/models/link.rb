class Link < ApplicationRecord

  has_many :reads,  dependent: :destroy
  belongs_to :user

  def self.all_links
    # links = where(read: true)
    links = where(updated_at: (Time.now - 24.hours)..Time.now)
    grouped = links.group_by{|link| link.url}
    grouped.values.map {|similiar_links| similiar_links.first}
  end

  def self.read_links
    links = where(read: true)
    .where(updated_at: (Time.now - 24.hours)..Time.now)
    grouped = links.group_by{|link| link.url}
    grouped.values.map {|similiar_links| similiar_links.first}.first(10)
  end

end
