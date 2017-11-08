const gulp = require('gulp');
const browserSync = require('browser-sync');
const autoprefixer = require('gulp-autoprefixer');
const pug = require('gulp-pug');
const stylus = require('gulp-stylus');
const coffee = require('gulp-coffee');
const yamlData = require('gulp-yaml-data');
const concat = require('gulp-concat');
const spritesmith = require('gulp.spritesmith');
const csso = require('gulp-csso');
const uglify = require('gulp-uglify');
const babel = require('gulp-babel');


// Сервер - при изменениях файлов в заданных папках обновляет страницу в браузере
gulp.task('serve', ['pug:ru', 'pug:en', 'pug:de', 'pug:fr', 'pug:es', 'stylus', 'coffee', 'copy', 'sprite'], () => {
	browserSync.init({
			server: {
				baseDir: "./build/"
			}
	});


	gulp.watch('src/assets/', ['copy']);
	gulp.watch('src/**/*.styl', ['stylus']);
	gulp.watch('src/**/*.pug', ['pug:ru', 'pug:en', 'pug:de', 'pug:fr', 'pug:es']);
	gulp.watch('src/data/*.yml', ['pug:ru', 'pug:en', 'pug:de', 'pug:fr', 'pug:es', 'stylus']);
	gulp.watch('srs/assets/img/sprites/*.*', ['sprite']);
	gulp.watch('src/**/*.coffee', ['coffee']);
	gulp.watch('build/**/*.*').on('change', browserSync.reload);
});


// PUG
gulp.task('pug:ru', () => {
	return gulp.src('src/*.pug')
	.pipe(yamlData({
			property: 'data',
			src: ['src/data/ru.data.yml', 'src/data/contry.yml'],
			override: false 
	}))
	.pipe(pug({pretty: true}))
	.pipe(gulp.dest('build/ru'));
});

gulp.task('pug:en', () => {
	return gulp.src('src/*.pug')
	.pipe(yamlData({
			property: 'data',
			src: ['src/data/en.data.yml', 'src/data/contry.yml'],
			override: false 
	}))
	.pipe(pug({pretty: true}))
	.pipe(gulp.dest('build/en'));
});

gulp.task('pug:de', () => {
	return gulp.src('src/*.pug')
	.pipe(yamlData({
			property: 'data',
			src: ['src/data/de.data.yml', 'src/data/contry.yml'],
			override: false 
	}))
	.pipe(pug({pretty: true}))
	.pipe(gulp.dest('build/de'));
});

gulp.task('pug:fr', () => {
	return gulp.src('src/*.pug')
	.pipe(yamlData({
			property: 'data',
			src: ['src/data/fr.data.yml', 'src/data/contry.yml'],
			override: false 
	}))
	.pipe(pug({pretty: true}))
	.pipe(gulp.dest('build/fr'));
});

gulp.task('pug:es', () => {
	return gulp.src('src/*.pug')
	.pipe(yamlData({
			property: 'data',
			src: ['src/data/es.data.yml', 'src/data/contry.yml'],
			override: false 
	}))
	.pipe(pug({pretty: true}))
	.pipe(gulp.dest('build/es'));
});

// STYLUS
gulp.task('stylus', () => {
	return gulp.src('src/assets/*.styl')
	.pipe(stylus())
	.pipe(autoprefixer())
	.pipe(csso())
	.pipe(gulp.dest('build/css/'));
});

// COFFEE
gulp.task('coffee', () => {
	return gulp.src('src/**/*.coffee')
	.pipe(coffee())
	.pipe(babel())
	.pipe(concat('main.js'))
	//.pipe(uglify())  Не работает в ie 7
	.pipe(gulp.dest('build/js/'));
});

// COPY
gulp.task('copy', () => {
	gulp.src('src/assets/font/**/*')
		.pipe(gulp.dest('build/font'));
	gulp.src('src/assets/img/**/*')
		.pipe(gulp.dest('build/img'));
	gulp.src('src/assets/vendor/**/*')
		.pipe(gulp.dest('build/vendor'));
	gulp.src('src/assets/server-file/**')
		.pipe(gulp.dest('build'));
	gulp.src('src/assets/server-file/.htaccess')
		.pipe(gulp.dest('build'));
});

// SPRITE
gulp.task('sprite', function () {
	var spriteData = gulp.src('src/assets/img/sprites/*.png').pipe(spritesmith({
		imgName: 'sprite.png',
		cssName: 'sprite.css'
	}));
	return spriteData.pipe(gulp.dest('build/modules/sprite'));
});

gulp.task('default', ['serve']);