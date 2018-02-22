module Sicily
  class TaskLoader
    def load_all_tasks
      Dir["#{File.dirname(__FILE__)}/task/*.rb"].each {|file|
        require file

        module_name = camelize(File.basename(file, ".*"))
        possibly_module = Task.const_get(module_name)
        if possibly_module.class.name == "Module"
          FileProcessor.send(:include, possibly_module)
        end
      }
    end

    private
    def camelize(str)
      str.split('_').map {|w| w.capitalize}.join
    end
  end
end