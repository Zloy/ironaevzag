module Cucumber
  class Devilspie
    @@pid = nil 
    def self.spawn
      @@pid = Process.spawn 'devilspie -a 2>/dev/null' unless @@pid
    end
    def self.kill
      Process.kill 9, @@pid if @@pid
    end
  end
end

at_exit do
  Cucumber::Devilspie.kill
end
