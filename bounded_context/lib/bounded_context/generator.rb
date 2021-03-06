require 'rails/generators'

module BoundedContext
  class Generator < Rails::Generators::NamedBase
    source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

    def create_bounded_context
      template "module.rb", "#{bounded_context_name}/lib/#{bounded_context_name}.rb"

      application do
        "config.paths.add '#{bounded_context_name}/lib', eager_load: true"
      end
    end

    private

    def bounded_context_namespace
      name.camelize
    end

    def bounded_context_name
      name.underscore
    end
  end
end
