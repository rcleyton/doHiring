const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  Popper: ['@popperjs/core', 'default']
}))

environment.loaders.get('nodeModules').exclude = /bootstrap-sass/

module.exports = environment

