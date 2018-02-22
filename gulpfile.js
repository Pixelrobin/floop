const gulp = require("gulp");
const filterBy = require("gulp-filter-by");
const print = require("gulp-print");
const flatten = require("gulp-flatten");

gulp.task('default', ["gms2"]);

gulp.task("gms2", function defaultTask(done) {
	gulp.src('./src/gms2/scripts/**/*.gml')
		.pipe(filterBy(function(file) {
			var toship =  file.contents.toString().indexOf('@shipit') > -1;
			return toship;
		}))
		.pipe(flatten())
		.pipe(print.default())
		.pipe(gulp.dest("./dist/gms2"))
});