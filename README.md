# Dropzone 3 Plugin For Android Assets

Plugin for [Aptonic's Dropzone 3](https://aptonic.com/dropzone3/). Prepares android assets for 1-click import to Android Studio.
Works with files exported from Sketch 3. It is very minimalistic an handles just one use case (mine).

### Features

- Handles [Sketch3](http://bohemiancoding.com/sketch/) default export
- Compresses with [optipng](http://optipng.sourceforge.net/)
- Replaces special characters with underscore `_`

### Example input

Folder with files:

    ├── green grass_hdpi.png
    ├── green grass_mdpi.png
    ├── green grass_xhdpi.png
    ├── green grass_xxhdpi.png
    └── green grass_xxxhdpi.png
    
### Example output

    ├── drawable-hdpi
    │   └── green_grass.png
    ├── drawable-mdpi
    │   └── green_grass.png
    ├── drawable-xhdpi
    │   └── green_grass.png
    ├── drawable-xxhdpi
    │   └── green_grass.png
    ├── drawable-xxxhdpi
    │   └── green_grass.png


### System requirements

- OS X (obviously)
- [Dropzone 3](https://aptonic.com/dropzone3/)
- optipng installed to `/usr/local/bin/optipng`. Install with brew:

    `brew install optipng`
    
### Contributing

https://github.com/aptonic/dropzone3-actions/blob/master/README.md
