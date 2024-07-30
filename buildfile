import pkgs = {*/ -*-tests/ -*-examples/ -upstream/}
import tests = {*-tests/ *-examples/}

./: $pkgs
./: $tests: install = false
