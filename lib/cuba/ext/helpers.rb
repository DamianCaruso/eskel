class Cuba
  module Ext
    module Helpers
      def notfound(msg)
        res.status = 404
        res.write(msg)
        halt(res.finish)
      end

      def forbidden(msg)
        res.status = 403
        res.write(msg)
        halt(res.finish)
      end

      def logger
        $logger
      end
    end
  end
end