--[[
	vrp_spawn_screen
    Copyright (C) 2018  VHdk

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 ]]
 dependency "vrp"

ui_page "nui/ui.html"

files {
	"nui/ui.html",
    "nui/background.jpg",
   	"nui/ui.js",
   	"nui/bootstrap.min.js",
   	"nui/bootstrap.min.css",
   	"nui/responsive.css",
}

client_script{
			"lib/Proxy.lua",
			"lib/Tunnel.lua",
			"ui.lua",
			"client.lua"
		}
server_script{
			"@vrp/lib/utils.lua",
			"server.lua"
		}