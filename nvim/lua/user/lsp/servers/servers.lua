local sumneko_lua = require('user.lsp.servers.sumneko_lua')
local rust_analyzer = require('user.lsp.servers.rust_analyzer')
local tsserver = require('user.lsp.servers.tsserver')
local gopls = require('user.lsp.servers.gopls')
local bashls = require('user.lsp.servers.bashls')
local dockerls = require('user.lsp.servers.dockerls')

local servers = {
  sumneko_lua = sumneko_lua,
  rust_analyzer = rust_analyzer,
  tsserver = tsserver,
  gopls = gopls,
  bashls = bashls,
  dockerls = dockerls,
}

return servers
