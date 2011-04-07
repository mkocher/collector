class Collector
  class Middleware
    def initialize(app, options = {}, &block)
      @app = app
      # instance_eval(&block) if block_given?
    end
    
    def call(env)
      Thread.current["collector"] = {}
      response = @app.call(env)
      p log_line unless log_line.empty?
      response
    end
    
    def log_line
      Thread.current["collector"].collect {|k,v| "#{k}=#{v}"}.join(' ')
    end
  end

  def self.event(name, value=true)
    kvpair("event-#{name}", value)
  end
  
  def self.kvpair(key, value)
    Thread.current["collector"][key]=value
  end
  
  def self.benchmark(name)
    Thread.current["collector"][name] ||= 0
    start_time = Time.now
    yield if block_given?
    Thread.current["collector"][name] += (start_time - Time.now) * 1000
  end
end