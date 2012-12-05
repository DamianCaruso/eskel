require 'sprockets'
require 'eskel/assets'
require 'logger'

namespace :assets do
  desc "Compile assets"
  task :compile do
    assets = environment.each_logical_path.select { |path| [ /\w+\.(?!js|css).+/, /application.(css|js)$/ ].detect { |r| r.match(path) } }
    manifest.compile(assets)
  end

  desc "Remove all assets"
  task :clobber do
    manifest.clobber
  end

  desc "Clean old assets"
  task :clean do
    keep = ENV["keep"].nil? ? 2 : ENV["keep"].to_i
    manifest.clean(keep)
  end

  task :precompile => :compile

  def environment
    @environment ||= Eskel::Assets.environment
  end

  def index
    @index ||= begin
      idx = environment.index
      idx.logger = Logger.new(STDOUT)
      idx.logger.level = Logger::INFO
      idx
    end
  end

  def manifest
    @manifest ||= Sprockets::Manifest.new(index, Eskel.root("public","assets"))
  end
end