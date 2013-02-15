require 'rails/generators'
module CssCanon
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.join(File.dirname(__FILE__), 'templates')
      desc 'imposes a canonical css structure'
    
      def install_foundation_if_not_installed
        unless File.exists?("app/assets/stylesheets/foundation_and_overrides.scss") 
          generate "foundation:install"
        end
      end

      def copy_app_asset_templates
        say "setting up app/assets/stylesheets..."
        if File.exists? "app/assets/stylesheets/application.css"
          File.rename "app/assets/stylesheets/application.css", "app/assets/stylesheets/TO_MIGRATE.css"
        end
        copy_file "app/assets/stylesheets/application.css.scss"
        copy_file "app/assets/stylesheets/base.css.scss"
        directory "app/assets/stylesheets/layout"
        directory "app/assets/stylesheets/module"
        directory "app/assets/stylesheets/vendor_overrides"
      end

      def copy_vendor_asset_templates
        say "setting up vendor/assets/stylesheets..."
        directory "vendor/assets/stylesheets"
      end

      def modify_zurb_overrides_file
        say "adding example use of brand variables to foundation_and_overrides..."
        foundation_file  = "app/assets/stylesheets/foundation_and_overrides.scss"
        color_example_regex = %r{^ *// *\$mainColor:.*}
        our_color_example = <<-EOCSS
\n// override foundation variables with variables defined in base.css.scss,
// so that branding can easily be changed in a single place
// $mainColor: $brandOne;"
          EOCSS
        if File.readlines(foundation_file).grep(color_example_regex).size > 0
          gsub_file foundation_file, color_example_regex, our_color_example
        else
          inject_into_file foundation_file, our_color_example, after: %r{// Colors Settings}
        end
      end
    end
  end
end
