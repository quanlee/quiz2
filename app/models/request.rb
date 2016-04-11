class Request < ActiveRecord::Base
  validates :name, {presence: true, uniqueness: {message: "must be unique!!!"}}
  validates :email, {presence: true, uniqueness: {message: " must be unique!!!"}}

  def message_ellipsis
    if self[:message].length > 20
      self[:message].slice(0,20) + "..."
    else
      self[:message]
    end
  end
end
