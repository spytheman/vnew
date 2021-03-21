import os
import flag

fn main() {
	mut fp := flag.new_flag_parser(os.args)
	fp.application(os.file_name(os.executable()))
	fp.version('1.0.0')
	fp.description('Create new files or folders (folders end with `/`).')
	fp.arguments_description('[FILE_or_FOLDER]...')
	fp.skip_executable()
	if fp.bool('help', `h`, false, 'Show this help screen.') {
		println(fp.usage())
		exit(0)
	}
	paths := fp.finalize() or {
		eprintln('Error: $err')
		exit(1)
	}
	for path in paths {
		path_splits := path.split('/')
		path_parent_folder := path_splits[0..path_splits.len - 1].join('/')
		os.mkdir_all(path_parent_folder) ?
		if !path.ends_with('/') && !os.is_file(path) {
			(os.create(path) or { continue }).close()
		}
	}
}
