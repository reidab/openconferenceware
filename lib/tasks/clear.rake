desc "Clear everything"
task :clear => ["tmp:clear", "themes:cache:remove", "clear:cache"]

desc "Clear cache"
task "clear:cache" => :environment do
  Observist.expire
end
