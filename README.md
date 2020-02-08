# parcel-plugin-elm-svg

[![npm version](https://img.shields.io/npm/v/parcel-plugin-elm-svg.svg)](https://www.npmjs.com/package/svg2elm) [![GitHub license](https://img.shields.io/npm/l/parcel-plugin-elm-svg)](LICENSE)


This parcel plugin automatically generates Elm modules out of your SVG files so you can easily inline icons in your Elm app without having to use Image elements. 

This allows you to [tweak your icons on a per usage basis](https://github.com/pinata-llc/svg2elm#svg-attributes), so you can reuse your icon in different places of your app where you might need different colors, sizes, line widths, you name it!

This is a thin wrapper around our [svg2elm](https://github.com/pinata-llc/svg2elm) tool, it solves one specific use case. However, you might be intersted in using `svg2elm` directly 


## Installation

Add `parcel-plugin-elm-svg` as a development dependency to your project:

```console
$ npm install -D parcel-plugin-elm-svg
```


## How to use

### Module configuration 

Open up your `package.json` file and add:

```json
{
    ...

    "elmSvgModules": [
        {
            "src": "assets/*.svg",
            "name": "Acme.Icons",
            "dest": "src/Acme/Icons.elm"
        }
    ]
}
```

This configuration will take all `.svg` files under the `assets` directory and generate an `Acme.Icons` Elm module at `src/Acme/Icons.elm` with a function per file.


Tweak module properties to match your needs:

<table>
    <tr>
        <td>src</td>
        <td>A glob matching the SVG files to include in this module</td>
    </tr>
    <tr>
        <td>name</td>
        <td>The name of the Elm module to generate</td>
    </tr>
    <tr>
        <td>dest</td>
        <td>The destination file path for your generated module</td>
    </tr>
</table>

### Running

Just run parcel as you normally would:

```console
$ parcel src/app.html
```

### Usage from Elm

We can now use our generated icon functions in our Elm app:

```elm
module Main exposing (main)

import Html
import Acme.Icons exposing (user, chevron)

main = 
    Html.div [] 
        [ user [ fill "red" ]
        , chevron []
        , user [ fill "blue", transform "rotate(90)" ]
        ]
```



## Example

Check out the example app 

## License

BSD-3-Clause. See [LICENSE](LICENSE) file.

## Humans

Built by [Piotr Brzeziński](https://github.com/brzezinskip) and [Agustín Zubiaga](https://github.com/aguzubiaga) at [PINATA.](https://www.gopinata.com)

♥︎