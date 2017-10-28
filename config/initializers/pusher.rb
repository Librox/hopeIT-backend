# frozen_string_literal: true

require 'pusher'

Pusher.app_id = '422402'
Pusher.key = 'e6245d3aaf9e8a803d2d'
Pusher.secret = 'bed2bb61aa8e6a75328e'
Pusher.cluster = 'eu'
Pusher.logger = Rails.logger
Pusher.encrypted = true
