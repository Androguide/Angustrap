module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        uglify: {
            options: {
                banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
            },
            build: {
                src: '<%= pkg.name %>.js',
                dest: 'app/<%= pkg.name %>.min.js'
            }
        },
    

        coffee: {
           compileWithMaps: {
                options: {
                  join: true
                },
                files: {
                  '<%= pkg.name %>.js': '<%= pkg.name %>.coffee' // 1:1 compile
                  //'<%= pkg.name %>.combined.js': ['directives/*/*.coffee', 'directives/*/*.coffee'] // concat then compile into single file
                }
            }
        },

        watch: {
          scripts: {
            files: ['angustrap.js'],
            tasks: ['uglify']
          }
        }
    });

    // Load the plugin that provides the "uglify" task.
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-watch');

    // Default task(s).
    grunt.registerTask('default', ['coffee', 'uglify']);
};