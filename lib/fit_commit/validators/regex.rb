require "fit_commit/validators/base"

# A validator can also validate the commit message as a whole:
module FitCommit
	module Validators
		class MyCustomValidator < Base
			def validate(lines)
				if lines.none? { |line| line.text =~ /^(CATS-)\d{5,} [A-Z](\w*)\b(?<!ing|ed|s)\s(?!for\s)(\w|\W){15,80}(\n\n|\z)/ }
					add_warning(lines.last.lineno, "Format not proper.")
				end
			end
		end
	end
end
