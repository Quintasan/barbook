# frozen_string_literal: true

class Cocktail < ApplicationRecord
  include ImageUploader::Attachment(:image)

  validates :name, presence: true, uniqueness: true
  validates :signature, inclusion: { in: [true, false] }
  validates :menu, inclusion: { in: [true, false] }

  belongs_to :category
  delegate :name, to: :category, prefix: true
end
