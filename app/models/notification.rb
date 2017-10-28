# frozen_string_literal: true

class Notification < Struct.new(:title, :content)
  include ActiveModel::Model
  def self.from_hash(hash)
    obj = new
    hash.each { |key, value| obj.send("#{key}=", value) }
    obj
  end
end
