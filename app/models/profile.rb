class Profile < ActiveRecord::Base
    belongs_to :user
    
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\z/
    validates :first_name, :last_name, presence: true
end