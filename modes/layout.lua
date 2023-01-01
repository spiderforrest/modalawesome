local awful = require("awful")

local layout_commands = {
  {
    description = "change client height factor",
    pattern = {'[ei]'},
    handler = function(_, movement)
      if movement == 'i' then
        awful.client.incwfact(-0.05)
      else
        awful.client.incwfact(0.05)
      end
    end
  },
  {
    description = "change master width factor",
    pattern = {'[no]'},
    handler = function(_, movement)
      if movement == 'n' then
        awful.tag.incmwfact(-0.05)
      else
        awful.tag.incmwfact(0.05)
      end
    end
  },
  {
    description = "change number of master clients",
    pattern = {'m', '%d*', '[ie]'},
    handler = function(_, _, count, movement)
      count = count == '' and 1 or tonumber(count)

      if movement == 'i' then
        awful.tag.incnmaster(count, nil, true)
      else
        awful.tag.incnmaster(-count, nil, true)

      end

    end
  },
  {
    description = "change number of columns",
    pattern = {'c', '%d*', '[ie]'},
    handler = function(_, _, count, movement)
      count = count == '' and 1 or tonumber(count)

      if  movement == 'i' then
        awful.tag.incncol(count, nil, true)
      else
        awful.tag.incncol(-count, nil, true)
      end
    end
  },
  {
    description = "change layout",
    pattern = {'%d*', '[ie]'},
    handler = function(_, count, movement)
      count = count == '' and 1 or tonumber(count)

      if  movement == 'i' then
        awful.layout.inc(count)
      else
        awful.layout.inc(-count)
      end
    end
  },
  {
    description = "change useless gap",
    pattern = {'g', '%d*', '[ie]'},
    handler = function(_, _, count, movement)
      count = count == '' and 1 or tonumber(count)

      if  movement == 'i' then
        awful.tag.incgap(count)
      else
        awful.tag.incgap(-count)
      end
    end
  },
  {
    description = "enter client mode",
    pattern = {'i'},
    handler = function(mode) mode.stop() end
  },
}

return layout_commands
