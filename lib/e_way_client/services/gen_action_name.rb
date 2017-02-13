module EWayClient
  class GenActionName

    def self.call(klass)
      klass.name.demodulize.gsub(/Request$/, "").underscore.to_sym
    end

  end
end
