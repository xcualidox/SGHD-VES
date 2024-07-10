const gulp = require('gulp');
const imagemin = require('gulp-imagemin');
const pngquant = require('imagemin-pngquant');
const mozjpeg = require('imagemin-mozjpeg');
const rename = require('gulp-rename');
const webp = require('imagemin-webp');

gulp.task('imagemin', () => {
  return gulp.src('images/**/*')
    .pipe(imagemin([
      pngquant({quality: [0.5, 0.5]}),
      mozjpeg({quality: 50}),
    ]))
    .pipe(gulp.dest('images/'));
});

gulp.task('webp', () => {
    return gulp.src('images/**/*') 
      .pipe(imagemin([
        webp({quality: 50})
      ]))
      .pipe(rename({ extname: '.webp' })) // Cambia la extensión de los archivos a .webp
      .pipe(gulp.dest('images/')) // Guarda las imágenes WebP en un directorio separado
});

gulp.task('default', gulp.series('imagemin', 'webp'));
