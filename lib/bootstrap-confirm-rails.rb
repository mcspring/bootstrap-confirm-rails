require 'action_view'
require 'bootstrap-confirm-require/version'
require 'bootstrap-confirm-require/engine'
require 'bootstrap-confirm-require/action_view_extensions/form_helper'

module BootstrapConfirmRails
  class Error < StandardError; end

  # Confirm message title shortcut template
  mattr_accessor :shortcut_template
  @@shortcut_template = 'Are you sure you want to %s?'

  # Confirm dialog ok button title
  mattr_accessor :confirm_ok
  @@confirm_ok = "Yes, I'm positively certain."

  # Confirm dialog cancel button title
  mattr_accessor :confirm_cancel
  @@confirm_cancel = 'Cancel'


  # Default way to setup BootstrapConfirmRails. (Inspired from simple_form)
  # Run *rails generate bootstrap-confirm-rails:install* to create a fresh initializer with all configuration values.
  def self.setup
    yield self
  end
end
