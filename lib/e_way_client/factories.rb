FACTORIES_DIR = Pathname.new(File.dirname(__FILE__)).join("factories")
Dir[FACTORIES_DIR.join("*.rb")].each {|f| require f}
