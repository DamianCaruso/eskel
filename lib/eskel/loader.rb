require 'dotenv'

module Eskel
  module Loader
    def before_load(&block)
      @_before_load ||= []
      @_before_load << block if block_given?
      @_before_load
    end

    def after_load(&block)
      @_after_load ||= []
      @_after_load << block if block_given?
      @_after_load
    end

    def load!
      return false if loaded?
      began_at = Time.now
      Eskel.logger
      before_load.each(&:call)
      Dotenv.load root.join(".env.#{env}"), root.join('.env')
      require_dependencies(*dependency_paths)
      Eskel::Application.require_dependencies
      after_load.each(&:call)
      logger.info "Loaded Eskel in #{Time.now - began_at} seconds"
      Thread.current[:eskel_loaded] = true
    end

    def loaded?
      Thread.current[:eskel_loaded]
    end

    def require_dependencies(*paths)
      files = paths.flatten.flat_map{ |path| Dir.glob(path).sort_by{ |filename| filename.count('/') } }.uniq
      files.each { |rb| require rb }
    end

    def dependency_paths
      @_dependency_paths ||= default_dependency_paths
    end

    def load_tasks
      require 'eskel/tasks'
      load 'eskel/tasks/assets.rake' if defined?(Eskel::Assets)
      Dir["#{root}/**/*.rake"].each { |f| load f }
    end

  private

    def default_dependency_paths
      @default_dependency_paths ||= [
        "#{root}/config/database.rb",
        "#{root}/lib/**/*.rb",
        "#{root}/app/models/**/*.rb",
        "#{root}/config/initializers/*.rb"
      ]
    end
  end
end