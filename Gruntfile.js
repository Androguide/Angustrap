module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        uglify: {
            options: {
                banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
            },
            build: {
                src: 'app/<%= pkg.name %>.js',
                dest: 'app/<%= pkg.name %>.min.js'
            }
        },

        concat: {
            options: {
                separator: '.\n\n'
            },
            dist: {
                src: ['directives/module.coffee', 'directives/*/*.coffee'],
                dest: '<%= pkg.name %>.combined.coffee'
            }
        },

        coffee: {
           compileWithMaps: {
                options: {
                  join: true
                },
                files: {
                  'app/<%= pkg.name %>.js': '<%= pkg.name %>.combined.coffee' // 1:1 compile
                }
            }
        },

        watch: {
          scripts: {
            files: ['directives/*/*.coffee'],
            tasks: ['concat', 'coffee', 'uglify']
          }
        }
    });

    // Load the plugin that provides the "uglify" task.
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-concat');

    // Default task(s).
    grunt.registerTask('default', ['coffee', 'uglify']);
};