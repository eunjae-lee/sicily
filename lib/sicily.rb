# frozen_string_literal: true

require 'sicily/version'
require 'sicily/path_helper'
require 'sicily/logger'
require 'sicily/config'
require 'sicily/monitor'
require 'sicily/monitor_wrapper'
require 'sicily/generator'
require 'sicily/util/file_util'
require 'sicily/task_loader'
require 'sicily/error/monitor_error'

module Sicily
  Sicily.load_all_tasks
  Sicily.load_all_configs

  def self.on(path, &user_rule_block)
    MonitorWrapper.on path, &user_rule_block
  end
end
