# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {build(:user)}

  context "Validations" do
    it "is valid when created with all valid fields" do
      expect(user).to be_valid
    end

    it "is invalid if username is nil" do
      user.username = nil
      expect(user).to be_invalid
    end

    it "is invalid if the email is nil" do
      user.email = nil
      expect(user).to be_invalid
    end
    
    context "More than one user" do
      let(:base_user) {create(:user)}
      let(:other_user) {create(:user)}

      it "is invalid if the email is not unique" do
        other_user.email = base_user.email
        expect(other_user).to be_invalid
      end

      it "is invalid if the username is not unique" do
        other_user.username = base_user.username
        expect(other_user).to be_invalid
      end
    end
  end
end
