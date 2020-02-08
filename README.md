# parcel-plugin-elm-svg

[![npm version](https://img.shields.io/npm/v/parcel-plugin-elm-svg.svg)](https://www.npmjs.com/package/parcel-plugin-elm-svg) [![GitHub license](https://img.shields.io/npm/l/parcel-plugin-elm-svg)](LICENSE)

This parcel plugin automatically generates Elm modules out of your SVG files so you can easily inline icons in your Elm app without having to use Image elements. 

This technique allows you to [tweak your icons on a per-usage basis](https://github.com/pinata-llc/svg2elm#svg-attributes), so you can reuse your icon in different places of your app where you might need different colors, sizes, line widths, you name it!

This plugin is a thin wrapper around our [svg2elm](https://github.com/pinata-llc/svg2elm) tool that solves one specific use case. However, you might be interested in using `svg2elm` if you are using a different bundler, or you need improved flexibility.

<img alt="showcase gif" src="https://i.imgur.com/nQFVP9I.gif">


## Installation

Add `parcel-plugin-elm-svg` as a development dependency to your project:

```console
$ npm install -D parcel-plugin-elm-svg
```


## How to use

### Module configuration 

Open up your `package.json` file and add:

```json
    "elmSvgModules": [
        {
            "src": "assets/*.svg",
            "name": "Acme.Icons",
            "dest": "src/Acme/Icons.elm"
        }
    ]
```

This configuration will take all `.svg` files under the `assets` directory and generate an `Acme.Icons` Elm module at `src/Acme/Icons.elm` with a function per file.


Tweak module properties to match your needs:

<table>
    <tr>
        <td>src</td>
        <td>A glob matching the SVG files to include in this module. <a href="https://www.npmjs.com/package/glob#glob-primer">Check out the rules</a>.</td>
    </tr>
    <tr>
        <td>name</td>
        <td>The name of the Elm module to generate.</td>
    </tr>
    <tr>
        <td>dest</td>
        <td>The destination file path for your generated module.</td>
    </tr>
</table>

#### Multiple modules

If you have different sets of assets, you can generate multiple Elm modules:

```json
    "elmSvgModules": [
        {
            "src": "assets/accounts/*.svg",
            "name": "Acme.Assets.Accounts",
            "dest": "src/Acme/Assets/Accounts.elm"
        },
        {
            "src": "assets/shapes/*.svg",
            "name": "Acme.Assets.Shapes",
            "dest": "src/Acme/Assets/Shapes.elm"
        }
    ]
```

Since 0.19, Elm performs [Dead Code Elimination](https://elm-lang.org/news/small-assets-without-the-headache#dead-code-elimination); this means that you don't have to worry about separating assets by bundle. Only the used assets are shipped to production. However, you might still want to do this for your own code organization. 

### Running

Run parcel as you usually would:

```console
$ parcel src/app.html
```

### Using your icons

We can now use our generated icon functions in our Elm app:

```elm
module Main exposing (main)

import Html
import Svg.Attributes exposing (fill, width, stroke)
import Acme.Icons exposing (user, chevron)

main = 
    Html.div [] 
        [ user [ fill "red" ]
        , chevron [ stroke "red" ]
        , user [ fill "blue", width "20" ]
        ]
```

Check out [svg2elm](https://github.com/pinata-llc/svg2elm) docs and the [example](example) app for more information. 

We hope you enjoy the plugin!

## Contributing

PRs and Issues are welcome!

Bugs or Feature Requests related to the parcel plugin must be raised in [this repository](https://github.com/pinata-llc/parcel-plugin-elm-svg). 

If your assets are not getting converted to Elm functions properly, the problem is likely to exist in [svg2elm](https://github.com/pinata-llc/svg2elm) instead. For example, if your generated Elm module does not compile, or the Svg does not look as it should, please raise your PR or issue in the [svg2elm](https://github.com/pinata-llc/svg2elm) repository.

## License

BSD-3-Clause. See the [LICENSE](LICENSE) file.

## Humans

Built by [Piotr Brzeziński](https://github.com/brzezinskip) and [Agustín Zubiaga](https://github.com/aguzubiaga) at [PINATA.](https://www.gopinata.com)

♥︎