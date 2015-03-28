module.exports = {
    context: __dirname + '/assets/app/',
    entry: './index.js',
    output: {
	path: __dirname + '/static/app/',
	filename: 'bundle.js'
    }
};
