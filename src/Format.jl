__precompile__()

module Format

import Base.show
using Compat
using Compat.Printf

export FormatSpec, FormatExpr, printfmt, printfmtln, format, generate_formatter
export pyfmt, cfmt, fmt
export fmt_default, fmt_default!, reset!, default_spec, default_spec!

# Deal with mess from #16058
# Later, use Strs package!
isdefined(Main, :ASCIIStr) || (const ASCIIStr = String)
isdefined(Main, :UTF8Str)  || (const UTF8Str = String)
isdefined(Main, :AbstractChar) || (const AbstractChar = Char)

_stdout() = @static VERSION < v"0.7.0-DEV" ? STDOUT : stdout

include("cformat.jl" )
include("fmtspec.jl")
include("fmtcore.jl")
include("formatexpr.jl")
include("fmt.jl")

end # module Format
