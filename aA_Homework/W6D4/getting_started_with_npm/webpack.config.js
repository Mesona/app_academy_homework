const path = require('path');

module.exports = {
  entry: "./app.jsx",
  devtool: 'sourcemap',
  resolve: {
    extensions: ['.js', '.jsx', '*']
  },
  output: {
    filename: "bundle.js"
  },
  module: {
    rules: [
      {
        use: {
          loader: 'babel-loader',
          query: {
            presets: ['@babel/env', '@babel/react']
          }
        },
      }
    ]
  },
}
