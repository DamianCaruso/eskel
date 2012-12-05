module Eskel
  module Cuba
    def redirect(*args)
      run ::Cuba.new { on(default) { res.redirect(*args) }}
    end

    def not_found(msg = nil)
      res.status = 404
      res.write msg
      halt(res.finish)
    end
    
    def settings
      Eskel.settings
    end
    
    def logger
      Eskel.logger
    end
  end
end