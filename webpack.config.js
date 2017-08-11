module.exports = {
  entry: {
    site: './source/javascripts/site.js',
  },

  output: {
    path: __dirname + '/.tmp/dist',
    filename: 'javascripts/[name].js',
  },

  module: {
    rules: [{
      test: /source\/javascripts\/*\.js$/,
      loader: 'babel-loader',
      exclude: /node_modules|\.tmp|vendor/
    }]
  }
};
