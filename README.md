silly [![Repository](https://img.shields.io/badge/repository-on%20GitLab-orange.svg)](https://gitlab.com/AntonMeep/silly) [![pipeline
status](https://gitlab.com/AntonMeep/silly/badges/master/pipeline.svg)](https://gitlab.com/AntonMeep/silly/commits/master) [![coverage
report](https://gitlab.com/AntonMeep/silly/badges/master/coverage.svg)](https://gitlab.com/AntonMeep/silly/commits/master) [![ISC
Licence](https://img.shields.io/badge/licence-ISC-blue.svg)](https://gitlab.com/AntonMeep/silly/blob/master/LICENSE) [![Package
version](https://img.shields.io/dub/v/silly.svg)](https://gitlab.com/AntonMeep/silly/tags)
=====

**silly** is a no-nonsense test runner for the D programming language. Instead of re-inventing the wheel and adding more and more levels of abstraction it just works, requiring as little effort from the programmer as possible.

# Features

- Easy to install and use with dub
- No changes of your code are required to start using silly
- Seamless integration with `dub test`

# Requirements

To be able to use silly in your project it has to satisfy the following requirements:

- It should be written in [D](https://dlang.org) and use latest [DMD](https://dlang.org/download.html#dmd) or [LDC](https://github.com/ldc-developers/ldc/releases) compiler (silly might work with older versions, but it's not guaranteed)
- It should use [DUB](https://dub.pm/)
- It should not define main function when built in unittest mode ([conditional compilation](https://dlang.org/spec/version.html) will help you here)
- Make sure there's no `targetType: executable` in `unittest` configuration in dub.json/dub.sdl. See [#12](https://gitlab.com/AntonMeep/silly/issues/12) for more info

# Installation

All you have to do in order to use silly in your project is add it to your dub.json/dub.sdl package file.

dub.json:
```json
{
	<...>
	"dependencies": {
		<...>
		"silly": "*"
	}
}
```

dub.sdl:
```sdl
<...>
dependency "silly" version="*"
```

# Usage

As soon as you added silly to dependencies of your project, you can run tests with `dub test`


# Command line options

```
dub test -- <options>

Options:
  --no-colours                    Disable colours
  -t <n>      --threads <n>       Number of worker threads. 0 to auto-detect (default)
  -i <regexp> --include <regexp>  Run tests if their name matches specified regular expression. See filtering tests
  -e <regexp> --exclude <regexp>  Skip tests if their name matches specified regular expression. See filtering tests
  -v          --verbose           Show verbose output (full stack traces and durations)
  -h          --help              Help information
```

# Filtering tests

With `--include` and `--exclude` options it's possible to control which tests will be run. These options take regular expressions in [std.regex'](https://dlang.org/phobos/std_regex.html#Syntax%20and%20general%20information) format.

`--include` only tests that match provided regular expression will be run, other tests will be skipped.
`--exclude` all of the tests that don't match provided regular expression will be run.

> Using both options at the same time will produce unexpected results!
