class AddressBook < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :skills, :interests

  validates_uniqueness_of :phone
  #validates_length_of :phone, :within => 12..15
  #validates_format_of :phone, :with => /\A(\+)?(91)(.|-)?[0-9]{5}(.|-)?[0-9]{5}\z/,
  #  :message => 'out of format, Allowed format is +91-98100-12345 = 919810012345 = 91-9810012345 = 91.98100.12345'

  before_validation :validate_phone_number

#  def phone
#    phone.gsub('+','').gsub('-','').gsub('.','')
#  end

  cattr_reader(:per_page)
  @@per_page = 1


  private

  def validate_phone_number
    #regexp = /\A(\+)?(91)(.|-)?[0-9]{5}(.|-)?[0-9]{5}\z/
    no = self.phone.gsub('+','').gsub('-','').gsub('.','')
    self.phone = no
  end

end
