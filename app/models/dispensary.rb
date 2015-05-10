class Dispensary < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :deals
  has_many :redemptions
  has_many :loyalty_programs

  geocoded_by :zip
  after_validation :geocode


end
