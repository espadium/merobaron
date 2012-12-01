# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "merobaron"
  config.vm.network :hostonly, "192.168.134.8"
  config.vm.share_folder("repo", "/app", ".")
  config.vm.forward_port 9292, 9292
  config.vm.forward_port 9393, 9393
  config.vm.forward_port 9494, 9494
  config.vm.forward_port 1080, 1080
end
# # }
