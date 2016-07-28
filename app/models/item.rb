class Item < ActiveRecord::Base
  belongs_to :user
  scope :visible_to, -> (user) { user ? all : where(@items.user = @user) }
end
