# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :donor
  belongs_to :admin
  mount_uploaders :images, ImageUploader
  serialize :images, JSON
end
