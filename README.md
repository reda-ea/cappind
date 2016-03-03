Tools like zenity and yad can easily make simple scripts completely graphical, by providing many GUI elements easily accessible by command line.

However, none of them supports ubuntu appindicators (yet).

This little script does just that.

### How to use

The tool takes input from stdin as multiple lines with the format

```
menu:submenu:subsubmenu:...:entry
```

an empty entry meaning a separator

The implied menu structure is automatically created (so no need for a hierarchical input, each line specifies the whole path).

When an entry is selected by the user, the whole path is printed to stdout, which must be piped to something that will execute the actual menu actions.

By default, the menu will close when an entry is selected, the `-p` flag can make the menu persistant, adding a "Quit" element at the end (the quit menu doesnt print anything, it just closes the program (and its stdout :) ).

Other available flags:

* `-i` to choose the display icon, this should be the name of an icon from the theme - not a path to an image file, default is "terminal" (since this is invoked from a script)
* `-l` to add a label next to the indicator icon (which i wouldn't recommend since a lot of label indicators would quickly fill the top panel),
* `-t` to specify a timeout in seconds (the indicator will disappear after that).

_That's it._

### Examples

The download contains a few (mostly undocumented) examples

**OR** 

they can be found [over here](https://github.com/reda-ea/cappind/tree/master/examples)

### Download

You can download this project in either [zip](https://github.com/reda-ea/cappind/zipball/master) or [tar](https://github.com/reda-ea/cappind/tarball/master) formats.

You can also clone the project with Git by running:

```
git clone git://github.com/reda-ea/cappind
```
