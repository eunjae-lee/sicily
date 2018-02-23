module Sicily
  Sicily.register_generator do |generator|
    generator.filename = "rules.rb"
    generator.content = <<-EOF
Sicily.on "~/your_folder" do
  fit_if_photo 2000, 2000
  google_photo
  mv "~/your_another_folder/%Y/%m/%d"
end

Sicily.on "~/your_folder2" do
  fit_if_photo 1000, 1000
  cp "~/your_another_folder/%Y/%m/%d"
end
    EOF
  end
end