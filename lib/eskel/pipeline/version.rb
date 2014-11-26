require 'digest/md5'

module Eskel
  class Pipeline
    class Version
      FILE_NAME = 'public/version'
      SOURCES   = %w(Assetfile app/assets)

      def self.update
        new.update
      end

      attr_reader :root

      def initialize(root = nil)
        @root = root
      end

      def read
        file.read
      end

      def update
        @hash = nil
        write(hash)
        hash
      end

    protected

      def cwd
        Pathname.new(File.expand_path('.'))
      end

      def file
        cwd.join(FILE_NAME)
      end

      def write(version)
        file.open('w+') { |f| f.write(version) }
      end

      def hash
        @hash ||= digest.to_s[0..7]
      end

      def digest
        Digest::MD5.new << `ls -lAR #{sources.join(' ')} | awk '{ print $5, $6, $7, $8, $9, $10 }'`
      end

      def sources
        SOURCES.map do |source|
          source = Pathname.new(root).join(source)
          source.to_s if source.exist?
        end.flatten.compact
      end
    end
  end
end