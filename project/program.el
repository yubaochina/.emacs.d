(require 'ede)
(global-ede-mode 1)
(ede-cpp-root-project "project_name"
		      :file "file_path"
		      :include-path  '("include_path"))
(global-semantic-idle-scheduler-mode 1)
