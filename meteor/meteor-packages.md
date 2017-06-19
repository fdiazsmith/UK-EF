# Packages in Meteor
## How to deal with packages that are not yet hosted on Atmosphere.js

Instead of having a bower.json file. It is best to include packages using NPM. Most libraries that can be found on bower and also be found in NPM.

To inlcude them. simply add the package by doing `meteor npm install --save <package-name>`
Doing this you simply need to add your package to you folders by doing `import Package as "Package"`
