module Sicily
  Sicily.register_generator do |generator|
    generator.filename = ".sicily.god"
    generator.content = <<-EOF
God.watch do |w|
  w.name = "sicily"
  w.start = "sicily monitor"
  w.dir = File.expand_path("\#{File.dirname(__FILE__)}/..")
  w.keepalive
end
    EOF
  end
end