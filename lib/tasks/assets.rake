namespace :assets do
  task :setup => :environment do 
    require APP_ROOT.join('sprockets')
  end

  desc "Compile assets"
  task :compile => :setup do
    assets = [ Proc.new { |path, fn| fn =~ /assets/ && !%w(.js .css).include?(File.extname(path)) }, /(?:\/|\\|\A)application\.(css|js)$/ ]
    manifest.compile(assets)
  end

  desc "Remove all assets"
  task :clobber => :setup do
    manifest.clobber
  end

  desc "Clean old assets"
  task :clean, [:keep] => :setup do
    keep = args[:keep].nil? ? 2 : args[:keep].to_i
    manifest.clean(keep)
  end

  task :precompile => :compile

  def environment
    @environment ||= begin
      require 'uglifier'
      $sprockets_env.js_compressor  = Uglifier.new
      $sprockets_env.css_compressor = Sprockets::Sass::Compressor.new
      $sprockets_env
    end
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
    @manifest ||= Sprockets::Manifest.new(index, APP_ROOT.join('public','assets'))
  end
end