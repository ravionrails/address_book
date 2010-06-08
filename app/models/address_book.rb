class AddressBook < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :skills, :interests

  validates_uniqueness_of :phone
  validates_numericality_of :phone
#  validates_format_of :phone, :with => /\A(\+)?(91)(.|-)?[0-9]{5}(.|-)?[0-9]{5}\z/,
#    :message => 'out of format, Allowed format is +91-98100-12345 = 919810012345 = 91-9810012345 = 91.98100.12345'

  before_validation :validate_phone_number


  cattr_reader(:per_page)
  @@per_page = 2


  # => return random 5 peoples for the given city
  def self.random_five_peoples(city)
    AddressBook.find_all_by_city(city ,:select => 'name', :order => 'rand()', :limit => 5)
  end


  private

  def validate_phone_number
    #regexp = /\A(\+)?(91)(.|-)?[0-9]{5}(.|-)?[0-9]{5}\z/
    no = self.phone.gsub('+','').gsub('-','').gsub('.','')
    self.phone = no
  end

  
end
