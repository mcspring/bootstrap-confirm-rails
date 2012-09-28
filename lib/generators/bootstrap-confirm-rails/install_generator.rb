module BootstrapConfirmRails
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc 'Setup BootstrapConfirmRails default files.'

      source_root File.expend_path('../templates', __FILE__)

      def copy_config
        template File.join('config', 'initializers', 'bootstrap-confirm-rails.rb')
      end

      def show_readme
        readme 'README'
      end
    end
  end
end
