class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  validates :name, presence: true
  validates :email, presence: true,
            uniqueness: { case_sensitive: false }
            
            
  def self.match_name(str)
    where("name LIKE ?", "#{str}%").order(:name)
  end
end
