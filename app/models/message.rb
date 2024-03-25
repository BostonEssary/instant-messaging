# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  body       :text
#  edited     :boolean
#  read       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Message < ApplicationRecord
    belongs_to :user
    
    has_many_attached :attachments


end
