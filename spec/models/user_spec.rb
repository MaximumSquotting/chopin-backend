require 'rails_helper'

RSpec.describe User, type: :model do
  %i( name email address ).each do |attribute|
    it { is_expected.to validate_presence_of(attribute) }
  end
end
