# frozen_string_literal: true

module Sicily
  class TaskLoader
    def load_all_tasks
      list_all_files.each do |file|
        require file
        include_module_if_exists(file)
      end
    end

    private

    def include_module_if_exists(file)
      maybe_module = guess_module(file)
      include_the_module(maybe_module) if really_module?(maybe_module)
    end

    def include_the_module(maybe_module)
      FileProcessor.send(:include, maybe_module)
    end

    def really_module?(maybe_module)
      maybe_module.class.name == 'Module'
    end

    def guess_module(file)
      module_name = camelize(File.basename(file, '.*'))
      Task.const_get(module_name)
    end

    def list_all_files
      Dir["#{File.dirname(__FILE__)}/task/*.rb"]
    end

    def camelize(str)
      str.split('_').map(&:capitalize).join
    end
  end
end
