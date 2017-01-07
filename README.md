[entities]: https://bitbucket.org/cggaertner/cstuff

# lua-resty-htmlentities
Backport the [entities] to luajit with the ffi binding as the entities to UTF-8 decoder.

Table of Contents
-----------------
* [Status](#status)
* [Install](#install)
* [Usage](#usage)
* [Contributing](#contributing)
* [Author](#author)
* [License](#license)

Status
====
[![Build Status](https://travis-ci.org/detailyang/lua-resty-htmlentities.svg?branch=master)](https://travis-ci.org/detailyang/lua-resty-htmlentities)

Production Ready

Install
=======

```bash
make && make install
```

Usage
====
Make sure `htmlentities.lua` and `libhtmlentities.so` is in the `package.cpath` and `package.path`

```bash
local htmlentities_decoder = htmlentities.new()
local htmlentities_decode = htmlentities_decoder.decode

htmlentities_decode("&amp;")
```

Contributing
------------

To contribute to lua-resty-htmlentities, clone this repo locally and commit your code on a separate branch.

PS: PR Welcome :rocket: :rocket: :rocket: :rocket:


Author
------

> GitHub [@detailyang](https://github.com/detailyang)


License
-------
lua-resty-htmlentities is licensed under the [MIT] license.

[MIT]: https://github.com/detailyang/ybw/blob/master/licenses/MIT
