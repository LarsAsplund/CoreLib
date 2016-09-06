-- EMACS settings: -*-  tab-width: 2;indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2;replace-tabs off;indent-width 2;
-- =============================================================================
-- Authors:					Patrick Lehmann
--
-- Package:     		Protected type implementations.
--
-- Description:
-- -------------------------------------
-- .. TODO:: No documentation available.
--
-- License:
-- =============================================================================
-- Copyright 2007-2016 Patrick Lehmann - Dresden, Germany
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--		http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- =============================================================================

library CoreLib;
use			work.DataStructures.all;

entity DataStructures_Integer_List_tb is
end entity;

architecture test of DataStructures_Integer_List_tb is
	-- shared variable	GlobalStdOut	: T_STDOUT;
	shared variable List1					: Integer_List;
begin
	process
		variable index		: INTEGER;
		variable element	: INTEGER;
	begin
		List1.Init;
		
		for i in 0 to 67 loop
			element := i + 1;
			GlobalStdOut.PrintLine("Append " & INTEGER'image(element));
			index		:= List1.Append(element);
			GlobalStdOut.PrintLine("  index= " & INTEGER'image(index));
			
			index		:= List1.IndexOf(element);
			List1.Set(index, element + 100);
			element	:= List1.Get(i);
			GlobalStdOut.PrintLine("  IndexOf -> " & INTEGER'image(index));
			GlobalStdOut.PrintLine("  Get -> " & INTEGER'image(element));
		end loop;
		for i in 54 downto 27 loop
			GlobalStdOut.PrintLine("RemoveAt " & INTEGER'image(i));
			List1.RemoveAt(i);
		end loop;
		for i in 20 downto 7 loop
			GlobalStdOut.PrintLine("Remove " & INTEGER'image(i + 101));
			List1.Remove(i + 101);
		end loop;
		wait;
	end process;
end architecture;
