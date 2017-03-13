local Love = require 'src/services/love'
local Util = require 'src/services/util'

local CallOnSpawn = require 'src/systems/call-on-spawn'
local RegisterBody = require 'src/systems/register-body'
local RegisterCallbacks = require 'src/systems/register-callbacks'
local RegisterFixture = require 'src/systems/register-fixture'
local RegisterInputActions = require 'src/systems/register-input-actions'
local RegisterShape = require 'src/systems/register-shape'
local RegisterSprites = require 'src/systems/register-sprites'

local entity_directory = 'src/entities'

local get_entity_configs = function(directory)
  local entities = {}
  local file_list = Love.filesystem.getDirectoryItems(directory)
  for _, file_name in ipairs(file_list) do
    -- Ignore non-lua files
    if file_name:match('[^.]+$') == 'lua' then
      local file_name_without_ext = file_name:match('(.+)%..+')
      local entity = require(directory .. '/' .. file_name_without_ext)
      entities[file_name_without_ext] = entity
    end
  end
  return entities
end

local entity_configs = get_entity_configs(entity_directory)
local entities = {}

-- object (table) a map entity object {
--   name (string) entity config file
--   pos_x (number) spawn x coordinate
--   pos_y (number) spawn y coordinate
-- }
-- layer_index (number) what map layer to draw this in
local spawn = function(object, layer_index)
  local entity_config = entity_configs[object.name]
  assert(
    entity_config ~= nil,
    'Map entity reference "' .. object.name .. '" not found.'
  )

  -- Don't mutate the source config
  local entity = Util.copy(entity_config)
  -- Plovisionary table to write and track active inputs
  entity.input = {}
  -- Layer to draw player in. We could just get
  -- that information from the fixture collision
  -- group that was set but that collision group
  -- could change in special cases or on death.
  entity.draw_layer = layer_index

  RegisterBody(entity, object.pos_x, object.pos_y)
  RegisterCallbacks(entity)
  RegisterShape(entity)
  RegisterFixture(entity, layer_index)
  RegisterSprites(entity)
  RegisterInputActions(entity)
  table.insert(entities, entity)
  CallOnSpawn(entity)
end

return {
  list = entities,
  spawn = spawn
}
