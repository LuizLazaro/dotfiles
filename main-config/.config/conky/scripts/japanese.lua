-- This is a lua script for use in Conky.
require 'cairo'

function conky_main ()
	if conky_window == nil then
			return
	end
	local cs = cairo_xlib_surface_create (conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
	cr = cairo_create (cs)



	line_width = 1.5
	line_cap = CAIRO_LINE_CAP_BUTT 	-- We don't need this any more after closing
									-- 		the path.
	line_join = CAIRO_LINE_JOIN_MITER -- but this will still affect how the lines
										--	look
	red, green, blue, alpha = 1, 1, 1, 1
	startx = 1
	starty = 250
	
	line1x = 1
	line1y = 280

	line2x = 100
	line2y = 280

	line3x = 100
	line3y = 250

	----------------------------
	cairo_set_line_width (cr, line_width)
	cairo_set_line_cap  (cr, line_cap)
	cairo_set_source_rgba (cr, red, green, blue, alpha)
	cairo_move_to (cr, startx, starty)
	cairo_line_to (cr, line1x, line1y)
	cairo_line_to (cr, line2x, line2y)
	cairo_line_to (cr, line3x, line3y)
	cairo_set_line_join (cr, line_join)
	cairo_close_path (cr)
	cairo_stroke (cr)




	-- 
	cairo_destroy (cr)
	cairo_surface_destroy (cs)
	cr = nil
end