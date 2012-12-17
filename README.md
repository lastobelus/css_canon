# css_canon

Imposes a "canonical" css/sass/[SMACSS][2] structure on a Rails 3.x project.

* Assumes using [Zurb Foundation][1]. Pull requests for Bootstrap or other frameworks welcome.
* imposes the following directory structures
```
├── app
│   ├── assets
│   │   └── stylesheets
│   │       ├── application.css.scss
│   │       ├── base.css.scss
│   │       ├── foundation_and_overrides.scss
│   │       ├── home.css.scss
│   │       ├── layout
│   │       │   └── grid_additions.css.scss
│   │       ├── module
│   │       │   └── 
│   │       └── vendor_overrides
│   │           └── 
└── vendor
    ├── assets
    │   └── stylesheets
    │       ├── non_sass
    │       │   └──
    │       ├── sass
    │       │   └──
    │       └── vendor.css
```

## Example
For an example rails app using this structure, see [this repo][3]
## Installation

Add this line to your application's Gemfile:

    gem 'css_canon'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install css_canon

## Usage

    rails g css_canon

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[1]: https://github.com/zurb/foundation "Zurb Foundation"
[2]: http://smacss.com "Scalable and Modular Architecture for CSS"
[3]: https://github.com/lastobelus/assets_css_structure "Example Rails app using the css_canon setup"