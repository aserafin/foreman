file pkg("foreman-systemd-#{version}.gem") => distribution_files do |t|
  sh "gem build foreman.gemspec"
  sh "mv foreman-systemd-#{version}.gem #{t.name}"
end

task "gem:build" => pkg("foreman-systemd-#{version}.gem")

task "gem:clean" do
  clean pkg("foreman-systemd-#{version}.gem")
end

task "gem:release" => "gem:build" do |t|
  sh "gem push #{pkg("foreman-systemd-#{version}.gem")} || echo 'error'"
end
