module Sicily
  class TaskLoader
    def load_all_tasks
      list_all_files.each {|file|
        require file
        include_module_if_exists(file)
      }
    end

    private
    def include_module_if_exists(file)
      maybe_module = guess_module(file)
      if is_really_module?(maybe_module)
        include_the_module(maybe_module)
      end
    end

    def include_the_module(maybe_module)
      FileProcessor.send(:include, maybe_module)
    end

    def is_really_module?(maybe_module)
      maybe_module.class.name == "Module"
    end

    def guess_module(file)
      module_name = camelize(File.basename(file, ".*"))
      maybe_module = Task.const_get(module_name)
    end

    def list_all_files
      Dir["#{File.dirname(__FILE__)}/task/*.rb"]
    end

    def camelize(str)
      str.split('_').map {|w| w.capitalize}.join
    end
  end
end