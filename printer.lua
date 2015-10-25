-- CNC

tool_e = 0
tool_e_restart = 0

function comment(text)
  output('; ' .. text)
end

function header()
  h = file('header.gcode')
  h = h:gsub( '<ZSAFE>', f(z_safe))
  output(h)
end

function footer()
   h = file('footer.gcode')
   h = h:gsub( '<ZSAFE>', f(z_safe))
   output(h)
end

function layer_start(zheight)
  output('; (<layer>)')
  output('G1 Z' .. f(-zheight))
end

function layer_stop()
end

function retract(tool,e) 
  return 0
end

function prime(tool,e)
  return 0
end

function select_tool(tool)
   output('T' .. f(tool) .. 'M6')
end

function swap_tool(from,to,x,y,z)
end

function move_xyz(x,y,z)
   output('G0 Z' .. f(z_safe))
   output('G0 X' .. f(x) .. ' Y' .. f(y))
   output('G1 Z' .. f(-z))
end

function move_xyze(x,y,z,e)
   output('G1 X' .. f(x) .. ' Y' .. f(y) .. ' Z' .. f(-z) .. ' F' .. current_frate)
end

function move_e(e)
end

function set_feedrate(feedrate)
  output('G1 F' .. feedrate)
  current_frate = feedrate
end

function extruder_start()
end

function extruder_stop()
end

function progress(percent)
end
