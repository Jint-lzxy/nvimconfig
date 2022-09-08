return {
	prefix = "clang-tidy",
	lintStdin = false,
	lintCommand = string.format(
		"%s -extra-arg=-I/Library/Developer/CommandLineTools/usr/include/c++/v1 ${INPUT}",
		"/usr/local/bin/clang-tidy"
	),
	lintFormats = { "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m" },
	rootMarkers = {},
}
