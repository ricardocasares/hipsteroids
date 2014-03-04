var gulp = require('gulp');

var connect = require('gulp-connect');
var coffee = require('gulp-coffee');
var stylus = require('gulp-stylus');
var concat = require('gulp-concat');
var jade = require('gulp-jade');
var uglify = require('gulp-uglify');
var serve = require('gulp-serve');
var bower = require('gulp-bower');

var paths = {
  coffee: ['src/**/*.coffee'],
  styls: ['src/styls/*.styl'],
  jade: ['src/**/*.jade']
};

gulp.task('bower', function() {
  bower()
    .pipe(connect.reload());
});

gulp.task('scripts', function() {
  return gulp.src(paths.coffee)
    .pipe(coffee())
    .pipe(gulp.dest('./build'))
    .pipe(connect.reload());
});

gulp.task('jade', function() {
  gulp.src(paths.jade)
    .pipe(jade())
    .pipe(gulp.dest('./build'))
    .pipe(connect.reload());
});

// Get and render all .styl files recursively 
gulp.task('stylus', function() {
  gulp.src(paths.styls)
    .pipe(stylus({
      set: ['compress']
    }))
    .pipe(gulp.dest('./build/css'))
    .pipe(connect.reload());
});

gulp.task('connect', connect.server({
  root: ['build'],
  port: 3000,
  livereload: true
}));

// Rerun the task when a file changes
gulp.task('watch', function() {
  gulp.watch(paths.coffee, ['scripts']);
  gulp.watch(paths.styls, ['stylus']);
  gulp.watch(paths.jade, ['jade']);
});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['bower', 'scripts', 'stylus', 'jade', 'connect', 'watch']);