local function load(name)
  package.loaded[name] = nil
  require(name)
end

load('plugins/init')
load('plugins/config')
load('core/opts')
load('core/keymap')
load('core/autocmd')
