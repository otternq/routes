task :init do
  dir = Dir.pwd

  FileUtils.mkdir_p "#{dir}/log"
  FileUtils.mkdir_p "#{dir}/tmp/sockets"
  FileUtils.mkdir_p "#{dir}/tmp/pids"
end

namespace :unicorn do
  task :start do
    dir = Dir.pwd

    sh "unicorn -c #{dir}/unicorn.rb -E development -D"
  end

  task :stop do
    dir = Dir.pwd
    sh "cat #{dir}/tmp/pids/unicorn.pid | xargs kill -QUIT"
  end
end

namespace :db do
  task :install do

  end
end
