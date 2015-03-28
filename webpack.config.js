module.exports = {
    context: __dirname + '/angular/app/',
    entry: './main.js',
    output: {
	path: 'assets/js/',
	filename: 'bundle.js'
    },
    module: {
	loaders: [
	    { test: /\.coffee$/, loader: "coffee-loader" }
	]
    },
    resolve: {
	extensions: ["", ".coffee", ".js"]
    }
};
