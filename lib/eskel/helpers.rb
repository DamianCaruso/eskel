module Eskel
  module Helpers
    def redirect(*args)
      run Cuba.new { on(default) { res.redirect(*args) }}
    end
    
    def settings
      Eskel.settings
    end
    
    def logger
      Eskel.logger
    end
  end
end