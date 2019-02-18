module.exports = {
  entry: {
    site: './source/javascripts/site.js',
  },

  output: {
    path: __dirname + '/.tmp/dist',
    filename: 'javascripts/[name].js',
  },

  module: {
    rules: [
      {
        test: /source\/javascripts\/*\.js$/,
        exclude: /node_modules|\.tmp|vendor/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env']
          }
        }
      }
    ]
  }
};
