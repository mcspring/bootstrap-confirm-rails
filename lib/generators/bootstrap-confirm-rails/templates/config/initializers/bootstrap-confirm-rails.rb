# Use this setup block to configure all options available in BootstrapConfirmRails
BootstrapConfirmRails.setup do |config|

  # Confirm message title shortcut template
  config.shortcut_template = 'Are you sure you want to %s?'

  # Confirm dialog ok button title
  config.confirm_ok = "Yes, I'm positively certain."

  # Confirm dialog cancel button title
  config.confirm_cancel = 'Cancel'

end
