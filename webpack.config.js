module.exports = {
    context: __dirname + '/angular/app/',
    entry: './app.js',
    output: {
	path: 'assets/js/',
	filename: 'bundle.js'
    },
    module: {
	loaders: [
	    { test: /\.coffee$/, loader: "coffee" }
	]
    },
    resolve: {
	extensions: ["", ".web.coffee", ".web.js", ".coffee", ".js"]
    }
};
