# == Schema Information
#
# Table name: albums
#
#  id           :bigint(8)        not null, primary key
#  band_id      :integer          not null
#  title        :string           not null
#  year         :integer          not null
#  live_version :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Album < ApplicationRecord

  belongs_to :band,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Band


end
