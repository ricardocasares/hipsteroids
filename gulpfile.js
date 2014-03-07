var gulp = require('gulp');

var connect = require('gulp-connect');
var coffee = require('gulp-coffee');
var stylus = require('gulp-stylus');
var concat = require('gulp-concat');
var jade = require('gulp-jade');
var notify = require('gulp-notify');
var changed = require('gulp-changed');
var plumber = require('gulp-plumber');
var uglify = require('gulp-uglify');
var serve = require('gulp-serve');
var bower = require('gulp-bower');

var paths = {
  coffee: {
    src: ['src/**/*.coffee'],
    dst: './build'
  },
  stylus: {
    src: ['src/styls/*.styl'],
    dst: './build/css'
  },
  jade: {
    src: ['src/**/*.jade'],
    dst: './build'
  }
};

gulp.task('bower', function() {
  bower()
    .pipe(connect.reload());
});

gulp.task('scripts', function() {
  return gulp.src(paths.coffee.src)
    .pipe(plumber())
    .pipe(coffee().on('error', notify.onError(function(error) {
      return error;
    })))
    .pipe(changed(paths.coffee.dst))
    .pipe(gulp.dest(paths.coffee.dst))
    .pipe(connect.reload());
});

gulp.task('jade', function() {
  gulp.src(paths.jade.src)
    .pipe(jade().on('error', notify.onError(function(error) {
      return error;
    })))
    .pipe(changed(paths.jade.dst))
    .pipe(gulp.dest(paths.jade.dst))
    .pipe(connect.reload());
});

// Get and render all .styl files recursively 
gulp.task('stylus', function() {
  gulp.src(paths.stylus.src)
    .pipe(stylus({
      set: ['compress']
    }).on('error', notify.onError(function(error) {
      return error;
    })))
    .pipe(changed(paths.stylus.dst))
    .pipe(gulp.dest(paths.stylus.dst))
    .pipe(connect.reload());
});

gulp.task('connect', connect.server({
  root: ['build'],
  port: 3000,
  livereload: true
}));

// Rerun the task when a file changes
gulp.task('watch', function() {
  gulp.watch(paths.coffee.src, ['scripts']);
  gulp.watch(paths.stylus.src, ['stylus']);
  gulp.watch(paths.jade.src, ['jade']);
});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['scripts', 'stylus', 'jade', 'connect', 'watch']);