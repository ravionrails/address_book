class AddressBook < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :skills, :interests

  validates_uniqueness_of :phone

  before_validation :set_phone_num

  private

  def set_phone_num
    self.phone.gsub('+','')
    self.phone.gsub('-','')
    self.phone.gsub('.','')
  end

end
