module.exports = (grunt) ->

	srcBase = "v2/frontend"

	grunt.initConfig

		# config:
		paths:
			src: "static/src"
			dest: "static/build"

		pkg: grunt.file.readJSON("package.json")

		watch:
			livereload:
				options:
					livereload: 35741
				files: ["<%= paths.dest %>/**/*"]
			js:
				files: ["<%= paths.src %>/coffee/{,**}/*.coffee"]
				tasks: ["coffee"]
			css:
				files: ["<%= paths.src %>/sass/{,**}/*.{sass,scss}"]
				tasks: ["compass"]
			# copy:
			# 	files: ["<%= paths.src %>/*"]
			# 	tasks: ["copy"]

		coffee:
			compile:
				options:
					join: true
				files: [
					"<%= paths.dest %>/scripts/main.js": [
						"<%= paths.src %>/coffee/global/*.coffee"
						"<%= paths.src %>/coffee/modules/*.coffee"
						"<%= paths.src %>/coffee/pages/*.coffee"
					]
					# {
					# 	expand: true # Enable dynamic expansion.
					# 	cwd: "<%= paths.src %>/coffee/pages/" # Src matches are relative to this path.
					# 	src: ["*.coffee"] # Actual pattern(s) to match.
					# 	dest: "<%= paths.dest %>/scripts/pages/" # Destination path prefix.
					# 	ext: ".js" # Dest filepaths will have this extension.
					# }
				]


		sass:
			dist:
				options:
					style: 'expanded'
				files:
					"<%= paths.dest %>/styles/main.css": "<%= paths.src %>/sass/styles.scss"

		compass:
			dist:
				options:
					noLineComments: false
					# debugInfo: true
					sassDir: '<%= paths.src %>/sass'
					cssDir: '<%= paths.dest %>/styles'
					environment: 'development'

		concurrent:
			compile:
				tasks: [
					'coffee'
					'compass'
				]
			server:
				tasks: [
					# 'php'
					'watch'
				]
				options:
					logConcurrentOutput: true


	grunt.loadNpmTasks("grunt-contrib-coffee")
	grunt.loadNpmTasks("grunt-contrib-watch")
	grunt.loadNpmTasks("grunt-contrib-compass")
	grunt.loadNpmTasks("grunt-notify")


	grunt.registerTask "default", [
		"compass",
		"coffee",
		"watch",
		# "concurrent:compile"
		# "concurrent:server"
	]


# npm install --save-dev \
# grunt-contrib-coffee \
# grunt-contrib-watch \
# grunt-contrib-sass \
# grunt-contrib-copy \
# grunt-notify