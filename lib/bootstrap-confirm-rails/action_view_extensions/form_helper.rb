module BootstrapConfirmRails
  module ActionViewExtensions
    # This module creates confirm_form_tag.
    #
    # Example:
    #
    #   confirm_form_tag @model_name, 'data-confirm' => 'Are you sure?' do |f|
    #     = f.submit 'Delete'
    #   end
    #
    module FormHelper
      def confirm_form_tag(*args, &block)
        options = args.extract_options!
        if options.has_key?('data-confirm-shortcut') && !options.has_key?('data-confirm')
          options['data-confirm'] = BootstrapConfirmRails.shortcut_template % options.delete('data-confirm-shortcut')
        end

        options = {'data-confirm-ok' => BootstrapConfirmRails.confirm_ok, 'data-confirm-cancel' => BootstrapConfirmRails.confirm_cancel}.merge(options)

        form_tag(*(args + [options]), &block)
      end
    end
  end
end

ActionView::Base.send :include, BootstrapConfirmRails::ActionViewExtensions::FormHelper
